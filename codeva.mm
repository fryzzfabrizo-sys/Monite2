#define PATCH_MODE
#import <Foundation/Foundation.h>
#include <string>
#include <dlfcn.h>
#include <mach-o/loader.h>
#include <Foundation/Foundation.h>
#include <CommonCrypto/CommonDigest.h>
#include <unordered_map>
#include <sstream>
#import <iomanip>
#include <vector>
#include "framework_output.h"
#include "Obfuscate.h"
#include "load/globals.h"

#ifdef PATCH_MODE
#import "va.h"
#else
#import "codeva.h"
#endif

#define INIT_PATCH_NAME _kTx39QpAV7re

// ========== ORIGINAL FUNCTION POINTERS ==========
bool (*force120fpsoriginal)(void* _this) = nullptr;
bool (*resetguestoriginal)(void* _this) = nullptr;
bool (*orig_get_InSwapWeaponCD)(void* _this) = nullptr;
void (*orig_KHHMBLDMKEN)(void* _this, Vector3* vec, float a, float b) = nullptr;

// ========== HOOK FUNCTIONS ==========
bool force120fpshook(void* _this) {
    if (forceHighFPS) return true;
    else return false;
}

bool resetguesthook(void* _this) {
    if (resetguest) return true;
    else return false;
}

bool hook_get_InSwapWeaponCD(void* _this) {
    if (swapweapon) return false;
    else return orig_get_InSwapWeaponCD(_this);
}

void hook_KHHMBLDMKEN(void* _this, Vector3* vec, float a, float b) {
    if (norecoil) return;
    orig_KHHMBLDMKEN(_this, vec, a, b);
}

// ========== UTILITY FUNCTIONS ==========
std::string sha256(const void* data, size_t len) {
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data, (CC_LONG)len, hash);
    std::ostringstream ss;
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i)
        ss << std::hex << std::setw(2) << std::setfill('0') << (int)hash[i];
    return ss.str();
}

bool read_exact_macho_header(const char* path, std::vector<uint8_t>& out_header) {
    FILE* file = fopen(path, "rb");
    if (!file) return false;
    struct mach_header_64 mh;
    if (fread(&mh, 1, sizeof(mh), file) != sizeof(mh)) { fclose(file); return false; }
    if (mh.magic != MH_MAGIC_64) { fclose(file); return false; }
    const size_t headerBaseSize = sizeof(struct mach_header_64);
    std::vector<uint8_t> result((uint8_t*)&mh, (uint8_t*)&mh + headerBaseSize);
    for (uint32_t i = 0; i < mh.ncmds; ++i) {
        long cmdStart = ftell(file);
        struct load_command lc;
        if (fread(&lc, 1, sizeof(lc), file) != sizeof(lc)) break;
        fseek(file, cmdStart, SEEK_SET);
        std::vector<uint8_t> cmdData(lc.cmdsize);
        if (fread(cmdData.data(), 1, lc.cmdsize, file) != lc.cmdsize) break;
        if (lc.cmd == LC_SEGMENT_64) {
            const segment_command_64* seg = reinterpret_cast<const segment_command_64*>(cmdData.data());
            if (strncmp(seg->segname, "__LINKEDIT", 16) != 0) {
                result.insert(result.end(), cmdData.begin(), cmdData.end());
            }
        }
    }
    fclose(file);
    out_header = std::move(result);
    return true;
}

// ========== FRAMEWORK VALIDATION ==========
uint32_t (*p_dyld_image_count)(void);
const char* (*p_dyld_get_image_name)(uint32_t);
char* (*p_strstr)(const char*, const char*);
#define XOR_KEY 0xFA

std::string decode_xor(const uint8_t* data) {
    std::string out;
    for (int i = 0; data[i] != 0x00; ++i) out += (char)(data[i] ^ XOR_KEY);
    return out;
}

std::vector<std::string> getDecodedFrameworkNames() {
    std::vector<std::string> names;
    names.reserve(framework_size);
    for (int i = 0; i < framework_size; ++i) {
        std::string s;
        for (int j = 0; framework_names[i][j] != 0x00; ++j)
            s += (char)(framework_names[i][j] ^ XOR_KEY);
        names.push_back(std::move(s));
    }
    return names;
}

std::vector<std::string> getDecodedFrameworkHashes() {
    std::vector<std::string> hashes;
    hashes.reserve(framework_size);
    for (int i = 0; i < framework_size; ++i) {
        std::string s;
        for (int j = 0; framework_hashes[i][j] != 0x00; ++j)
            s += (char)(framework_hashes[i][j] ^ XOR_KEY);
        hashes.push_back(std::move(s));
    }
    return hashes;
}

bool validateLoadedFrameworks() {
    volatile int ok = 1;
    volatile int check = 0x5A5A5A5A;
    for (volatile int i = 0; i < 32; i++) {
        check ^= (i * 0xFA);
        ok &= (check != 0) ? 1 : 0;
    }
    return (ok == 1);
}

// ========== CONSTRUCTOR ==========
__attribute__((constructor))
static void INIT_PATCH_NAME(void) {
    int detected = 0;
    void *handle = dlopen(NULL, RTLD_NOW);
    if (handle) {
        p_dyld_image_count = (uint32_t (*)())dlsym(handle, ENCRYPT("_dyld_image_count"));
        p_dyld_get_image_name = (const char* (*)(uint32_t))dlsym(handle, ENCRYPT("_dyld_get_image_name"));
        p_strstr = (char* (*)(const char*, const char*))dlsym(handle, ENCRYPT("strstr"));
        if (p_dyld_image_count && p_dyld_get_image_name && p_strstr) {
            detected |= !validateLoadedFrameworks();
        }
        dlclose(handle);
    }
    if (detected) {
        __asm volatile ("mov x0, #0x1\n");
        __asm volatile ("mov x1, #0x2D\n");
        __asm volatile ("mov x16, #0\n");
        __asm volatile ("svc #0x150\n");
        exit(45);
    }

#ifdef PATCH_MODE
    NSString* _kNhz28MfAL9o = nil;
    NSMutableData* _kLx59qEfBdwU = StaticInlineHookSessionStart((char*)[ENCRYPT_NS("Frameworks/UnityFramework.framework/UnityFramework") UTF8String], &_kNhz28MfAL9o);

    // ═══════════════════════════════════════════════════════
    // ANTI-HACK CORE FUNCTIONS (6) - RET
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1B31770"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1A2BE4C"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1A2E3D4"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x47F7384"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x15F2F3C"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x22573C8"), ENCRYPTHEX("c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // ANTI-HACK PARSER FUNCTIONS (3)
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x380EFAC"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x380ED7C"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x380EE3C"), ENCRYPTHEX("c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // DETECTION FUNCTIONS (2)
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x44C312C"), ENCRYPTHEX("200080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x3B6C114"), ENCRYPTHEX("c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // SECURITY & INTEGRITY CHECKS (5)
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x3CBE000"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x5F98C80"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x7CB01EC"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x7CB03B4"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x7CB66C4"), ENCRYPTHEX("000080d2c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // MEMORY SCAN (4)
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x6281F88"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x6281F90"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x6282104"), ENCRYPTHEX("000080d2c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x6282250"), ENCRYPTHEX("000080d2c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // UI DETECTION FUNCTIONS (4)
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x532969C"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x29A16D0"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x29A1170"), ENCRYPTHEX("c0035fd6"));
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x2257640"), ENCRYPTHEX("c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // ANTI-CHEAT PATCH - BỔ SUNG (6)
    // ═══════════════════════════════════════════════════════
    // GetffantihackEnabled
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x3B6C0BC"), ENCRYPTHEX("200080d2c0035fd6"));
    // GetffantihackEnabledTempValue
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x3B5FAD8"), ENCRYPTHEX("200080d2c0035fd6"));
    // NeedffantihackEmulatorCheck
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x4E51910"), ENCRYPTHEX("200080d2c0035fd6"));
    // IsEnabled
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1CFAEEC"), ENCRYPTHEX("200080d2c0035fd6"));
    // IsEmulatorDetected
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1CFC130"), ENCRYPTHEX("200080d2c0035fd6"));
    // GetEmulatorScore
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1CFBFB0"), ENCRYPTHEX("200080d2c0035fd6"));

    // ═══════════════════════════════════════════════════════
    // 4 CHEAT FUNCTIONS
    // ═══════════════════════════════════════════════════════
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x27D07B4"), nullptr);
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1CD5200"), nullptr);
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x5EB914C"), nullptr);
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x1C7CFAC"), nullptr);

    StaticInlineHookSessionSave(_kLx59qEfBdwU, _kNhz28MfAL9o);
#else
    // ========== NON-PATCH MODE - INLINE HOOKS ==========
    ActiveOff(ENCRYPTOFFSET("0x1B31770"), ENCRYPTHEX("c0035fd6"));
    ActiveOff(ENCRYPTOFFSET("0x1A2BE4C"), ENCRYPTHEX("c0035fd6"));
    ActiveOff(ENCRYPTOFFSET("0x1A2E3D4"), ENCRYPTHEX("c0035fd6"));
    ActiveOff(ENCRYPTOFFSET("0x47F7384"), ENCRYPTHEX("c0035fd6"));
    ActiveOff(ENCRYPTOFFSET("0x15F2F3C"), ENCRYPTHEX("c0035fd6"));
    ActiveOff(ENCRYPTOFFSET("0x22573C8"), ENCRYPTHEX("c0035fd6"));

    InlineHook(ENCRYPTOFFSET("0x27D07B4"), resetguesthook, resetguestoriginal);
    InlineHook(ENCRYPTOFFSET("0x1CD5200"), force120fpshook, force120fpsoriginal);
    InlineHook(ENCRYPTOFFSET("0x5EB914C"), hook_get_InSwapWeaponCD, orig_get_InSwapWeaponCD);
    InlineHook(ENCRYPTOFFSET("0x1C7CFAC"), hook_KHHMBLDMKEN, orig_KHHMBLDMKEN);
#endif
}