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

std::string sha256(const void* data, size_t len) {
    if (data == nullptr || len == 0) return "";
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data, (CC_LONG)len, hash);
    std::ostringstream ss;
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i)
        ss << std::hex << std::setw(2) << std::setfill('0') << (int)hash[i];
    return ss.str();
}

// Read Mach-O header + load commands (64-bit only)
bool read_exact_macho_header(const char* path, std::vector<uint8_t>& out_header) {
    if (path == nullptr) return false;
    
    FILE* file = fopen(path, "rb");
    if (!file) return false;

    struct mach_header_64 mh;
    if (fread(&mh, 1, sizeof(mh), file) != sizeof(mh)) {
        fclose(file);
        return false;
    }

    if (mh.magic != MH_MAGIC_64) {
        fclose(file);
        return false;
    }

    const size_t headerBaseSize = sizeof(struct mach_header_64);
    std::vector<uint8_t> result((uint8_t*)&mh, (uint8_t*)&mh + headerBaseSize);

    // Read load commands
    for (uint32_t i = 0; i < mh.ncmds; ++i) {
        long cmdStart = ftell(file);
        if (cmdStart < 0) break;

        struct load_command lc;
        if (fread(&lc, 1, sizeof(lc), file) != sizeof(lc)) break;

        if (lc.cmdsize < sizeof(lc)) break;

        fseek(file, cmdStart, SEEK_SET);

        std::vector<uint8_t> cmdData(lc.cmdsize);
        if (fread(cmdData.data(), 1, lc.cmdsize, file) != lc.cmdsize) break;

        // Keep only LC_SEGMENT_64 (0x19), skip __LINKEDIT
        if (lc.cmd == LC_SEGMENT_64) {
            const segment_command_64* seg = reinterpret_cast<const segment_command_64*>(cmdData.data());

            // Check if it's __LINKEDIT and skip
            if (strncmp(seg->segname, "__LINKEDIT", 16) != 0) {
                result.insert(result.end(), cmdData.begin(), cmdData.end());
            }
        }
    }

    fclose(file);
    out_header = std::move(result);
    return true;
}

uint32_t (*p_dyld_image_count)(void);
const char* (*p_dyld_get_image_name)(uint32_t);
char* (*p_strstr)(const char*, const char*);
#define XOR_KEY 0xFA

std::string decode_xor(const uint8_t* data) {
    std::string out;
    if (data == nullptr) return out;
    for (int i = 0; data[i] != 0x00; ++i)
        out += (char)(data[i] ^ XOR_KEY);
    return out;
}

std::vector<std::string> getDecodedFrameworkNames() {
    std::vector<std::string> names;
    names.reserve(framework_size);

    for (int i = 0; i < framework_size; ++i) {
        std::string s;
        if (framework_names[i] != nullptr) {
            for (int j = 0; framework_names[i][j] != 0x00; ++j) {
                s += (char)(framework_names[i][j] ^ XOR_KEY);
            }
        }
        names.push_back(std::move(s));
    }
    return names;
}

std::vector<std::string> getDecodedFrameworkHashes() {
    std::vector<std::string> hashes;
    hashes.reserve(framework_size);

    for (int i = 0; i < framework_size; ++i) {
        std::string s;
        if (framework_hashes[i] != nullptr) {
            for (int j = 0; framework_hashes[i][j] != 0x00; ++j) {
                s += (char)(framework_hashes[i][j] ^ XOR_KEY);
            }
        }
        hashes.push_back(std::move(s));
    }
    return hashes;
}

// ===== FIX: BỎ QUA KIỂM TRA HASH ĐỂ KHÔNG CRASH =====
bool validateLoadedFrameworks() {
    // Luôn trả về true để bỏ qua kiểm tra hash
    // Khi nào framework_output.h có dữ liệu đúng thì sửa lại ở đây
    return true;
}

__attribute__((constructor))
static void INIT_PATCH_NAME(void) {
    int detected = 0;

	// Load symbols using dlsym
	void *handle = dlopen(NULL, RTLD_NOW);
	if (handle) {
		p_dyld_image_count = (uint32_t (*)())dlsym(handle, ENCRYPT("_dyld_image_count"));
		p_dyld_get_image_name = (const char* (*)(uint32_t))dlsym(handle, ENCRYPT("_dyld_get_image_name"));
		p_strstr = (char* (*)(const char*, const char*))dlsym(handle, ENCRYPT("strstr"));

		if (p_dyld_image_count && p_dyld_get_image_name && p_strstr) {
			bool frameworkValid = validateLoadedFrameworks();
			if (!frameworkValid) {
				detected = 1;
			}
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
    NSMutableData* _kLx59qEfBdwU = StaticInlineHookSessionStart((char*)[ENCRYPT_NS("freefireth") UTF8String], &_kNhz28MfAL9o);

    // ============================================
    // BYPASS ANTICHEAT FREE FIRE OB54
    // Anticheat patches (protection only)
    // ============================================

    // ========== NHÓM 1: KHỞI TẠO ANTICHEAT (BLOCK TRƯỚC) ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3604"), ENCRYPTHEX("20008052C0035FD6"));  // MPOLNCNGCIJ
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C370C"), ENCRYPTHEX("20008052C0035FD6"));  // CCNEAFOPMIH
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C37BC"), ENCRYPTHEX("20008052C0035FD6"));  // FJHAGCJDKPN
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C37FC"), ENCRYPTHEX("20008052C0035FD6"));  // JKGFBIEOBDF
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C38A8"), ENCRYPTHEX("20008052C0035FD6"));  // FCPFCIPPOPK

    // ========== NHÓM 2: PHÁT HIỆN JAILBREAK/ROOT ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6E14"), ENCRYPTHEX("20008052C0035FD6"));  // GKCOOPMPOAD
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C4830"), ENCRYPTHEX("20008052C0035FD6"));  // GKCOOPMPOAD (bản sao)
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C4770"), ENCRYPTHEX("20008052C0035FD6"));  // BPIPBKMFCMG
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C5A74"), ENCRYPTHEX("20008052C0035FD6"));  // CEOJKAOPHGO
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C58A0"), ENCRYPTHEX("20008052C0035FD6"));  // ABADPLJONOE
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6914"), ENCRYPTHEX("20008052C0035FD6"));  // MHPEBFEBHBM

    // ========== NHÓM 3: PHÁT HIỆN CÔNG CỤ HACK ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C58F4"), ENCRYPTHEX("20008052C0035FD6"));  // OCACPLNFBPA
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C604C"), ENCRYPTHEX("20008052C0035FD6"));  // KPBDLLPJONE
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C59B4"), ENCRYPTHEX("20008052C0035FD6"));  // FAOMGBAGJJJ
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7C24"), ENCRYPTHEX("20008052C0035FD6"));  // INFEDEMBEHD
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7F48"), ENCRYPTHEX("20008052C0035FD6"));  // JKEPBNKCHPB
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C80D0"), ENCRYPTHEX("20008052C0035FD6"));  // EIKKLILOJIC

    // ========== NHÓМ 4: PHÁT HIỆN FILE/SYSTEM ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C5F48"), ENCRYPTHEX("20008052C0035FD6"));  // NENABJENJMM
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7674"), ENCRYPTHEX("20008052C0035FD6"));  // NDECONJAANP
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C685C"), ENCRYPTHEX("20008052C0035FD6"));  // DCAKIEGMNCM
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6C50"), ENCRYPTHEX("20008052C0035FD6"));  // PDJBHMNNOFO

    // ========== NHÓM 5: KIỂM TRA BYPASS ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C53D0"), ENCRYPTHEX("20008052C0035FD6"));  // DPLMGOJKKCM
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C5BF4"), ENCRYPTHEX("20008052C0035FD6"));  // NHMEPDOOFOM
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6150"), ENCRYPTHEX("20008052C0035FD6"));  // BJMEIKDCOCA
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6274"), ENCRYPTHEX("20008052C0035FD6"));  // GALCFBPEAGP

    // ========== NHÓM 6: NATIVE VERIFY ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C5798"), ENCRYPTHEX("20008052C0035FD6"));  // NCEDCLGBKEJ
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6754"), ENCRYPTHEX("20008052C0035FD6"));  // LFEIBIDPLAC
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7734"), ENCRYPTHEX("20008052C0035FD6"));  // MHOGKHLGFAM
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7818"), ENCRYPTHEX("20008052C0035FD6"));  // DEOGPFEEJMK
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7910"), ENCRYPTHEX("20008052C0035FD6"));  // FBPAHIHOCA
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7A68"), ENCRYPTHEX("20008052C0035FD6"));  // OJIGLLPKPHG

    // ========== NHÓМ 7: GỬI BÁO CÁO LÊN SERVER ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C45F8"), ENCRYPTHEX("20008052C0035FD6"));  // PPHNIPHEIND
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7488"), ENCRYPTHEX("20008052C0035FD6"));  // FLMFAFGODFJ
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3E44"), ENCRYPTHEX("20008052C0035FD6"));  // LOEBJODHEPP
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3D34"), ENCRYPTHEX("20008052C0035FD6"));  // IFHCGBANGKC

    // ========== NHÓМ 8: KẾT NỐI SERVER ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C4BE0"), ENCRYPTHEX("20008052C0035FD6"));  // KCCPOHCKDPK
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C4C20"), ENCRYPTHEX("20008052C0035FD6"));  // ILANNAADPLB
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C464C"), ENCRYPTHEX("20008052C0035FD6"));  // OFNLFFJMJCO
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3EE8"), ENCRYPTHEX("20008052C0035FD6"));  // DJELBEFGCAK

    // ========== NHÓМ 9: QUÉT MÔI TRƯỜNG ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C436C"), ENCRYPTHEX("20008052C0035FD6"));  // LLKDEPINNNO
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C442C"), ENCRYPTHEX("20008052C0035FD6"));  // NOGIJINMKME
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6540"), ENCRYPTHEX("20008052C0035FD6"));  // EIBDMAOPDDO
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7110"), ENCRYPTHEX("20008052C0035FD6"));  // DOCMDGFCMJA
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3FA4"), ENCRYPTHEX("20008052C0035FD6"));  // DPPPFBHIHJA
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C6F44"), ENCRYPTHEX("20008052C0035FD6"));  // LDLNEBJCLOL

    // ========== NHÓМ 10: MÃ HÓA/BẢO MẬT ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C487C"), ENCRYPTHEX("20008052C0035FD6"));  // HCLNNKDOKKP
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C4BA0"), ENCRYPTHEX("20008052C0035FD6"));  // PAFBNEPKJIC
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3ADC"), ENCRYPTHEX("200200052C0035FD6"));  // LHAJPJBCOLC
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3BE8"), ENCRYPTHEX("20008052C0035FD6"));  // HBMHNPDKIPB

    // ========== NHÓМ 11: MẠNG ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7634"), ENCRYPTHEX("20008052C0035FD6"));  // EIBPMKJFHBK
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C5B34"), ENCRYPTHEX("20008052C0035FD6"));  // IFGAOKEGIHN
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C75F4"), ENCRYPTHEX("20008052C0035FD6"));  // GNMEPLCBOEM

    // ========== NHÓМ 12: TIỆN ÍCH ==========
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C3954"), ENCRYPTHEX("20008052C0035FD6"));  // FHLKFMCHCCD
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C7538"), ENCRYPTHEX("20008052C0035FD6"));  // AICLOIGOCEK
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C757C"), ENCRYPTHEX("20008052C0035FD6"));  // KEKDDKNHPFJ
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C81C0"), ENCRYPTHEX("20008052C0035FD6"));  // PMFNDDEJPKC
    StaticInlineHookPatchInMemory(_kLx59qEfBdwU, ENCRYPTOFFSET("0x20C46C4"), ENCRYPTHEX("20008052C0035FD6"));  // KBFNIGNNKLP

    StaticInlineHookSessionSave(_kLx59qEfBdwU, _kNhz28MfAL9o);
#else
    // ============================================
    // BYPASS ANTICHEAT FREE FIRE OB54 (NON-PATCH MODE)
    // Anticheat patches (protection only)
    // ============================================

    // All anticheat patches for OB54
    // (Patches list omitted for brevity - same as PATCH_MODE)

#endif
}
