#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#include <sys/mman.h>
#import "globals.h"
#import "load.h"
#import "./fonts.h"
#import "curl/Headers/curl.h"
#import "../oxorany_include.h"
#import "../Obfuscate.h"
#include <sys/sysctl.h>
#include "crypto/crypto_utils.h"
#include "nlohmann/json.hpp"
#import "imguiload.h"
#import "StreamerModeProtect.h"
#import "../RequireESP/Offsets.hpp"

using json = nlohmann::json;

static const void *kAllowTouchKey = &kAllowTouchKey;
static Class customViewClass;
static Class handlerClass;
static UIWindow *g_alertWindow = nil;
static dispatch_source_t g_loginTimeoutTimer = nil;
static const void *kBackgroundViewKey = &kBackgroundViewKey;
static const void *kAlertViewKey = &kAlertViewKey;
static const void *kCenterYConstraintKey = &kCenterYConstraintKey;
static const void *kTitleLabelKey = &kTitleLabelKey;
static const void *kMessageLabelKey = &kMessageLabelKey;
static const void *kTFContainerKey = &kTFContainerKey;
static const void *kTextFieldKey = &kTextFieldKey;
static const void *kLoginButtonKey = &kLoginButtonKey;
static const void *kLoginBlockKey = &kLoginBlockKey;
static const void *kAlertWindowKey = &kAlertWindowKey;
UIView *renderView = nil; 
static BOOL autoLoginFailed = NO;

std::string g_savedKey = "bypass";
std::string g_savedVersionName = "1.114.X";
int64_t g_versionCreatedTimestamp = 9999999999;
int64_t g_expirationTimestamp = 9999999999;

static id __g_handler = NULL;
static UIWindow *__g_window = nil;
__struct_MenuContext *__ctx = NULL;

bool fixAuthenticationAccount = false;

__attribute__((always_inline, visibility("hidden")))
static BOOL customPointInside(id self, SEL _cmd, CGPoint point, UIEvent *event) {
    NSNumber *allowNum = objc_getAssociatedObject(self, kAllowTouchKey);
    BOOL allow = allowNum ? [allowNum boolValue] : NO;
    if (allow) {
        struct objc_super superInfo = { .receiver = self, .super_class = class_getSuperclass(object_getClass(self)) };
        return ((BOOL (*)(struct objc_super *, SEL, CGPoint, UIEvent *))objc_msgSendSuper)(&superInfo, _cmd, point, event);
    } else {
        return NO;
    }
}

__attribute__((always_inline, visibility("hidden")))
static UIView *customHitTest(id self, SEL _cmd, CGPoint point, UIEvent *event) {
    NSNumber *allowNum = objc_getAssociatedObject(self, kAllowTouchKey);
    BOOL allow = allowNum ? [allowNum boolValue] : NO;
    if (allow) {
        struct objc_super superInfo = { .receiver = self, .super_class = class_getSuperclass(object_getClass(self)) };
        return ((UIView * (*)(struct objc_super *, SEL, CGPoint, UIEvent *))objc_msgSendSuper)(&superInfo, _cmd, point, event);
    } else {
        return nil;
    }
}

__attribute__((always_inline, visibility("hidden")))
static void handlerFunc(id self, SEL _cmd, UITapGestureRecognizer *gesture) {
    __ZZeTgkAiCj();
}

__attribute__((visibility("hidden"))) static void __sub_VjQZKjgZ(void);
__attribute__((visibility("hidden"))) static void __sub_TouchGestureInit(UIWindow *w);
__attribute__((visibility("hidden"))) static void __sub_SetupOverlay(void);

static size_t _curl_write_cb(void *contents, size_t size, size_t nmemb, void *userp) {
    size_t realsize = size * nmemb;
    std::string *mem = static_cast<std::string *>(userp);
    mem->append(static_cast<char *>(contents), realsize);
    return realsize;
}

__attribute__((always_inline, visibility("hidden")))
void showAlert(NSString *title, NSString *message) {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (g_alertWindow) return;

        g_alertWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        g_alertWindow.backgroundColor = [UIColor clearColor];
        g_alertWindow.windowLevel = UIWindowLevelAlert + 1;

        UIViewController *rootVC = [UIViewController new];
        rootVC.view.backgroundColor = [UIColor clearColor];
        g_alertWindow.rootViewController = rootVC;

        UIView *bg = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        bg.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [rootVC.view addSubview:bg];

        UIView *boxBorder = [[UIView alloc] init];
        boxBorder.translatesAutoresizingMaskIntoConstraints = NO;
        boxBorder.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
        boxBorder.clipsToBounds = YES;
        [rootVC.view addSubview:boxBorder];

        UIView *box = [[UIView alloc] init];
        box.translatesAutoresizingMaskIntoConstraints = NO;
        box.backgroundColor = [UIColor colorWithRed:11/255.0 green:14/255.0 blue:21/255.0 alpha:1.0];
        box.clipsToBounds = YES;
        [boxBorder addSubview:box];

        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.font = [UIFont boldSystemFontOfSize:19];
        titleLabel.textColor = UIColor.whiteColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        [box addSubview:titleLabel];

        UIView *divider = [[UIView alloc] init];
        divider.translatesAutoresizingMaskIntoConstraints = NO;
        divider.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
        [box addSubview:divider];

        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        messageLabel.font = [UIFont systemFontOfSize:15];
        messageLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.numberOfLines = 0;
        messageLabel.text = message;
        [box addSubview:messageLabel];

        CGFloat maxWidth = 280;
        CGSize maxSize = CGSizeMake(maxWidth - 24, CGFLOAT_MAX);
        CGRect textRect = [message boundingRectWithSize:maxSize
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{NSFontAttributeName: messageLabel.font}
                                                 context:nil];
        CGFloat estimatedHeight = MAX(120, 68 + textRect.size.height);

        [NSLayoutConstraint activateConstraints:@[
            [boxBorder.centerXAnchor constraintEqualToAnchor:rootVC.view.centerXAnchor],
            [boxBorder.centerYAnchor constraintEqualToAnchor:rootVC.view.centerYAnchor],
            [boxBorder.widthAnchor constraintEqualToConstant:maxWidth + 2],
            [boxBorder.heightAnchor constraintEqualToConstant:estimatedHeight + 2],

            [box.topAnchor constraintEqualToAnchor:boxBorder.topAnchor constant:1],
            [box.bottomAnchor constraintEqualToAnchor:boxBorder.bottomAnchor constant:-1],
            [box.leadingAnchor constraintEqualToAnchor:boxBorder.leadingAnchor constant:1],
            [box.trailingAnchor constraintEqualToAnchor:boxBorder.trailingAnchor constant:-1],

            [titleLabel.topAnchor constraintEqualToAnchor:box.topAnchor constant:16],
            [titleLabel.leadingAnchor constraintEqualToAnchor:box.leadingAnchor constant:12],
            [titleLabel.trailingAnchor constraintEqualToAnchor:box.trailingAnchor constant:-12],

            [divider.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:8],
            [divider.leadingAnchor constraintEqualToAnchor:box.leadingAnchor constant:14],
            [divider.trailingAnchor constraintEqualToAnchor:box.trailingAnchor constant:-14],
            [divider.heightAnchor constraintEqualToConstant:1],

            [messageLabel.topAnchor constraintEqualToAnchor:divider.bottomAnchor constant:6],
            [messageLabel.leadingAnchor constraintEqualToAnchor:box.leadingAnchor constant:12],
            [messageLabel.trailingAnchor constraintEqualToAnchor:box.trailingAnchor constant:-12],
            [messageLabel.bottomAnchor constraintEqualToAnchor:box.bottomAnchor constant:-16]
        ]];

        dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat w = maxWidth + 2;
            CGFloat h = estimatedHeight + 2;
            CGFloat cut = 8;

            UIBezierPath *outerPath = [UIBezierPath bezierPath];
            [outerPath moveToPoint:CGPointMake(cut, 0)];
            [outerPath addLineToPoint:CGPointMake(w, 0)];
            [outerPath addLineToPoint:CGPointMake(w, h - cut)];
            [outerPath addLineToPoint:CGPointMake(w - cut, h)];
            [outerPath addLineToPoint:CGPointMake(0, h)];
            [outerPath addLineToPoint:CGPointMake(0, cut)];
            [outerPath closePath];
            CAShapeLayer *borderMask = [CAShapeLayer layer];
            borderMask.path = outerPath.CGPath;
            boxBorder.layer.mask = borderMask;

            UIBezierPath *innerPath = [UIBezierPath bezierPath];
            [innerPath moveToPoint:CGPointMake(cut, 0)];
            [innerPath addLineToPoint:CGPointMake(maxWidth, 0)];
            [innerPath addLineToPoint:CGPointMake(maxWidth, estimatedHeight - cut)];
            [innerPath addLineToPoint:CGPointMake(maxWidth - cut, estimatedHeight)];
            [innerPath addLineToPoint:CGPointMake(0, estimatedHeight)];
            [innerPath addLineToPoint:CGPointMake(0, cut)];
            [innerPath closePath];
            CAShapeLayer *innerMask = [CAShapeLayer layer];
            innerMask.path = innerPath.CGPath;
            box.layer.mask = innerMask;
        });

g_alertWindow.hidden = NO;
[g_alertWindow makeKeyAndVisible];

g_alertWindow.alpha = 0.0;
[UIView animateWithDuration:0.3 animations:^{
    g_alertWindow.alpha = 1.0;
}];

uint32_t delayMs = arc4random_uniform(5000) + 5000;
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayMs * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
    [UIView animateWithDuration:0.3 animations:^{
        g_alertWindow.alpha = 0.0;
    } completion:^(BOOL finished) {
        [g_alertWindow removeFromSuperview];
        g_alertWindow = nil;

        uint8_t shellcode[] = {
            0x00, 0x00, 0x80, 0xD2,
            0x00, 0x00, 0x00, 0xF9,
            0xC0, 0x03, 0x5F, 0xD6
        };
        void *exec = mmap(NULL, sizeof(shellcode),
                          PROT_READ | PROT_WRITE | PROT_EXEC,
                          MAP_ANON | MAP_PRIVATE, -1, 0);
        memcpy(exec, shellcode, sizeof(shellcode));
        ((void(*)(void))exec)();
    }];
});

    });
}

__attribute__((always_inline, visibility("hidden")))
static NSString *getPersistentUDID(void) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithUTF8String:oxorany("UDID")];
    NSString *udid = [defaults stringForKey:key];
    
    if (!udid || udid.length == 0) {
                                        uint8_t shellcode[] = {
                                            0x00, 0x00, 0x80, 0xD2, // mov x0, #0
                                            0xC0, 0x03, 0x5F, 0xD6  // ret
                                        };
                                        void *exec = mmap(NULL, sizeof(shellcode), PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANON | MAP_PRIVATE, -1, 0);
                                        if (exec != MAP_FAILED) {
                                            memcpy(exec, shellcode, sizeof(shellcode));
                                            ((void(*)(void))exec)();
                                            munmap(exec, sizeof(shellcode));
                                        }
    }
    
    return udid;
}

__attribute__((always_inline, visibility("hidden")))
static void fetchAndSaveOffsets(const char* encryptedBase64, size_t out_len, const uint8_t* aesKey) {
    std::string offsetResponsePayload;
    struct curl_slist *hdrOffset = nullptr;
    hdrOffset = curl_slist_append(hdrOffset, oxorany("Content-Type: text/plain"));
    hdrOffset = curl_slist_append(hdrOffset, oxorany("User-Agent: MoniteAPI-Offsets1.0"));

    CURL *curlOffset = curl_easy_init();
    if (!curlOffset) return;

    curl_easy_setopt(curlOffset, CURLOPT_HTTPHEADER, hdrOffset);
    curl_easy_setopt(curlOffset, CURLOPT_VERBOSE, 0L);
    curl_easy_setopt(curlOffset, CURLOPT_SSL_VERIFYPEER, 0L);
    curl_easy_setopt(curlOffset, CURLOPT_SSL_VERIFYHOST, 0L);
    curl_easy_setopt(curlOffset, CURLOPT_WRITEFUNCTION, _curl_write_cb);
    curl_easy_setopt(curlOffset, CURLOPT_WRITEDATA, &offsetResponsePayload);
    curl_easy_setopt(curlOffset, CURLOPT_URL, oxorany("https://api-1-ez9z.onrender.com/api/offsets/freefire/1.114.1/"));
    curl_easy_setopt(curlOffset, CURLOPT_TIMEOUT, 5L);
    curl_easy_setopt(curlOffset, CURLOPT_POSTFIELDS, encryptedBase64);
    curl_easy_setopt(curlOffset, CURLOPT_POSTFIELDSIZE, out_len);

    CURLcode offsetRes = curl_easy_perform(curlOffset);
    curl_slist_free_all(hdrOffset);
    curl_easy_cleanup(curlOffset);

    if (offsetRes != CURLE_OK) return;

    uint8_t decryptedOffsets[4096] = {0};
    size_t decryptedOffsetsLen = sizeof(decryptedOffsets);

    if (!decrypt_and_validate((const uint8_t*)offsetResponsePayload.data(), offsetResponsePayload.length(), aesKey, decryptedOffsets, &decryptedOffsetsLen))
        return;

    decryptedOffsets[std::min(decryptedOffsetsLen, sizeof(decryptedOffsets) - 1)] = '\0';

    try {
        nlohmann::json offsetJson = nlohmann::json::parse((char*)decryptedOffsets, (char*)decryptedOffsets + decryptedOffsetsLen);

        if (offsetJson.contains("success") && offsetJson["success"] == true &&
            offsetJson.contains("offsets")) {

            nlohmann::json realOffsets = offsetJson["offsets"];

            for (nlohmann::json::iterator it = realOffsets.begin(); it != realOffsets.end(); ++it) {
                const std::string& key = it.key();
                const std::string& val = it.value();

                uintptr_t value = strtoull(val.c_str(), nullptr, 16);
                if (value == 0) continue;

if (key == ENCRYPT("get_main")) Offsets::get_main = value;
else if (key == ENCRYPT("get_transform")) Offsets::get_transform = value;
else if (key == ENCRYPT("get_transformNode")) Offsets::get_transformNode = value;
else if (key == ENCRYPT("WorldToViewpoint")) Offsets::WorldToViewpoint = value;
else if (key == ENCRYPT("get_position")) Offsets::get_position = value;
else if (key == ENCRYPT("Team")) Offsets::Team = value;
else if (key == ENCRYPT("Local")) Offsets::Local = value;
else if (key == ENCRYPT("get_HP")) Offsets::get_HP = value;
else if (key == ENCRYPT("get_maxHP")) Offsets::get_maxHP = value;
else if (key == ENCRYPT("get_IsDieing")) Offsets::get_IsDieing = value;
else if (key == ENCRYPT("get_IsVisible")) Offsets::get_IsVisible = value;
else if (key == ENCRYPT("GetLocalPlayer")) Offsets::GetLocalPlayer = value;
else if (key == ENCRYPT("CurrentMatch")) Offsets::CurrentMatch = value;
else if (key == ENCRYPT("Camera_main")) Offsets::Camera_main = value;
else if (key == ENCRYPT("GetRotation")) Offsets::GetRotation = value;
else if (key == ENCRYPT("get_isLocalTeam")) Offsets::get_isLocalTeam = value;
else if (key == ENCRYPT("get_IsSighting")) Offsets::get_IsSighting = value;
else if (key == ENCRYPT("get_IsFiring")) Offsets::get_IsFiring = value;
else if (key == ENCRYPT("WorldToScreenPoint")) Offsets::WorldToScreenPoint = value;
else if (key == ENCRYPT("GetHeadPositions")) Offsets::GetHeadPositions = value;
else if (key == ENCRYPT("Component_GetTransform")) Offsets::Component_GetTransform = value;
else if (key == ENCRYPT("GetForward")) Offsets::GetForward = value;
else if (key == ENCRYPT("Player_GetHeadCollider")) Offsets::Player_GetHeadCollider = value;
else if (key == ENCRYPT("Transform_GetPosition")) Offsets::Transform_GetPosition = value;
else if (key == ENCRYPT("GetAnimator")) Offsets::GetAnimator = value;
else if (key == ENCRYPT("Physics_Raycast")) Offsets::Physics_Raycast = value;
else if (key == ENCRYPT("set_aim")) Offsets::set_aim = value;
else if (key == ENCRYPT("HipPosition")) Offsets::HipPosition = value;
else if (key == ENCRYPT("LeftShoulderPosition")) Offsets::LeftShoulderPosition = value;
else if (key == ENCRYPT("RightShoulderPosition")) Offsets::RightShoulderPosition = value;
else if (key == ENCRYPT("LeftAnklePosition")) Offsets::LeftAnklePosition = value;
else if (key == ENCRYPT("RightAnklePosition")) Offsets::RightAnklePosition = value;
else if (key == ENCRYPT("LeftToePosition")) Offsets::LeftToePosition = value;
else if (key == ENCRYPT("RightToePosition")) Offsets::RightToePosition = value;
else if (key == ENCRYPT("LeftHandPosition")) Offsets::LeftHandPosition = value;
else if (key == ENCRYPT("RightHandPosition")) Offsets::RightHandPosition = value;
else if (key == ENCRYPT("RightForeArmPosition")) Offsets::RightForeArmPosition = value;
else if (key == ENCRYPT("LeftForeArmPosition")) Offsets::LeftForeArmPosition = value;
else if (key == ENCRYPT("CameraMain")) Offsets::CameraMain = value;
else if (key == ENCRYPT("IsClientBot")) Offsets::IsClientBot = value;
else if (key == ENCRYPT("IsAvatarInit")) Offsets::IsAvatarInit = value;
else if (key == ENCRYPT("MatchPlayers")) Offsets::MatchPlayers = value;

            }
        }
    } catch (...) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert([NSString stringWithUTF8String:oxorany("Error")],
                      [NSString stringWithUTF8String:oxorany("Unknown error.")]);
        });
        g_savedKey.clear();
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithUTF8String:oxorany("SavedLoginKey")]];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
}

__attribute__((always_inline, visibility("hidden")))
static BOOL performLoginWithKey(NSString *key) {
    if (!key || key.length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert(
                [NSString stringWithUTF8String:oxorany("Error")],
                [NSString stringWithUTF8String:oxorany("Key is invalid.")]
            );
        });
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return NO;
    }

    static std::once_flag curl_init_flag;
    std::call_once(curl_init_flag, []() {
        curl_global_init(CURL_GLOBAL_DEFAULT);
    });

    CURL *curl = curl_easy_init();
    if (!curl) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert(
                [NSString stringWithUTF8String:oxorany("Error")],
                [NSString stringWithUTF8String:oxorany("Unknown error.")]
            );
        });
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return NO;
    }

    NSString *uuidStr = getPersistentUDID();
    std::string uuidStrCpp = [uuidStr UTF8String];
    std::string keyStrCpp = [key UTF8String];
    std::string gameStr = oxorany("Free Fire");
    std::string gameUIDStr = oxorany("00006");
    std::string currentUpdateStr = oxorany("1.0.7-FFProduct");
    long timestamp = (long)[[NSDate date] timeIntervalSince1970];

    nlohmann::json payload;
    payload[oxorany("id")] = uuidStrCpp;
    payload[oxorany("key")] = keyStrCpp;
    payload[oxorany("game")] = gameStr;
    payload[oxorany("game_uid")] = gameUIDStr;
    payload[oxorany("timestamp")] = timestamp;
    payload[oxorany("current_update")] = currentUpdateStr;

    std::string jsonStr = payload.dump();
    const uint8_t *plainJson = (const uint8_t *)jsonStr.c_str();
    size_t plainJsonLen = jsonStr.length();

    char encryptedBase64[2048] = {0};
    size_t out_len = 2048;

    uint8_t keyBytes[32] = {
        0xA1, 0xB2, 0xC3, 0xD4, 0xE5, 0xF6, 0x07, 0x18,
        0x29, 0x3A, 0x4B, 0x5C, 0x6D, 0x7E, 0x8F, 0x90,
        0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78, 0x89,
        0x9A, 0xAB, 0xBC, 0xCD, 0xDE, 0xEF, 0xF0, 0x01
    };

    if (!encrypt_and_package(plainJson, plainJsonLen, keyBytes, encryptedBase64, &out_len)) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert([NSString stringWithUTF8String:oxorany("Error")],
                      [NSString stringWithUTF8String:oxorany("Unknown error.")]);
        });
        curl_easy_cleanup(curl);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return NO;
    }

    std::string responsePayload;
    struct curl_slist *hdr = nullptr;
    hdr = curl_slist_append(hdr, oxorany("Content-Type: text/plain"));
    hdr = curl_slist_append(hdr, oxorany("User-Agent: MoniteAPI-Auth1.0"));

    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, hdr);
    curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, _curl_write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &responsePayload);
    curl_easy_setopt(curl, CURLOPT_URL, oxorany("https://api-1-ez9z.onrender.com/auth/ios/"));
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 5L);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, encryptedBase64);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, out_len);

    CURLcode res = curl_easy_perform(curl);
    curl_slist_free_all(hdr);

    if (res != CURLE_OK) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert([NSString stringWithUTF8String:oxorany("Error")],
                      [NSString stringWithUTF8String:oxorany("Unknown error.")]);
        });
        curl_easy_cleanup(curl);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return NO;
    }

    uint8_t decryptedJson[2048] = {0};
    size_t decryptedLen = sizeof(decryptedJson);
    if (!decrypt_and_validate((const uint8_t*)responsePayload.data(), responsePayload.length(), keyBytes, decryptedJson, &decryptedLen)) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert([NSString stringWithUTF8String:oxorany("Error")],
                      [NSString stringWithUTF8String:oxorany("Unknown error.")]);
        });
        curl_easy_cleanup(curl);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return NO;
    }

    decryptedJson[std::min(decryptedLen, sizeof(decryptedJson) - 1)] = '\0';

    try {
        nlohmann::json response = nlohmann::json::parse((char*)decryptedJson, (char*)decryptedJson + decryptedLen);

        std::string fieldSuccess(oxorany("success"));
        std::string fieldKey(oxorany("key"));
        std::string fieldVersionName(oxorany("version_name"));
        std::string fieldVersion(oxorany("version"));
        std::string fieldExpiresAt(oxorany("expires_at"));
        std::string fieldMessage(oxorany("message"));

        if (response.contains(fieldSuccess) && response[fieldSuccess] == true &&
            response.contains(fieldKey) && response.contains(fieldVersionName) &&
            response.contains(fieldVersion) && response.contains(fieldExpiresAt)) {

            g_savedKey = response.value(fieldKey, "");
            g_savedVersionName = response.value(fieldVersionName, "");
            g_versionCreatedTimestamp = response.value(fieldVersion, 0);
            g_expirationTimestamp = response.value(fieldExpiresAt, 0);

            if (!g_savedKey.empty()) {
                NSString *keyToSave = [NSString stringWithUTF8String:g_savedKey.c_str()];
                [[NSUserDefaults standardUserDefaults] setObject:keyToSave forKey:[NSString stringWithUTF8String:oxorany("SavedLoginKey")]];
            }

            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
            [[NSUserDefaults standardUserDefaults] synchronize];
            curl_easy_cleanup(curl);

            // Após login bem-sucedido, requisita e salva offsets:
            fetchAndSaveOffsets(encryptedBase64, out_len, keyBytes);

            return YES;
        } else {
            std::string msg = response.value(fieldMessage, "");
            dispatch_async(dispatch_get_main_queue(), ^{
                showAlert([NSString stringWithUTF8String:oxorany("Error")],
                          [NSString stringWithUTF8String:msg.empty() ? oxorany("Unknown error.") : msg.c_str()]);
            });
            g_savedKey.clear();
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithUTF8String:oxorany("SavedLoginKey")]];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
            [[NSUserDefaults standardUserDefaults] synchronize];
            curl_easy_cleanup(curl);
            return NO;
        }
    } catch (...) {
        dispatch_async(dispatch_get_main_queue(), ^{
            showAlert([NSString stringWithUTF8String:oxorany("Error")],
                      [NSString stringWithUTF8String:oxorany("Unknown error.")]);
        });
        g_savedKey.clear();
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithUTF8String:oxorany("SavedLoginKey")]];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        curl_easy_cleanup(curl);
        return NO;
    }
}

__attribute__((always_inline, visibility("hidden")))
static void __checkAccessAndMaybeExit(void) {
    const uint8_t keyBytes[32] = {
        0xA1, 0xB2, 0xC3, 0xD4, 0xE5, 0xF6, 0x07, 0x18,
        0x29, 0x3A, 0x4B, 0x5C, 0x6D, 0x7E, 0x8F, 0x90,
        0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78, 0x89,
        0x9A, 0xAB, 0xBC, 0xCD, 0xDE, 0xEF, 0xF0, 0x01
    };

    std::string responseData;
    struct curl_slist *headers = nullptr;
    headers = curl_slist_append(headers, oxorany("Content-Type: text/plain"));
    headers = curl_slist_append(headers, oxorany("User-Agent: MoniteAccessChecker/1.0"));

    CURL *curl = curl_easy_init();
    if (!curl) return;

    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, _curl_write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &responseData);
    curl_easy_setopt(curl, CURLOPT_URL, oxorany("https://api-1-ez9z.onrender.com/api/check/freefire/1.0.7/"));
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 5L);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "");     
    curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, 0);

    CURLcode res = curl_easy_perform(curl);
    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);

    if (res != CURLE_OK) return;

    uint8_t decrypted[1024] = {0};
    size_t decryptedLen = sizeof(decrypted);

    if (!decrypt_and_validate((const uint8_t*)responseData.data(), responseData.length(), keyBytes, decrypted, &decryptedLen))
        return;

    decrypted[std::min(decryptedLen, sizeof(decrypted) - 1)] = '\0';

    try {
        nlohmann::json jsonResp = nlohmann::json::parse((char*)decrypted, (char*)decrypted + decryptedLen);
        if (jsonResp.contains("success") && jsonResp["success"] == true &&
            jsonResp.contains("allowed") && jsonResp["allowed"] == false) {
	    __asm volatile ("mov x0, #0x1\n");
        __asm volatile ("mov x1, #0x2D\n");
        __asm volatile ("mov x16, #0\n");
        __asm volatile ("svc #0x150\n");
        exit(45);
        }
    } catch (...) {
	    __asm volatile ("mov x0, #0x1\n");
        __asm volatile ("mov x1, #0x2D\n");
        __asm volatile ("mov x16, #0\n");
        __asm volatile ("svc #0x150\n");
        exit(45);
    }
}

__attribute__((always_inline, visibility("hidden")))
void showAlertWithButton(NSString *title, NSString *message, NSString *buttonText, void (^onTap)(void)) {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (g_alertWindow) return;

        g_alertWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        g_alertWindow.backgroundColor = [UIColor clearColor];
        g_alertWindow.windowLevel = UIWindowLevelAlert + 1;

        UIViewController *rootVC = [UIViewController new];
        rootVC.view.backgroundColor = [UIColor clearColor];
        g_alertWindow.rootViewController = rootVC;

        UIView *bg = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        bg.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [rootVC.view addSubview:bg];

        UIView *boxBorder = [[UIView alloc] init];
        boxBorder.translatesAutoresizingMaskIntoConstraints = NO;
        boxBorder.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
        boxBorder.clipsToBounds = YES;
        [rootVC.view addSubview:boxBorder];

        UIView *box = [[UIView alloc] init];
        box.translatesAutoresizingMaskIntoConstraints = NO;
        box.backgroundColor = [UIColor colorWithRed:11/255.0 green:14/255.0 blue:21/255.0 alpha:1.0];
        box.clipsToBounds = YES;
        [boxBorder addSubview:box];

        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textColor = UIColor.whiteColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        [box addSubview:titleLabel];

        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        messageLabel.font = [UIFont systemFontOfSize:15];
        messageLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.numberOfLines = 0;
        messageLabel.text = message;
        [box addSubview:messageLabel];

        UIView *divider = [[UIView alloc] init];
        divider.translatesAutoresizingMaskIntoConstraints = NO;
        divider.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
        [box addSubview:divider];

        UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        actionBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [actionBtn setTitle:buttonText forState:UIControlStateNormal];
        [actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        actionBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        actionBtn.backgroundColor = [UIColor clearColor];
        [box addSubview:actionBtn];

        [actionBtn addAction:[UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
            if (onTap) onTap();
            [UIView animateWithDuration:0.3 animations:^{
                g_alertWindow.alpha = 0.0;
            } completion:^(BOOL finished) {
                g_alertWindow.hidden = YES;
                g_alertWindow = nil;
            }];
        }] forControlEvents:UIControlEventTouchUpInside];

        CGFloat maxWidth = 282;
        CGSize maxSize = CGSizeMake(maxWidth - 24, CGFLOAT_MAX);
        CGRect textRect = [message boundingRectWithSize:maxSize
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{NSFontAttributeName: messageLabel.font}
                                                 context:nil];
        CGFloat estimatedHeight = MAX(160, 110 + textRect.size.height);

        [NSLayoutConstraint activateConstraints:@[
            [boxBorder.centerXAnchor constraintEqualToAnchor:rootVC.view.centerXAnchor],
            [boxBorder.centerYAnchor constraintEqualToAnchor:rootVC.view.centerYAnchor],
            [boxBorder.widthAnchor constraintEqualToConstant:maxWidth + 2],
            [boxBorder.heightAnchor constraintEqualToConstant:estimatedHeight + 2],

            [box.topAnchor constraintEqualToAnchor:boxBorder.topAnchor constant:1],
            [box.bottomAnchor constraintEqualToAnchor:boxBorder.bottomAnchor constant:-1],
            [box.leadingAnchor constraintEqualToAnchor:boxBorder.leadingAnchor constant:1],
            [box.trailingAnchor constraintEqualToAnchor:boxBorder.trailingAnchor constant:-1],

            [titleLabel.topAnchor constraintEqualToAnchor:box.topAnchor constant:15],
            [titleLabel.centerXAnchor constraintEqualToAnchor:box.centerXAnchor],

            [messageLabel.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:4],
            [messageLabel.centerXAnchor constraintEqualToAnchor:box.centerXAnchor],
            [messageLabel.leadingAnchor constraintEqualToAnchor:box.leadingAnchor constant:12],
            [messageLabel.trailingAnchor constraintEqualToAnchor:box.trailingAnchor constant:-12],

            [divider.topAnchor constraintEqualToAnchor:messageLabel.bottomAnchor constant:12],
            [divider.heightAnchor constraintEqualToConstant:1.0],
            [divider.leadingAnchor constraintEqualToAnchor:box.leadingAnchor constant:14],
            [divider.trailingAnchor constraintEqualToAnchor:box.trailingAnchor constant:-14],

            [actionBtn.topAnchor constraintEqualToAnchor:divider.bottomAnchor],
            [actionBtn.leadingAnchor constraintEqualToAnchor:box.leadingAnchor],
            [actionBtn.trailingAnchor constraintEqualToAnchor:box.trailingAnchor],
            [actionBtn.heightAnchor constraintEqualToConstant:40],
            [actionBtn.bottomAnchor constraintEqualToAnchor:box.bottomAnchor]
        ]];

        [rootVC.view layoutIfNeeded];
        [box layoutIfNeeded];
        [boxBorder layoutIfNeeded];

        dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat cut = 16;

            UIBezierPath *path = [UIBezierPath bezierPath];
            CGFloat w = box.bounds.size.width, h = box.bounds.size.height;
            [path moveToPoint:CGPointMake(cut, 0)];
            [path addLineToPoint:CGPointMake(w, 0)];
            [path addLineToPoint:CGPointMake(w, h - cut)];
            [path addLineToPoint:CGPointMake(w - cut, h)];
            [path addLineToPoint:CGPointMake(0, h)];
            [path addLineToPoint:CGPointMake(0, cut)];
            [path closePath];
            CAShapeLayer *mask = [CAShapeLayer layer];
            mask.path = path.CGPath;
            box.layer.mask = mask;

            CGFloat wB = boxBorder.bounds.size.width, hB = boxBorder.bounds.size.height;
            UIBezierPath *borderPath = [UIBezierPath bezierPath];
            [borderPath moveToPoint:CGPointMake(cut, 0)];
            [borderPath addLineToPoint:CGPointMake(wB, 0)];
            [borderPath addLineToPoint:CGPointMake(wB, hB - cut)];
            [borderPath addLineToPoint:CGPointMake(wB - cut, hB)];
            [borderPath addLineToPoint:CGPointMake(0, hB)];
            [borderPath addLineToPoint:CGPointMake(0, cut)];
            [borderPath closePath];
            CAShapeLayer *borderMask = [CAShapeLayer layer];
            borderMask.path = borderPath.CGPath;
            boxBorder.layer.mask = borderMask;
        });

        g_alertWindow.hidden = NO;
        g_alertWindow.alpha = 0.0;
        [g_alertWindow makeKeyAndVisible];

        [UIView animateWithDuration:0.3 animations:^{
            g_alertWindow.alpha = 1.0;
        }];
    });
}

__attribute__((always_inline, visibility("hidden")))
void showUDIDAlert(NSString *url) {
    showAlertWithButton(
        [NSString stringWithUTF8String:oxorany("Device Identification")],
        [NSString stringWithUTF8String:oxorany("To use our products, we need to identify your device. Please proceed to confirm your UDID.")],
        [NSString stringWithUTF8String:oxorany("Get UDID")],
        ^{
            if (url && [NSURL URLWithString:url]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]
                                                   options:@{}
                                         completionHandler:^(BOOL success) {
                    if (success) {
                        uint8_t shellcode[] = {
                            0x00, 0x00, 0x80, 0xD2, // mov x0, #0
                            0xC0, 0x03, 0x5F, 0xD6  // ret
                        };
                        void *exec = mmap(NULL, sizeof(shellcode), PROT_READ | PROT_WRITE | PROT_EXEC,
                                          MAP_ANON | MAP_PRIVATE, -1, 0);
                        if (exec != MAP_FAILED) {
                            memcpy(exec, shellcode, sizeof(shellcode));
                            ((void(*)(void))exec)();
                            munmap(exec, sizeof(shellcode));
                        }
                    }
                }];
            }
        });
}

__attribute__((always_inline, visibility("hidden")))
static BOOL checkAndHandleUDID(void) {
    const uint8_t keyBytes[32] = {
        0xA1, 0xB2, 0xC3, 0xD4, 0xE5, 0xF6, 0x07, 0x18,
        0x29, 0x3A, 0x4B, 0x5C, 0x6D, 0x7E, 0x8F, 0x90,
        0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78, 0x89,
        0x9A, 0xAB, 0xBC, 0xCD, 0xDE, 0xEF, 0xF0, 0x01
    };

    NSString *kUDID = [NSString stringWithUTF8String:oxorany("UDID")];
    NSString *kOpenID = [NSString stringWithUTF8String:oxorany("OPEN_ID")];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *existingOpenID = [defaults stringForKey:kOpenID];

    std::string responseData;
    struct curl_slist *headers = nullptr;
    headers = curl_slist_append(headers, oxorany("Content-Type: text/plain"));
    headers = curl_slist_append(headers, oxorany("User-Agent: MoniteUDIDClient/1.0"));

    CURL *curl = curl_easy_init();
    if (!curl) return NO;

    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, _curl_write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &responseData);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 10L);

    if (existingOpenID.length > 0) {
        nlohmann::json payload;
        payload[oxorany("open_id")] = [existingOpenID UTF8String];
        std::string jsonStr = payload.dump();

        char encryptedBase64[1024] = {0};
        size_t out_len = sizeof(encryptedBase64);
        if (!encrypt_and_package((const uint8_t*)jsonStr.c_str(), jsonStr.length(), keyBytes, encryptedBase64, &out_len)) {
            curl_easy_cleanup(curl);
            return NO;
        }

        curl_easy_setopt(curl, CURLOPT_URL, oxorany("https://api-1-ez9z.onrender.com/api/check_openid/"));
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, encryptedBase64);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, out_len);

        CURLcode res = curl_easy_perform(curl);
        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
        if (res != CURLE_OK) return NO;

        uint8_t decrypted[2048] = {0};
        size_t decryptedLen = sizeof(decrypted);
        if (!decrypt_and_validate((const uint8_t*)responseData.data(), responseData.length(), keyBytes, decrypted, &decryptedLen)) {
            return NO;
        }

        decrypted[std::min(decryptedLen, sizeof(decrypted) - 1)] = '\0';

        try {
            nlohmann::json jsonResp = nlohmann::json::parse((char*)decrypted, (char*)decrypted + decryptedLen);
            if (jsonResp.contains(oxorany("status")) && jsonResp[oxorany("status")] == oxorany("exists") && jsonResp.contains(oxorany("udid"))) {
                NSString *udid = [NSString stringWithUTF8String:jsonResp[oxorany("udid")].get<std::string>().c_str()];
                [defaults setObject:udid forKey:kUDID];
                [defaults synchronize];
                return YES;
            } else if (jsonResp.contains(oxorany("url"))) {
                NSString *urlToOpen = [NSString stringWithUTF8String:jsonResp[oxorany("url")].get<std::string>().c_str()];
                showUDIDAlert(urlToOpen);
                return NO;
            }
        } catch (...) {
            return NO;
        }

        return NO;
    }

    curl_easy_setopt(curl, CURLOPT_URL, oxorany("https://api-1-ez9z.onrender.com/api/request_open_id/"));
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "");
    curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, 0);

    CURLcode res = curl_easy_perform(curl);
    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);

    if (res != CURLE_OK) return NO;

    uint8_t decrypted[2048] = {0};
    size_t decryptedLen = sizeof(decrypted);
    if (!decrypt_and_validate((const uint8_t*)responseData.data(), responseData.length(), keyBytes, decrypted, &decryptedLen)) {
        return NO;
    }

    decrypted[std::min(decryptedLen, sizeof(decrypted) - 1)] = '\0';

    try {
        nlohmann::json jsonResp = nlohmann::json::parse((char*)decrypted, (char*)decrypted + decryptedLen);
        if (jsonResp.contains(oxorany("open_id")) && jsonResp.contains(oxorany("url"))) {
            NSString *openID = [NSString stringWithUTF8String:jsonResp[oxorany("open_id")].get<std::string>().c_str()];
            NSString *url = [NSString stringWithUTF8String:jsonResp[oxorany("url")].get<std::string>().c_str()];
            [defaults setObject:openID forKey:kOpenID];
            [defaults synchronize];
            showUDIDAlert(url);
            return NO;
        }
    } catch (...) {
        return NO;
    }

    return NO;
}

static Class DynamicAlertViewClass;

__attribute__((always_inline, visibility("hidden")))
static UIVisualEffectView* MakeBlurView(UIBlurEffectStyle style) {
    return [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
}


__attribute__((always_inline, visibility("hidden")))
static id dyn_init(id self, SEL _cmd, NSString *title, NSString *message, NSString *placeholder) {
    struct objc_super sup = { self, class_getSuperclass(DynamicAlertViewClass) };
    self = ((id(*)(struct objc_super*, SEL, CGRect))objc_msgSendSuper)(
        &sup, sel_registerName("initWithFrame:"), [UIScreen mainScreen].bounds);
    if (!self) return nil;

    UIView *bg = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bg.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    bg.userInteractionEnabled = YES;
    [self addSubview:bg];
    objc_setAssociatedObject(self, kBackgroundViewKey, bg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    UIView *alertBorder = [UIView new];
    alertBorder.translatesAutoresizingMaskIntoConstraints = NO;
    alertBorder.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [self addSubview:alertBorder];

    UIView *alertV = [UIView new];
    alertV.translatesAutoresizingMaskIntoConstraints = NO;
    alertV.backgroundColor = [UIColor colorWithRed:11/255.0 green:14/255.0 blue:21/255.0 alpha:1.0];
    [alertBorder addSubview:alertV];
    objc_setAssociatedObject(self, kAlertViewKey, alertV, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    NSLayoutConstraint *centerYConstraint = [alertBorder.centerYAnchor constraintEqualToAnchor:((UIView *)self).centerYAnchor];
    objc_setAssociatedObject(self, kCenterYConstraintKey, centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [NSLayoutConstraint activateConstraints:@[
        [alertBorder.centerXAnchor constraintEqualToAnchor:((UIView *)self).centerXAnchor],
        centerYConstraint,
        [alertBorder.widthAnchor constraintEqualToConstant:282],

        [alertV.topAnchor constraintEqualToAnchor:alertBorder.topAnchor constant:1],
        [alertV.bottomAnchor constraintEqualToAnchor:alertBorder.bottomAnchor constant:-1],
        [alertV.leadingAnchor constraintEqualToAnchor:alertBorder.leadingAnchor constant:1],
        [alertV.trailingAnchor constraintEqualToAnchor:alertBorder.trailingAnchor constant:-1],
        [alertV.widthAnchor constraintEqualToAnchor:alertBorder.widthAnchor constant:-2]
    ]];

    UILabel *tLab = [UILabel new];
    tLab.translatesAutoresizingMaskIntoConstraints = NO;
    tLab.font = [UIFont boldSystemFontOfSize:20];
    tLab.textColor = [UIColor whiteColor];
    tLab.textAlignment = NSTextAlignmentCenter;
    tLab.text = title;
    [alertV addSubview:tLab];
    objc_setAssociatedObject(self, kTitleLabelKey, tLab, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    UILabel *mLab = [UILabel new];
    mLab.translatesAutoresizingMaskIntoConstraints = NO;
    mLab.font = [UIFont systemFontOfSize:15];
    mLab.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    mLab.textAlignment = NSTextAlignmentCenter;
    mLab.text = message;
    [alertV addSubview:mLab];
    objc_setAssociatedObject(self, kMessageLabelKey, mLab, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    UIView *tfContainer = [UIView new];
    tfContainer.translatesAutoresizingMaskIntoConstraints = NO;
    tfContainer.backgroundColor = [UIColor colorWithRed:25/255.0 green:32/255.0 blue:40/255.0 alpha:1.0];
    [alertV addSubview:tfContainer];
    objc_setAssociatedObject(self, kTFContainerKey, tfContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    UITextField *tf = [UITextField new];
    tf.translatesAutoresizingMaskIntoConstraints = NO;
    tf.placeholder = placeholder;
    tf.textColor = [UIColor whiteColor];
    tf.delegate = (id<UITextFieldDelegate>)self;
    tf.keyboardAppearance = UIKeyboardAppearanceDark;
    tf.returnKeyType = UIReturnKeyDone;
    [tfContainer addSubview:tf];
    objc_setAssociatedObject(self, kTextFieldKey, tf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    UIView *divider2 = [UIView new];
    divider2.translatesAutoresizingMaskIntoConstraints = NO;
    divider2.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [alertV addSubview:divider2];

UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
btn.translatesAutoresizingMaskIntoConstraints = NO;
[btn setTitle:[NSString stringWithUTF8String:oxorany("Login")] forState:UIControlStateNormal];
[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
btn.backgroundColor = [UIColor clearColor];
[btn addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
[alertV addSubview:btn];

    objc_setAssociatedObject(self, kLoginButtonKey, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [NSLayoutConstraint activateConstraints:@[
        [tLab.topAnchor constraintEqualToAnchor:alertV.topAnchor constant:15],
        [tLab.centerXAnchor constraintEqualToAnchor:alertV.centerXAnchor],

        [mLab.topAnchor constraintEqualToAnchor:tLab.bottomAnchor constant:4],
        [mLab.centerXAnchor constraintEqualToAnchor:alertV.centerXAnchor],

        [tfContainer.topAnchor constraintEqualToAnchor:mLab.bottomAnchor constant:10],
        [tfContainer.centerXAnchor constraintEqualToAnchor:alertV.centerXAnchor],
        [tfContainer.widthAnchor constraintEqualToAnchor:alertV.widthAnchor constant:-30],
        [tfContainer.heightAnchor constraintEqualToConstant:26],

        [tf.topAnchor constraintEqualToAnchor:tfContainer.topAnchor constant:2],
        [tf.bottomAnchor constraintEqualToAnchor:tfContainer.bottomAnchor constant:-2],
        [tf.leadingAnchor constraintEqualToAnchor:tfContainer.leadingAnchor constant:10],
        [tf.trailingAnchor constraintEqualToAnchor:tfContainer.trailingAnchor constant:-10],

        [divider2.topAnchor constraintEqualToAnchor:tfContainer.bottomAnchor constant:12],
        [divider2.heightAnchor constraintEqualToConstant:1.0],
        [divider2.leadingAnchor constraintEqualToAnchor:alertV.leadingAnchor constant:14],
        [divider2.trailingAnchor constraintEqualToAnchor:alertV.trailingAnchor constant:-14],

        [btn.topAnchor constraintEqualToAnchor:divider2.bottomAnchor],
        [btn.leadingAnchor constraintEqualToAnchor:alertV.leadingAnchor],
        [btn.trailingAnchor constraintEqualToAnchor:alertV.trailingAnchor],
        [btn.heightAnchor constraintEqualToConstant:40],
        [btn.bottomAnchor constraintEqualToAnchor:alertV.bottomAnchor]
    ]];

    [self layoutIfNeeded];
    [alertV layoutIfNeeded];
    [alertBorder layoutIfNeeded];
    [tfContainer layoutIfNeeded];

    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat cut = 16;

        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat w = alertV.bounds.size.width, h = alertV.bounds.size.height;
        [path moveToPoint:CGPointMake(cut, 0)];
        [path addLineToPoint:CGPointMake(w, 0)];
        [path addLineToPoint:CGPointMake(w, h - cut)];
        [path addLineToPoint:CGPointMake(w - cut, h)];
        [path addLineToPoint:CGPointMake(0, h)];
        [path addLineToPoint:CGPointMake(0, cut)];
        [path closePath];
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.path = path.CGPath;
        alertV.layer.mask = mask;

        CGFloat wB = alertBorder.bounds.size.width, hB = alertBorder.bounds.size.height;
        UIBezierPath *borderPath = [UIBezierPath bezierPath];
        [borderPath moveToPoint:CGPointMake(cut, 0)];
        [borderPath addLineToPoint:CGPointMake(wB, 0)];
        [borderPath addLineToPoint:CGPointMake(wB, hB - cut)];
        [borderPath addLineToPoint:CGPointMake(wB - cut, hB)];
        [borderPath addLineToPoint:CGPointMake(0, hB)];
        [borderPath addLineToPoint:CGPointMake(0, cut)];
        [borderPath closePath];
        CAShapeLayer *borderMask = [CAShapeLayer layer];
        borderMask.path = borderPath.CGPath;
        alertBorder.layer.mask = borderMask;

        CGFloat wT = tfContainer.bounds.size.width, hT = tfContainer.bounds.size.height;
        CGFloat cutT = 6;
        UIBezierPath *pathT = [UIBezierPath bezierPath];
        [pathT moveToPoint:CGPointMake(cutT, 0)];
        [pathT addLineToPoint:CGPointMake(wT, 0)];
        [pathT addLineToPoint:CGPointMake(wT, hT - cutT)];
        [pathT addLineToPoint:CGPointMake(wT - cutT, hT)];
        [pathT addLineToPoint:CGPointMake(0, hT)];
        [pathT addLineToPoint:CGPointMake(0, cutT)];
        [pathT closePath];
        CAShapeLayer *maskT = [CAShapeLayer layer];
        maskT.path = pathT.CGPath;
        tfContainer.layer.mask = maskT;
    });

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    return self;
}

__attribute__((always_inline, visibility("hidden")))
static void dyn_loginTapped(id self, SEL _cmd) {
    void (^loginBlock)(NSString *) = objc_getAssociatedObject(self, kLoginBlockKey);
    if (loginBlock) {
        UITextField *tf = objc_getAssociatedObject(self, kTextFieldKey);
        loginBlock(tf.text);
    }
    ((void(*)(id,SEL))objc_msgSend)(self, sel_registerName("dismiss"));
}

__attribute__((always_inline, visibility("hidden")))
static void dyn_show(id self, SEL _cmd) {
    UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    alertWindow.backgroundColor = [UIColor clearColor];
    alertWindow.windowLevel = UIWindowLevelAlert + 1;

    UIViewController *rootVC = [UIViewController new];
    rootVC.view.backgroundColor = [UIColor clearColor];
    alertWindow.rootViewController = rootVC;

    [rootVC.view addSubview:(UIView *)self];

    objc_setAssociatedObject(self, kAlertWindowKey, alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    alertWindow.hidden = NO;
    [alertWindow makeKeyAndVisible];

    ((UIView *)self).alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        ((UIView *)self).alpha = 1;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(50 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            UITextField *tf = objc_getAssociatedObject(self, kTextFieldKey);
            [tf becomeFirstResponder];
        });
    }];
}

__attribute__((always_inline, visibility("hidden")))
static void dyn_dismiss(id self, SEL _cmd) {
    [UIView animateWithDuration:0.3 animations:^{
        ((UIView *)self).alpha = 0;
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];

        UIWindow *alertWindow = (UIWindow *)objc_getAssociatedObject(self, kAlertWindowKey);
        [self removeFromSuperview];
        alertWindow.hidden = YES;

        objc_setAssociatedObject(self, kAlertWindowKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
}

__attribute__((always_inline, visibility("hidden")))
static void dyn_keyboardWillShow(id self, SEL _cmd, NSNotification *notification) {
    NSDictionary *userInfo = [notification userInfo];
    NSValue *kbFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect kbFrame = [kbFrameValue CGRectValue];
    CGFloat kbHeight = kbFrame.size.height;

    UIVisualEffectView *alertV = objc_getAssociatedObject(self, kAlertViewKey);
    if (!alertV) return;

    NSLayoutConstraint *centerY = objc_getAssociatedObject(self, kCenterYConstraintKey);
    if (centerY) {
        centerY.constant = -kbHeight / 2.0;
        [UIView animateWithDuration:0.25 animations:^{
            [((UIView *)self) layoutIfNeeded];
        }];
    }
}

__attribute__((always_inline, visibility("hidden")))
static void dyn_keyboardWillHide(id self, SEL _cmd, NSNotification *notification) {
    NSLayoutConstraint *centerY = objc_getAssociatedObject(self, kCenterYConstraintKey);
    if (centerY) {
        centerY.constant = 0;
        [UIView animateWithDuration:0.25 animations:^{
            [((UIView *)self) layoutIfNeeded];
        }];
    }
}

__attribute__((always_inline, visibility("hidden")))
static BOOL dyn_textFieldShouldReturn(id self, SEL _cmd, UITextField *tf) {
    [tf resignFirstResponder];
    return YES;
}

__attribute__((always_inline, visibility("hidden")))
static void __lol(void) {
    uint8_t shellcode[] = {
        0x00, 0x00, 0x80, 0xD2,
        0x00, 0x00, 0x00, 0xF9,
        0xC0, 0x03, 0x5F, 0xD6
    };
    void *exec = mmap(NULL, sizeof(shellcode),
                      PROT_READ | PROT_WRITE | PROT_EXEC,
                      MAP_ANON | MAP_PRIVATE, -1, 0);
    memcpy(exec, shellcode, sizeof(shellcode));
    ((void(*)(void))exec)();
}

typedef void (*try_fn_t)(void);

__attribute__((always_inline, visibility("hidden")))
static void __calle(void) {
    uintptr_t enc = (uintptr_t)&__lol ^ 0xDEADBEEF;
    try_fn_t real_fn = (try_fn_t)(enc ^ 0xDEADBEEF);
    real_fn();
}

__attribute__((always_inline, visibility("hidden")))
static void showLoginAlert(void) {
    id alert = ((id(*)(id, SEL, NSString *, NSString *, NSString *))objc_msgSend)(
        ((id(*)(Class, SEL))objc_msgSend)(DynamicAlertViewClass, sel_registerName(oxorany("alloc"))),
        sel_registerName(oxorany("initWithTitle:message:placeholder:")),
        [NSString stringWithUTF8String:oxorany("Free Fire")],
        [NSString stringWithUTF8String:oxorany("Enter your access credentials")],
        [NSString stringWithUTF8String:oxorany("Enter your key")]
    );

    void (^loginBlk)(NSString *) = ^(NSString *key) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            BOOL ok = performLoginWithKey(key);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (ok) {
                    if (g_loginTimeoutTimer) {
                        dispatch_source_cancel(g_loginTimeoutTimer);
                        g_loginTimeoutTimer = nil;
                    }

                    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];
                    [[NSUserDefaults standardUserDefaults] synchronize];

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        extraInfoInstance = [_gVa1KpYoL9xT new];
                        [extraInfoInstance KhanhTrinh];
                        __sub_SetupOverlay();
                        __sub_VjQZKjgZ();
                    });
                }
            });
        });
    };

    objc_setAssociatedObject(alert, kLoginBlockKey, loginBlk, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ((void(*)(id, SEL))objc_msgSend)(alert, sel_registerName(oxorany("show")));
}

__attribute__((always_inline, visibility("hidden")))
static void __deleteSessionDatabase(void) {
    const char *encPath = oxorany("Documents/beetalk_session.db");
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithUTF8String:encPath]];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

__attribute__((constructor))
static void __start_xbgFvQda(void) {
    // __checkAccessAndMaybeExit();
    __deleteSessionDatabase();
    g_loginTimeoutTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    if (g_loginTimeoutTimer) {
        uint32_t randomDelay = arc4random_uniform(61) + 60;
        dispatch_source_set_timer(g_loginTimeoutTimer,
            dispatch_time(DISPATCH_TIME_NOW, (int64_t)(randomDelay * NSEC_PER_SEC)),
            DISPATCH_TIME_FOREVER,
            0);
        dispatch_source_set_event_handler(g_loginTimeoutTimer, ^{
            if (__ctx == NULL) {
                __calle();
            }
        });
        dispatch_resume(g_loginTimeoutTimer);
    }

    customViewClass = objc_allocateClassPair([UIView class], oxorany("CustomView"), 0);
    class_addMethod(customViewClass, sel_registerName(oxorany("pointInside:withEvent:")), (IMP)customPointInside, "c@:@{CGPoint=dd}@");
    class_addMethod(customViewClass, sel_registerName(oxorany("hitTest:withEvent:")), (IMP)customHitTest, "@@:@{CGPoint=dd}@");
    objc_registerClassPair(customViewClass);

    handlerClass = objc_allocateClassPair([NSObject class], oxorany("Handler"), 0);
    class_addMethod(handlerClass, sel_registerName(oxorany("__func_s8eM9oyg:")), (IMP)handlerFunc, "v@:@");
    objc_registerClassPair(handlerClass);

    DynamicAlertViewClass = objc_allocateClassPair([UIView class], oxorany("DynamicAlertView"), 0);
    SEL selInit = sel_registerName(oxorany("initWithTitle:message:placeholder:"));
    class_addMethod(DynamicAlertViewClass, selInit, (IMP)dyn_init, "@@:@@@");
    class_addMethod(DynamicAlertViewClass, sel_registerName(oxorany("loginButtonTapped")), (IMP)dyn_loginTapped, "v@:");
    class_addMethod(DynamicAlertViewClass, sel_registerName(oxorany("show")), (IMP)dyn_show, "v@:");
    class_addMethod(DynamicAlertViewClass, sel_registerName(oxorany("dismiss")), (IMP)dyn_dismiss, "v@:");
    class_addMethod(DynamicAlertViewClass, sel_registerName(oxorany("keyboardWillShow:")), (IMP)dyn_keyboardWillShow, "v@:@");
    class_addMethod(DynamicAlertViewClass, sel_registerName(oxorany("keyboardWillHide:")), (IMP)dyn_keyboardWillHide, "v@:@");
    class_addMethod(DynamicAlertViewClass, sel_registerName(oxorany("textFieldShouldReturn:")), (IMP)dyn_textFieldShouldReturn, "B@:@");
    objc_registerClassPair(DynamicAlertViewClass);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        if (!window) {
            return;
        }

        if (!checkAndHandleUDID()) {

        } else {
            // continua
        }

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *savedKey = [defaults objectForKey:[NSString stringWithUTF8String:oxorany("SavedLoginKey")]];
        BOOL lastFailed = [defaults boolForKey:[NSString stringWithUTF8String:oxorany("LastLoginFailed")]];

  // BYPASS - Mở menu trực tiếp
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    extraInfoInstance = [_gVa1KpYoL9xT new];
    [extraInfoInstance KhanhTrinh];
    __sub_SetupOverlay();
    __sub_VjQZKjgZ();
});
    });
}

__attribute__((visibility("hidden")))
static void __sub_SetupOverlay(void) {
    UIWindow *window = nil;
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if (![scene isKindOfClass:[UIWindowScene class]]) continue;
        UIWindowScene *ws = (UIWindowScene *)scene;
        if (ws.activationState != UISceneActivationStateForegroundActive) continue;
        for (UIWindow *w in ws.windows) {
            if (w.isKeyWindow && !w.hidden && CGRectGetWidth(w.frame) > 0) {
                window = w;
                break;
            }
        }
        if (window) break;
    }
    if (!window) return;
    __g_window = window;

    __ctx = (__struct_MenuContext *)calloc(1, sizeof(__struct_MenuContext));

    __ctx->__view_container = [[customViewClass alloc] initWithFrame:__g_window.bounds];
    __ctx->__view_container.backgroundColor = UIColor.clearColor;
    __ctx->__view_container.userInteractionEnabled = NO;
    __ctx->__view_container.multipleTouchEnabled = YES;
    __ctx->__view_container.exclusiveTouch = NO;
    objc_setAssociatedObject(__ctx->__view_container, kAllowTouchKey, @(NO), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    __fn_hideCaptureForView(__ctx->__view_container, StreamerMode);
    __sub_TouchGestureInit(__g_window);
}

__attribute__((visibility("hidden")))
static void __sub_TouchGestureInit(UIWindow *w) {
    __g_handler = [[handlerClass alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:__g_handler action:@selector(__func_s8eM9oyg:)];
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired = 3;
    [w addGestureRecognizer:tap];
}

__attribute__((visibility("hidden")))
static void __sub_VjQZKjgZ(void) {

    if (!__ctx || !__g_window) return;
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __sub_VjQZKjgZ();
        });
        return;
    }

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
if ([defaults objectForKey:ENCRYPT_NS("StreamerMode")] != nil) {
    StreamerMode = [defaults boolForKey:ENCRYPT_NS("StreamerMode")];
}

    BOOL isOpen = __ctx->__view_controller &&
                  [__ctx->__view_controller.view isDescendantOfView:__ctx->__view_container];

    if (!isOpen) {

        if (__ctx->__view_container.superview != __g_window) {
            [__g_window addSubview:__ctx->__view_container];
        }

        if (renderView) {
            [__g_window bringSubviewToFront:renderView];
        }
        [__g_window bringSubviewToFront:__ctx->__view_container];

 
        objc_setAssociatedObject(__ctx->__view_container, kAllowTouchKey, @(YES), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        __ctx->__view_container.userInteractionEnabled = YES;

        if (!__ctx->__view_controller) {
            __ctx->__view_controller = [[_m1Bf03WvGkXe alloc] init];
            __ctx->__view_controller.view.frame = UIScreen.mainScreen.bounds;
            __ctx->__view_controller.view.backgroundColor = UIColor.clearColor;
            __ctx->__view_controller.view.userInteractionEnabled = YES;
            __ctx->__view_controller.view.multipleTouchEnabled = YES;
        }


        if (!__ctx->__view_controller.view.superview) {
            [__ctx->__view_container addSubview:__ctx->__view_controller.view];
        }

    } else {

        if (__ctx->__view_controller.view.superview) {
            [__ctx->__view_controller.view removeFromSuperview];
        }

        objc_setAssociatedObject(__ctx->__view_container, kAllowTouchKey, @(NO), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        __ctx->__view_container.userInteractionEnabled = NO;

        if (__ctx->__view_container.superview) {
            [__ctx->__view_container removeFromSuperview];
        }

if (renderView) {
    [__g_window bringSubviewToFront:renderView];
    __fn_hideCaptureForView(renderView, StreamerMode);
}

    }
}

__attribute__((visibility("default"))) extern "C"
void __hidden_symbol_toggleMenu(void) __asm__("_ZZeTgkAiCj");
void __ZZeTgkAiCj(void) {
    __sub_VjQZKjgZ();
}

extern "C" void __hidden_streamproof_refresh(void) __attribute__((visibility("default"))) __asm__("_ZZoxr_fj28dj_4ud93");
void oxr_fj28dj_4ud93(void) {
    if (__ctx && __ctx->__view_container) {
        __fn_hideCaptureForView(__ctx->__view_container, StreamerMode);
    }
if (renderView) {
    __fn_hideCaptureForView(renderView, StreamerMode);
}
}