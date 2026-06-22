#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "menu.h"
#import "icons.h"
#import "fonts.h"
#import <dlfcn.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "load/load.h"
#import "load/globals.h"
#import "load/imguiload.h"
#import "AppLanguageBridge.h"
#import "Obfuscate.h"
#import "load/StreamerModeProtect.h"
#import <CommonCrypto/CommonCryptor.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#define menuContainer    _kNhz28MfAL9o
#define sidebarView      _PxYqLm9R7TuE
#define contentView      _Zq3uAj94kVbL
#define aimbotView       _QpWkzN7LmD9R
#define visualsView      _Yz83fLpKAd2w
#define miscView         _VqZ4TruM8xNc
#define weaponView       _x4TbL7pRtWqL
#define settingsView     _NaDk97vPq1Mf
#define accountView      _fKzRmX9Wo8Bd
#define versionView      _EwYtZb2UcK4n
#define currentTab       _pTrmW8ZjAo3X
#define initialTouchPoint _RqZmLp7bMc5D

#define iconEye          _IkNaKc7QWmv1
#define iconAimbot       _ZxWvLm1BoPr8
#define iconMisc         _Lt4MvNzpK1Df
#define iconWeapon       _WxP1z9KmRoAv
#define iconSettings     _KaR7XoJmTzLn
#define iconAccount      _QwZnKp8MdJoE
#define iconVersion      _YlXwVrMb0AcL
#define iconCheck        _CrZmLx9KqBp0
#define iconWarning      _BvZmNt6PoRcD
#define iconSave _mRz81DfKwTqL
#define arrowDown _xNg72VpOyMzR

#define fontRegular      _AoPvJt9ZwRmL
#define fontSemiBold     _XrTvKoMw3Bd9

#define imageFromBase64 _dLq35VcJyUaR
#define registerFontFromBase64 _sNk49XpBmEtG

#define handlePan _nWo53CxYuEwL
#define gestureRecognizer _fNz82WkBtMeY
#define shouldReceiveTouch _vTp91LrXeOqD

#define buildVersionViewInto _aFx91TrLbXpC
#define buildAccountViewInto _kPz82YtGcNmW
#define buildSettingsViewInto _jDx73WqLtOyF
#define buildWeaponViewInto _vRk64AsLqNeD
#define buildMiscViewInto _rXy84QwLnMvD
#define buildVisualsViewInto _gJu19EcLpAzB
#define buildAimbotViewInto _tBh53KrXuQnM
#define startY _jUy45DsWnQoL

#define closeOpenComboFromTap _zXw61NeCoTfR

#define addComboBoxTo _vLa27RhGpYqE
#define atY _qZw47BmLoPxN
#define withTitle _eNc92SdXtFwL
#define selectedIndex _bYq31LtPwMxJ
#define hasWarning _zXw61NeCoT13d

#define addSliderTo _sLp45MwXtZcV
#define withText _vEz29RnCfQoP
#define valueRef _kTu39OwMaCvX
#define min _pDz18RfWtMzL
#define max _zLq71EvBnXaS

#define addCheckboxTo _yHt92XbQeUwA
#define enabledRef _jRx83WqMzNtP
#define isWarning _lFt93QoVaNwD

#define addColorPickerTo _kWe48NpGrYbL
#define colorRef _cVf27HoRaLqK
#define title _uFp38NxQmEtB

#define showFloatingInputAboveKeyboard _eSa72IqDnTyJ
#define finishFloatingInput _zRt63UxCyPfL
#define keyboardWillShow _nYw85MbWkStV
#define keyboardWillHide _bJq18VfNcOtZ
#define findFloatingInput _vXc53PtYsEdM
#define handleHexFieldChange _rGh41OzXtPwM

#define addActionButtonTo _pNy62FbKsTrQ
#define withIcon _mTy85RcLqQnX
#define iconTint _hZq28UdMnPvE
#define actionBlock _vLk49YrAzBpH

#define GetLinkedColorFromLabel _fQm96LxCtNuA
#define label _wMz42SnKrTyJ
#define saveSettings _bWy30DpKqLtC

#define loadSettings _XzK94LmBtJpW
#define resetSettingsToDefaults _TvQ83NcRvYhF

#define menuAlpha _JmP72VrQaLcZ
#define iconRestore _DnW58HtZxKoE

#define buildSidebar _vGr84NzTcLpW

#define handleWarningPress _nDz38LoCrJmS
#define updateContentView _wFk28MvTbYxL
#define _handleTapGesture _qVg64EkBnTuP
#define didTapTab _mUx73KsWiAoZ
#define animated _yZhxEvB1dVwU

#define _xR3mZ28JqU1o _mKXkuH8WZzg7
#define set_xR3mZ28JqU1o _wWrL9ppo79Vi

#define _a9DkPq7LsTv0 _1iKVEJDE2vRW
#define from _TVSjF2xLvN57
#define navigation _7UXX4pnnpA4x
#define paramter _c77Z24v0to35
#define cxx_destruct _3a1Ur9xzuzJL

@interface _a9DkPq7LsTv0 : UIView
@property (nonatomic, strong) NSArray<UIView *> *_xR3mZ28JqU1o;
@end

@implementation _a9DkPq7LsTv0
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self._xR3mZ28JqU1o) {
        if (view && [view window]) {
            CGPoint pointInView = [self convertPoint:point toView:view];
            if ([view pointInside:pointInView withEvent:event]) {
                return NO; 
            }
        }
    }
    return [super pointInside:point withEvent:event];
}
@end

@interface _vGr84NzTcLpW : UILabel
@property (nonatomic, assign) UIEdgeInsets textInsets;
@end

@implementation _vGr84NzTcLpW

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.textInsets = UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width += self.textInsets.left + self.textInsets.right;
    size.height += self.textInsets.top + self.textInsets.bottom;
    return size;
}
@end

static _m1Bf03WvGkXe *gMenuController = nil;
static int selectedColorIndex = 0;
static UIColor *strongColor = nil;
UIColor *panelAccentColor = nil;

typedef NS_ENUM(NSUInteger, MenuTab) {
    MenuTabAimbot = 0,
    MenuTabVisuals = 1,
    MenuTabWeapon = 2,
    MenuTabMisc    = 3,
    MenuTabSettings= 4,
    MenuTabAccount = 5,
    MenuTabVersion = 6
};

@implementation _m1Bf03WvGkXe {
    UIView *menuContainer;
    UIView *sidebarView;
    UIView *contentView;
    UIView *aimbotView;
    UIView *visualsView;
    UIView *miscView;
    UIView *weaponView;
    UIView *settingsView;
    UIView *accountView;
    UIView *versionView;
    MenuTab currentTab;
    CGPoint initialTouchPoint;
    float menuAlpha;
}

static NSInteger lastToggledVisualIndex = -1;
static BOOL lastToggledStreamer = NO;
bool StreamerMode = false;
BOOL headerNeedsLanguageRefresh = NO;
static UIImage *iconAimbot   = nil;
static UIImage *iconEye      = nil;
static UIImage *iconMisc     = nil;
static UIImage *iconWeapon   = nil;
static UIImage *iconSettings = nil;
static UIImage *iconAccount  = nil;
static UIImage *iconVersion  = nil;
static UIImage *iconCheck    = nil;
static UIImage *iconWarning  = nil;
static UIImage *iconSave     = nil;
static UIImage *iconRestore  = nil;
static UIImage *arrowDown    = nil;

static UIFont *fontRegular   = nil;
static UIFont *fontSemiBold  = nil;

bool norecoil = false;
bool forceHighFPS = false;
bool resetguest = false;
bool swapweapon = false;
bool infiniteAmmo = false;
bool allowShootWhileMoving = false;
bool fastReload = false;

#define LOAD_BOOL(v) { \
    NSString *k = [NSString stringWithUTF8String:ENCRYPT_CSTR(#v)]; \
    if ([defaults objectForKey:k]) v = [defaults boolForKey:k]; \
}

#define LOAD_INT_DEFAULT(v, def) { \
    NSString *k = [NSString stringWithUTF8String:ENCRYPT_CSTR(#v)]; \
    v = [defaults objectForKey:k] ? [defaults integerForKey:k] : def; \
}

#define LOAD_FLOAT_DEFAULT(v, def) { \
    NSString *k = [NSString stringWithUTF8String:ENCRYPT_CSTR(#v)]; \
    v = [defaults objectForKey:k] ? [defaults floatForKey:k] : def; \
}

__attribute__((always_inline)) NSString *EncryptedSettingsPath() {
    const char *pathCstr = oxorany("Library/Preferences/.monitepreferences");
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithUTF8String:pathCstr]];
}

__attribute__((always_inline)) NSData *AESKeyData() {
    const char *keyCstr = oxorany("Xv3Z!q2@7bNh#R94kLmQpT0cYwAzEfGu");
    return [NSData dataWithBytes:keyCstr length:strlen(keyCstr)];
}

__attribute__((always_inline)) NSData *AESIVData() {
    const char *ivCstr = oxorany("v8Tn#m5GzAqX2LpW");
    return [NSData dataWithBytes:ivCstr length:strlen(ivCstr)];
}

NSData *aesEncrypt(NSData *data, NSData *key, NSData *iv) {
    size_t outLength;
    NSMutableData *cipherData = [NSMutableData dataWithLength:data.length + kCCBlockSizeAES128];
    CCCryptorStatus result = CCCrypt(kCCEncrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                     key.bytes, key.length, iv.bytes,
                                     data.bytes, data.length,
                                     cipherData.mutableBytes, cipherData.length, &outLength);
    if (result == kCCSuccess) {
        cipherData.length = outLength;
        return cipherData;
    }
    return nil;
}

NSData *aesDecrypt(NSData *data, NSData *key, NSData *iv) {
    size_t outLength;
    NSMutableData *decryptedData = [NSMutableData dataWithLength:data.length];
    CCCryptorStatus result = CCCrypt(kCCDecrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                     key.bytes, key.length, iv.bytes,
                                     data.bytes, data.length,
                                     decryptedData.mutableBytes, decryptedData.length, &outLength);
    if (result == kCCSuccess) {
        decryptedData.length = outLength;
        return decryptedData;
    }
    return nil;
}

- (void)saveSettings {
    NSDictionary<NSString *, id> *dict = @{
        @(oxorany("saved_language")): @(currentLanguage),
        @(oxorany("ESPEnable")): @(ESPEnable),
        @(oxorany("ESPLine")): @(ESPLine),
        @(oxorany("ESPBox")): @(ESPBox),
        @(oxorany("ESP2DBox")): @(ESP2DBox),
        @(oxorany("ESP3DBox")): @(ESP3DBox),
        @(oxorany("ESP3DBox2")): @(ESP3DBox2),
        @(oxorany("ESPCount")): @(ESPCount),
        @(oxorany("ESPArrow")): @(ESPArrow),
        @(oxorany("ESPArrow2")): @(ESPArrow2),
        @(oxorany("ESPHealth")): @(ESPHealth),
        @(oxorany("ESPHealth2")): @(ESPHealth2),
        @(oxorany("ESPName")): @(ESPName),
        @(oxorany("ESPOutline")): @(ESPOutline),
        @(oxorany("ESPDistance")): @(ESPDistance),
        @(oxorany("ESPDistance2")): @(ESPDistance2),
        @(oxorany("RS")): @(RS),
        @(oxorany("ESPSkeleton")): @(ESPSkeleton),
        @(oxorany("StreamerMode")): @(StreamerMode),
        @(oxorany("Aimbot")): @(Aimbot),
        @(oxorany("SilentAim")): @(SilentAim),
        @(oxorany("IgnoreBots")): @(IgnoreBots),
        @(oxorany("IgnoreKnocked")): @(IgnoreKnocked),
        @(oxorany("OnlyVisibleEnemies")): @(OnlyVisibleEnemies),
        @(oxorany("norecoil")): @(norecoil),
        @(oxorany("forceHighFPS")): @(forceHighFPS),
        @(oxorany("resetguest")): @(resetguest),
        @(oxorany("swapweapon")): @(swapweapon),
        @(oxorany("fastReload")): @(fastReload),
        @(oxorany("enableESP")): @(enableESP),
        @(oxorany("sliderDistanceValue")): @(sliderDistanceValue),
        @(oxorany("AimbotFOV")): @(AimbotFOV),
        @(oxorany("Fov")): @(Fov),
        @(oxorany("AimDis")): @(AimDis),
        @(oxorany("AimCheck")): @(AimCheck),
        @(oxorany("AimType")): @(AimType),
        @(oxorany("AimWhen")): @(AimWhen),
        @(oxorany("AimMode")): @(AimMode),
        @(oxorany("AimTarget")): @(AimTarget),
        @(oxorany("menuAlpha")): @(menuAlpha),
        @(oxorany("selectedColorIndex")): @(selectedColorIndex)
    };

    NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:dict format:NSPropertyListBinaryFormat_v1_0 options:0 error:nil];
    NSData *encrypted = aesEncrypt(plistData, AESKeyData(), AESIVData());
    if (encrypted) {
        [encrypted writeToFile:EncryptedSettingsPath() atomically:YES];
    }
}

- (void)loadSettings {
    NSData *data = [NSData dataWithContentsOfFile:EncryptedSettingsPath()];
    if (!data) {
        [self resetSettingsToDefaults];
        return;
    }

    NSData *decrypted = aesDecrypt(data, AESKeyData(), AESIVData());
    if (!decrypted) {
        [self resetSettingsToDefaults];
        return;
    }

    NSError *error = nil;
    NSDictionary *dict = [NSPropertyListSerialization propertyListWithData:decrypted
                                                                   options:NSPropertyListImmutable
                                                                    format:nil
                                                                     error:&error];
    if (![dict isKindOfClass:[NSDictionary class]] || error) {
        [self resetSettingsToDefaults];
        return;
    }

    currentLanguage = (AppLanguage)[dict[@(oxorany("saved_language"))] intValue];
    ESPEnable = [dict[@(oxorany("ESPEnable"))] boolValue];
    ESPLine = [dict[@(oxorany("ESPLine"))] boolValue];
    ESPBox = [dict[@(oxorany("ESPBox"))] boolValue];
    ESP2DBox = [dict[@(oxorany("ESP2DBox"))] boolValue];
    ESP3DBox = [dict[@(oxorany("ESP3DBox"))] boolValue];
    ESP3DBox2 = [dict[@(oxorany("ESP3DBox2"))] boolValue];
    ESPCount = [dict[@(oxorany("ESPCount"))] boolValue];
    ESPArrow = [dict[@(oxorany("ESPArrow"))] boolValue];
    ESPArrow2 = [dict[@(oxorany("ESPArrow2"))] boolValue];
    ESPHealth = [dict[@(oxorany("ESPHealth"))] boolValue];
    ESPHealth2 = [dict[@(oxorany("ESPHealth2"))] boolValue];
    ESPName = [dict[@(oxorany("ESPName"))] boolValue];
    ESPOutline = [dict[@(oxorany("ESPOutline"))] boolValue];
    ESPDistance = [dict[@(oxorany("ESPDistance"))] boolValue];
    ESPDistance2 = [dict[@(oxorany("ESPDistance2"))] boolValue];
    RS = [dict[@(oxorany("RS"))] boolValue];
    ESPSkeleton = [dict[@(oxorany("ESPSkeleton"))] boolValue];
    StreamerMode = [dict[@(oxorany("StreamerMode"))] boolValue];
    Aimbot = [dict[@(oxorany("Aimbot"))] boolValue];
    SilentAim = [dict[@(oxorany("SilentAim"))] boolValue];
    IgnoreBots = [dict[@(oxorany("IgnoreBots"))] boolValue];
    IgnoreKnocked = [dict[@(oxorany("IgnoreKnocked"))] boolValue];
    OnlyVisibleEnemies = [dict[@(oxorany("OnlyVisibleEnemies"))] boolValue];
    norecoil = [dict[@(oxorany("norecoil"))] boolValue];
    forceHighFPS = [dict[@(oxorany("forceHighFPS"))] boolValue];
    resetguest = [dict[@(oxorany("resetguest"))] boolValue];
    swapweapon = [dict[@(oxorany("swapweapon"))] boolValue];
    fastReload = [dict[@(oxorany("fastReload"))] boolValue];
    enableESP = [dict[@(oxorany("enableESP"))] boolValue];
    Fov = [dict[@(oxorany("Fov"))] boolValue];

    sliderDistanceValue = [dict[@(oxorany("sliderDistanceValue"))] floatValue];
    AimbotFOV = [dict[@(oxorany("AimbotFOV"))] floatValue];
    AimDis = [dict[@(oxorany("AimDis"))] floatValue];

    AimCheck = [dict[@(oxorany("AimCheck"))] intValue];
    AimType = [dict[@(oxorany("AimType"))] intValue];
    AimWhen = [dict[@(oxorany("AimWhen"))] intValue];
    AimMode = [dict[@(oxorany("AimMode"))] intValue];
    AimTarget = [dict[@(oxorany("AimTarget"))] intValue];

    menuAlpha = [dict[@(oxorany("menuAlpha"))] floatValue];
    selectedColorIndex = [dict[@(oxorany("selectedColorIndex"))] intValue];

    if (!colorValues || selectedColorIndex < 0 || selectedColorIndex >= colorValues.count) {
        selectedColorIndex = 0;
    }

    self.panelAccentColor = colorValues[selectedColorIndex];
    panelAccentColor = self.panelAccentColor;
}

- (void)resetSettingsToDefaults {
    currentLanguage = AppLanguageEnglish;
    menuAlpha = 1.0f;

    ESPEnable = false;
    ESPLine = false;
    ESPBox = false;
    ESP2DBox = false;
    ESP3DBox = false;
    ESP3DBox2 = false;
    ESPCount = false;
    ESPArrow = false;
    ESPArrow2 = false;
    ESPHealth = false;
    ESPHealth2 = false;
    ESPName = false;
    ESPOutline = false;
    ESPDistance = false;
    ESPDistance2 = false;
    RS = false;
    ESPSkeleton = false;
    StreamerMode = false;
    Fov = false;

    Aimbot = false;
    SilentAim = false;
    IgnoreBots = false;
    IgnoreKnocked = false;
    OnlyVisibleEnemies = false;

    norecoil = false;
    forceHighFPS = false;
    resetguest = false;
    swapweapon = false;
    enableESP = false;
    fastReload = false;

    sliderDistanceValue = 300.0f;
    AimbotFOV = 90.0f;
    AimDis = 150.0f;

    AimCheck = 0;
    AimType = 0;
    AimWhen = 1;
    AimMode = 1;
    AimTarget = 0;

    selectedColorIndex = 0;
    strongColor = [UIColor colorWithRed:0.8 green:0.5 blue:1.0 alpha:1.0];
    self.panelAccentColor = strongColor;
    panelAccentColor = self.panelAccentColor;

    const char *encPath = oxorany("Library/Preferences/.monitepreferences");
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithUTF8String:encPath]];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:filePath]) {
        NSError *error = nil;
        [fm removeItemAtPath:filePath error:&error];
    }

    [self saveSettings];
}

- (NSArray<NSString *> *)localizedColorNames {
    return @[
        LocalizedStringObjC(ENCRYPT_NS("Purple")),
        LocalizedStringObjC(ENCRYPT_NS("Red")),
        LocalizedStringObjC(ENCRYPT_NS("Cyan")),
        LocalizedStringObjC(ENCRYPT_NS("Dark Blue")),
        LocalizedStringObjC(ENCRYPT_NS("Yellow")),
        LocalizedStringObjC(ENCRYPT_NS("Green")),
        LocalizedStringObjC(ENCRYPT_NS("Orange")),
        LocalizedStringObjC(ENCRYPT_NS("Pink")),
        LocalizedStringObjC(ENCRYPT_NS("Teal")),
        LocalizedStringObjC(ENCRYPT_NS("Indigo")),
        LocalizedStringObjC(ENCRYPT_NS("Lime")),
        LocalizedStringObjC(ENCRYPT_NS("Brown")),
        LocalizedStringObjC(ENCRYPT_NS("Sky Blue")),
        LocalizedStringObjC(ENCRYPT_NS("Rose")),
        LocalizedStringObjC(ENCRYPT_NS("Lavender")),
        LocalizedStringObjC(ENCRYPT_NS("Mint")),
        LocalizedStringObjC(ENCRYPT_NS("Coral")),
        LocalizedStringObjC(ENCRYPT_NS("Turquoise")),
        LocalizedStringObjC(ENCRYPT_NS("Gold")),
        LocalizedStringObjC(ENCRYPT_NS("Silver")),
        LocalizedStringObjC(ENCRYPT_NS("Neon Green")),
        LocalizedStringObjC(ENCRYPT_NS("Neon Pink")),
        LocalizedStringObjC(ENCRYPT_NS("Deep Purple")),
        LocalizedStringObjC(ENCRYPT_NS("Crimson")),
        LocalizedStringObjC(ENCRYPT_NS("Electric Blue")),
        LocalizedStringObjC(ENCRYPT_NS("Sunset Orange"))
    ];
}

NSArray<UIColor *> *colorValues = @[
    [UIColor colorWithRed:0.8 green:0.5 blue:1.0 alpha:1.0],   // Purple
    [UIColor colorWithRed:1.0 green:0.3 blue:0.3 alpha:1.0],   // Red
    [UIColor colorWithRed:0.3 green:1.0 blue:1.0 alpha:1.0],   // Cyan
    [UIColor colorWithRed:0.2 green:0.4 blue:1.0 alpha:1.0],   // Dark Blue
    [UIColor colorWithRed:1.0 green:1.0 blue:0.4 alpha:1.0],   // Yellow
    [UIColor colorWithRed:0.3 green:1.0 blue:0.3 alpha:1.0],   // Green
    [UIColor colorWithRed:1.0 green:0.6 blue:0.2 alpha:1.0],   // Orange
    [UIColor colorWithRed:1.0 green:0.4 blue:0.7 alpha:1.0],   // Pink
    [UIColor colorWithRed:0.2 green:0.8 blue:0.8 alpha:1.0],   // Teal
    [UIColor colorWithRed:0.5 green:0.4 blue:0.9 alpha:1.0],   // Indigo
    [UIColor colorWithRed:0.8 green:1.0 blue:0.2 alpha:1.0],   // Lime
    [UIColor colorWithRed:0.6 green:0.4 blue:0.2 alpha:1.0],   // Brown
    [UIColor colorWithRed:0.53 green:0.81 blue:0.98 alpha:1.0], // Sky Blue
    [UIColor colorWithRed:1.0 green:0.55 blue:0.71 alpha:1.0],  // Rose
    [UIColor colorWithRed:0.9 green:0.9 blue:0.98 alpha:1.0],   // Lavender
    [UIColor colorWithRed:0.74 green:1.0 blue:0.78 alpha:1.0],  // Mint
    [UIColor colorWithRed:1.0 green:0.5 blue:0.31 alpha:1.0],   // Coral
    [UIColor colorWithRed:0.25 green:0.88 blue:0.82 alpha:1.0], // Turquoise
    [UIColor colorWithRed:1.0 green:0.84 blue:0.0 alpha:1.0],   // Gold
    [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0], // Silver
    [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0],    // Neon Green
    [UIColor colorWithRed:1.0 green:0.08 blue:0.58 alpha:1.0],  // Neon Pink
    [UIColor colorWithRed:0.4 green:0.0 blue:0.6 alpha:1.0],    // Deep Purple
    [UIColor colorWithRed:0.86 green:0.08 blue:0.24 alpha:1.0], // Crimson
    [UIColor colorWithRed:0.0 green:0.4 blue:1.0 alpha:1.0],    // Electric Blue
    [UIColor colorWithRed:1.0 green:0.37 blue:0.0 alpha:1.0]    // Sunset Orange
];

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static _m1Bf03WvGkXe *shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    gMenuController = self;

    @try {
        [self loadSettings];
    } @catch (NSException *exception) {
        [self resetSettingsToDefaults];
    }

    CGFloat menuWidth = 425, menuHeight = 340;
    CGSize screenSize = self.view.bounds.size;
    CGRect menuFrame = CGRectMake((screenSize.width - menuWidth) / 2,
                                  (screenSize.height - menuHeight) / 2,
                                  menuWidth,
                                  menuHeight);

    menuContainer = [[UIView alloc] initWithFrame:menuFrame];
    menuContainer.alpha = menuAlpha;
    menuContainer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.view addSubview:menuContainer];

    // Estilo cortado igual alerta
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat cut = 16;
        CGFloat w = menuContainer.bounds.size.width;
        CGFloat h = menuContainer.bounds.size.height;

        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(cut, 0)];
        [path addLineToPoint:CGPointMake(w, 0)];
        [path addLineToPoint:CGPointMake(w, h - cut)];
        [path addLineToPoint:CGPointMake(w - cut, h)];
        [path addLineToPoint:CGPointMake(0, h)];
        [path addLineToPoint:CGPointMake(0, cut)];
        [path closePath];

        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.path = path.CGPath;
        menuContainer.layer.mask = mask;
    });

    self.sidebarScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 113, menuHeight)];
    self.sidebarScroll.showsVerticalScrollIndicator = NO;
    self.sidebarScroll.backgroundColor = [UIColor colorWithRed:11/255.0 green:14/255.0 blue:21/255.0 alpha:1.0];
    [menuContainer addSubview:self.sidebarScroll];

    sidebarView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.sidebarScroll addSubview:sidebarView];

    contentView = [[UIView alloc] initWithFrame:CGRectMake(112, 0, menuWidth - 112, menuHeight)];
    contentView.backgroundColor = self.sidebarScroll.backgroundColor;
    [menuContainer addSubview:contentView];

    UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(113, 0, 1, menuHeight)];
    divider.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [menuContainer addSubview:divider];

    [self buildSidebar];
    [self updateContentView];
}

- (void)buildSidebar {
    NSArray<NSString *> *tabTitles = @[
        LocalizedStringObjC(ENCRYPT_NS("Aimbot")),
        LocalizedStringObjC(ENCRYPT_NS("Visuals")),
        LocalizedStringObjC(ENCRYPT_NS("Weapon")),
        LocalizedStringObjC(ENCRYPT_NS("Misc")),
        LocalizedStringObjC(ENCRYPT_NS("Settings")),
        LocalizedStringObjC(ENCRYPT_NS("Account")),
        LocalizedStringObjC(ENCRYPT_NS("Version"))
    ];

    NSArray<UIImage *> *tabIcons = @[iconAimbot, iconEye, iconWeapon, iconMisc, iconSettings, iconAccount, iconVersion];

    CGFloat itemHeight = 60, spacing = 10, itemWidth = 110;

    for (int i = 0; i < tabTitles.count; i++) {
        UIView *tabItem = [sidebarView viewWithTag:1000 + i];
        BOOL selected = (i == currentTab);

        if (!tabItem) {
            tabItem = [[UIView alloc] initWithFrame:CGRectMake(0, spacing + i * (itemHeight + spacing), itemWidth, itemHeight)];
            tabItem.tag = 1000 + i;

            UIView *background = [[UIView alloc] initWithFrame:CGRectMake(spacing, 0, itemWidth - spacing * 2, itemHeight)];
            background.tag = 2000;
            [tabItem addSubview:background];

            UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake((background.frame.size.width - 20) / 2, 10, 20, 20)];
            iconView.tag = 3000;
            iconView.contentMode = UIViewContentModeScaleAspectFit;
            [background addSubview:iconView];

            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconView.frame) + 2, background.frame.size.width, 20)];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = fontRegular;
            label.tag = 4000;
            [background addSubview:label];

            UIButton *tap = [[UIButton alloc] initWithFrame:tabItem.bounds];
            tap.backgroundColor = UIColor.clearColor;
            tap.tag = i;
            [tap addTarget:self action:@selector(didTapTab:) forControlEvents:UIControlEventTouchUpInside];
            [tabItem addSubview:tap];

            [sidebarView addSubview:tabItem];
        }

        UIView *bg = [tabItem viewWithTag:2000];
        UIImageView *icon = [bg viewWithTag:3000];
        UILabel *label = [bg viewWithTag:4000];

        bg.backgroundColor = selected ? [UIColor colorWithRed:6/255.0 green:9/255.0 blue:14/255.0 alpha:1.0] : UIColor.clearColor;
        icon.image = [tabIcons[i] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.tintColor = selected ? UIColor.whiteColor : [UIColor colorWithWhite:0.7 alpha:1.0];
        label.text = tabTitles[i];
        label.textColor = icon.tintColor;

        for (UIView *sub in bg.subviews) {
            if (sub.frame.size.width == 4) [sub removeFromSuperview];
        }

        if (selected) {
            UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(bg.frame.size.width - 4, 0, 4, itemHeight)];
            bar.backgroundColor = self.panelAccentColor;
            bar.alpha = 0.0;
            [bg addSubview:bar];
            [UIView animateWithDuration:0.25 animations:^{ bar.alpha = 1.0; }];

dispatch_async(dispatch_get_main_queue(), ^{
    applyDiagonalMaskToView(bg, 10);
});
        } else {
            bg.layer.mask = nil;
        }
    }

    CGFloat totalHeight = spacing + tabTitles.count * (itemHeight + spacing);
    sidebarView.frame = CGRectMake(0, 0, 113, totalHeight);
    self.sidebarScroll.contentSize = CGSizeMake(113, totalHeight);
}

- (void)didTapTab:(UIButton *)sender {
    NSInteger selectedIndex = sender.tag;
    if (selectedIndex == currentTab) return;

    UIView *prevTabItem = [sidebarView viewWithTag:1000 + currentTab];
    UIView *newTabItem  = [sidebarView viewWithTag:1000 + selectedIndex];

    if (prevTabItem) {
        UIView *bg = [prevTabItem viewWithTag:2000];
        UIImageView *icon = [bg viewWithTag:3000];
        UILabel *label = [bg viewWithTag:4000];

        UIView *bar = nil;
        for (UIView *sub in bg.subviews) {
            if (sub.frame.size.width == 4) {
                bar = sub;
                break;
            }
        }

        [UIView animateWithDuration:0.3 animations:^{
            bg.backgroundColor = UIColor.clearColor;
            icon.transform = CGAffineTransformIdentity;
            icon.alpha = 0.6;
            label.alpha = 0.6;
            label.transform = CGAffineTransformIdentity;
            bar.alpha = 0.0;
        } completion:^(BOOL finished) {
            [bar removeFromSuperview];
        }];
    }

    if (newTabItem) {
        UIView *bg = [newTabItem viewWithTag:2000];
        UIImageView *icon = [bg viewWithTag:3000];
        UILabel *label = [bg viewWithTag:4000];

        bg.backgroundColor = [UIColor clearColor]; // Inicializa sem cor
        bg.layer.mask = nil;
dispatch_async(dispatch_get_main_queue(), ^{
    applyDiagonalMaskToView(bg, 10);
});
        icon.transform = CGAffineTransformMakeScale(0.95, 0.95);
        icon.alpha = 0.0;
        label.alpha = 0.0;
        label.transform = CGAffineTransformMakeScale(0.95, 0.95);

        UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(bg.frame.size.width, 0, 4, bg.frame.size.height)];
        bar.backgroundColor = self.panelAccentColor;
        bar.alpha = 0.0;
        [bg addSubview:bar];

        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            bg.backgroundColor = [UIColor colorWithRed:6/255.0 green:9/255.0 blue:14/255.0 alpha:1.0];
        } completion:nil];

        [UIView animateWithDuration:0.35 delay:0.05 options:UIViewAnimationOptionCurveEaseOut animations:^{
            icon.transform = CGAffineTransformIdentity;
            icon.alpha = 1.0;
            label.transform = CGAffineTransformIdentity;
            label.alpha = 1.0;
        } completion:nil];

        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            bar.frame = CGRectMake(bg.frame.size.width - 4, 0, 4, bg.frame.size.height);
            bar.alpha = 1.0;
        } completion:nil];

        icon.tintColor = UIColor.whiteColor;
        label.textColor = UIColor.whiteColor;
    }

    currentTab = (MenuTab)selectedIndex;
    [self updateContentView];
}

- (void)_handleTapGesture:(UIGestureRecognizer *)gesture {
    void (^block)(void) = objc_getAssociatedObject(gesture, "headerCallback");
    if (block) block();
}

__attribute__((always_inline)) void applyDiagonalMaskToView(UIView *view, CGFloat cutSize) {
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat w = view.bounds.size.width;
        CGFloat h = view.bounds.size.height;
        CGFloat cut = cutSize;

        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(cut, 0)];
        [path addLineToPoint:CGPointMake(w, 0)];
        [path addLineToPoint:CGPointMake(w, h - cut)];
        [path addLineToPoint:CGPointMake(w - cut, h)];
        [path addLineToPoint:CGPointMake(0, h)];
        [path addLineToPoint:CGPointMake(0, cut)];
        [path closePath];

        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.path = path.CGPath;
        view.layer.mask = mask;
    });
}

- (void)updateContentView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UITapGestureRecognizer class];
        SEL sel = NSSelectorFromString(@"addTargetBlock:");

        if (![cls instancesRespondToSelector:sel]) {
            IMP imp = imp_implementationWithBlock(^(id _self, void (^block)(UIGestureRecognizer *)) {
                objc_setAssociatedObject(_self, "block", block, OBJC_ASSOCIATION_COPY_NONATOMIC);
                [_self addTarget:_self action:@selector(_handleBlock:)];
            });

            class_addMethod(cls, sel, imp, "v@:@");

            class_addMethod(cls, @selector(_handleBlock:), (IMP)(void *)^(id _self, UIGestureRecognizer *gesture) {
                void (^block)(UIGestureRecognizer *) = objc_getAssociatedObject(_self, "block");
                if (block) block(gesture);
            }, "v@:@");
        }
    });

    if (aimbotView) aimbotView.hidden = YES;
    if (visualsView) visualsView.hidden = YES;
    if (weaponView) weaponView.hidden = YES;
    if (miscView) miscView.hidden = YES;
    if (settingsView) settingsView.hidden = YES;
    if (accountView) accountView.hidden = YES;
    if (versionView) versionView.hidden = YES;

    for (UIView *sub in contentView.subviews) {
        if (sub.tag == 9999) {
            [sub removeFromSuperview];
        }
    }

    CGFloat paddingSide = 14;
    CGFloat paddingTop = 14;
    CGFloat headerHeight = 40;

    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(paddingSide, paddingTop, contentView.bounds.size.width - paddingSide * 2, headerHeight)];
    header.tag = 9999;
    header.backgroundColor = [UIColor colorWithRed:6/255.0 green:9/255.0 blue:14/255.0 alpha:1.0];
    header.clipsToBounds = YES;
    applyDiagonalMaskToView(header, 10);
    [contentView addSubview:header];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    pan.delaysTouchesBegan = NO;
    pan.cancelsTouchesInView = NO;
    [header addGestureRecognizer:pan];

UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];


objc_setAssociatedObject(tap, "headerCallback", ^{
    __ZZeTgkAiCj();
}, OBJC_ASSOCIATION_COPY_NONATOMIC);


[tap addTarget:self action:@selector(_handleTapGesture:)];

[header addGestureRecognizer:tap];

    header.userInteractionEnabled = YES;


NSArray *icons = @[iconAimbot, iconEye, iconWeapon, iconMisc, iconSettings, iconAccount, iconVersion];
NSArray *titles = @[
    LocalizedStringObjC(ENCRYPT_NS("AIMBOT")),
    LocalizedStringObjC(ENCRYPT_NS("VISUALS")),
    LocalizedStringObjC(ENCRYPT_NS("WEAPON")),
    LocalizedStringObjC(ENCRYPT_NS("MISC")),
    LocalizedStringObjC(ENCRYPT_NS("SETTINGS")),
    LocalizedStringObjC(ENCRYPT_NS("ACCOUNT")),
    LocalizedStringObjC(ENCRYPT_NS("VERSION"))
];


NSArray *descs = @[
    LocalizedStringObjC(ENCRYPT_NS("Automatically target enemies.")),
    LocalizedStringObjC(ENCRYPT_NS("See where the enemies are.")),
    LocalizedStringObjC(ENCRYPT_NS("Weapon features and behavior.")),
    LocalizedStringObjC(ENCRYPT_NS("Extra features for gameplay.")),
    LocalizedStringObjC(ENCRYPT_NS("Configure interface preferences.")),
    LocalizedStringObjC(ENCRYPT_NS("Information about your account.")),
    LocalizedStringObjC(ENCRYPT_NS("Build and release information."))
];

    UIImage *iconImage = [icons[currentTab] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:iconImage];
    iconView.tintColor = self.panelAccentColor;
    iconView.frame = CGRectMake(12, (headerHeight - 18) / 2, 18, 18);
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [header addSubview:iconView];

    UILabel *title = [[UILabel alloc] init];
    title.font = fontSemiBold;
    title.textColor = self.panelAccentColor;
    title.text = titles[currentTab];
    [title sizeToFit];
    CGFloat titleX = CGRectGetMaxX(iconView.frame) + 6;
    title.frame = CGRectMake(titleX, 0, title.frame.size.width, headerHeight);
    [header addSubview:title];

    CGFloat dividerX = CGRectGetMaxX(title.frame) + 8;
    UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(dividerX, 12, 1, headerHeight - 24)];
    divider.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [header addSubview:divider];

    CGFloat descX = CGRectGetMaxX(divider.frame) + 8;
    CGFloat descContainerX = dividerX;
    CGFloat descContainerWidth = header.frame.size.width - descContainerX - 10;

    UIView *descContainer = [[UIView alloc] initWithFrame:CGRectMake(descContainerX, 0, descContainerWidth, headerHeight)];
    descContainer.clipsToBounds = YES;
    [header addSubview:descContainer];

    UILabel *desc = [[UILabel alloc] init];
    desc.font = fontRegular;
    desc.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    desc.textAlignment = NSTextAlignmentLeft;
    desc.text = descs[currentTab];

    CGFloat leftPadding = descX - descContainerX;
    [descContainer addSubview:desc];

    CGSize textSize = [desc sizeThatFits:CGSizeMake(CGFLOAT_MAX, headerHeight)];
    BOOL isTextTooLong = textSize.width > descContainerWidth;

    if (isTextTooLong) {
        CGFloat textWidth = textSize.width + leftPadding;
        CGFloat scrollDistance = textWidth - descContainerWidth;
        desc.frame = CGRectMake(leftPadding, 0, textWidth, headerHeight);
        desc.lineBreakMode = NSLineBreakByClipping;
        desc.numberOfLines = 1;

        CAKeyframeAnimation *scrollAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        scrollAnim.values = @[@0, @0, @(-scrollDistance), @(-scrollDistance), @0];
        scrollAnim.keyTimes = @[@0.0, @0.1, @0.5, @0.9, @1.0];
        scrollAnim.duration = 10.0;
        scrollAnim.repeatCount = HUGE_VALF;
        scrollAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [desc.layer addAnimation:scrollAnim forKey:@"scrollDesc"];
    } else {
        desc.frame = CGRectMake(leftPadding, 0, descContainerWidth - leftPadding, headerHeight);
    }

    CGFloat startY = CGRectGetMaxY(header.frame) + 14;
    CGRect contentFrame = CGRectMake(0, startY, contentView.bounds.size.width, contentView.bounds.size.height - startY);

    switch (currentTab) {
            case MenuTabAimbot:
            if (!aimbotView) {
                aimbotView = [[UIView alloc] initWithFrame:contentFrame];
                aimbotView.backgroundColor = UIColor.clearColor;
                [self buildAimbotViewInto:aimbotView startY:0];
                [contentView addSubview:aimbotView];
            }
            aimbotView.hidden = NO;
            break;
        case MenuTabVisuals:
            if (!visualsView) {
                visualsView = [[UIView alloc] initWithFrame:contentFrame];
                visualsView.backgroundColor = UIColor.clearColor;
                [self buildVisualsViewInto:visualsView startY:0];
                [contentView addSubview:visualsView];
            }
            visualsView.hidden = NO;
            break;
            case MenuTabWeapon:
            if (!weaponView) {
                weaponView = [[UIView alloc] initWithFrame:contentFrame];
                weaponView.backgroundColor = UIColor.clearColor;
                [self buildWeaponViewInto:weaponView startY:0];
                [contentView addSubview:weaponView];
            }
            weaponView.hidden = NO;
            break;
        case MenuTabMisc:
            if (!miscView) {
                miscView = [[UIView alloc] initWithFrame:contentFrame];
                miscView.backgroundColor = UIColor.clearColor;
                [self buildMiscViewInto:miscView startY:0];
                [contentView addSubview:miscView];
            }
            miscView.hidden = NO;
            break;
        case MenuTabSettings:
            if (!settingsView) {
                settingsView = [[UIView alloc] initWithFrame:contentFrame];
                settingsView.backgroundColor = UIColor.clearColor;
                [self buildSettingsViewInto:settingsView startY:0];
                [contentView addSubview:settingsView];
            }
            settingsView.hidden = NO;
            break;
        case MenuTabAccount:
            if (!accountView) {
                accountView = [[UIView alloc] initWithFrame:contentFrame];
                accountView.backgroundColor = UIColor.clearColor;
                [self buildAccountViewInto:accountView startY:0];
                [contentView addSubview:accountView];
            }
            accountView.hidden = NO;
            break;
        case MenuTabVersion:
            if (!versionView) {
                versionView = [[UIView alloc] initWithFrame:contentFrame];
                versionView.backgroundColor = UIColor.clearColor;
                [self buildVersionViewInto:versionView startY:0];
                [contentView addSubview:versionView];
            }
            versionView.hidden = NO;
            break;
    }
}

- (void)handleWarningPress:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIView *icon = gesture.view;


        UILabel *tooltipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tooltipLabel.backgroundColor = [UIColor colorWithRed:1.0 green:0.65 blue:0.1 alpha:1.0];
        tooltipLabel.textColor = UIColor.blackColor;
        tooltipLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold];
        tooltipLabel.textAlignment = NSTextAlignmentCenter;
        tooltipLabel.layer.masksToBounds = YES;
        tooltipLabel.numberOfLines = 0;
        tooltipLabel.text = LocalizedStringObjC(ENCRYPT_NS("Use with caution")); 
        tooltipLabel.alpha = 0.0;
        tooltipLabel.tag = 99999;
        applyDiagonalMaskToView(tooltipLabel, 6);


        UIWindow *mainWindow = icon.window;
        if (!mainWindow) return;
        [mainWindow addSubview:tooltipLabel];


        CGRect iconFrameInWindow = [icon convertRect:icon.bounds toView:mainWindow];
        CGSize textSize = [tooltipLabel sizeThatFits:CGSizeMake(200, CGFLOAT_MAX)];
        CGFloat tooltipWidth = textSize.width + 12;
        CGFloat tooltipHeight = textSize.height + 6;

        tooltipLabel.frame = CGRectMake(
            CGRectGetMidX(iconFrameInWindow) - tooltipWidth / 2,
            CGRectGetMinY(iconFrameInWindow) - tooltipHeight - 4,
            tooltipWidth,
            tooltipHeight
        );

        [UIView animateWithDuration:0.15 animations:^{
            tooltipLabel.alpha = 1.0;
        }];
    } else if (gesture.state == UIGestureRecognizerStateEnded ||
               gesture.state == UIGestureRecognizerStateCancelled ||
               gesture.state == UIGestureRecognizerStateFailed) {
        UIView *icon = gesture.view;
        UIWindow *mainWindow = icon.window;
        if (!mainWindow) return;

        UIView *tooltipLabel = [mainWindow viewWithTag:99999];
        if (tooltipLabel) {
            [UIView animateWithDuration:0.15 animations:^{
                tooltipLabel.alpha = 0.0;
            } completion:^(BOOL finished) {
                [tooltipLabel removeFromSuperview];
            }];
        }
    }
}

- (void)addCheckboxTo:(UIView *)parent
                 atY:(CGFloat *)currentY
            withText:(NSString *)text
          enabledRef:(BOOL *)enabledRef
           isWarning:(BOOL)isWarning {

    static Class PassThroughButtonClass = nil;
    if (!PassThroughButtonClass) {
        PassThroughButtonClass = objc_allocateClassPair([UIButton class], "PassThroughCheckboxButton", 0);

        class_addMethod(PassThroughButtonClass, sel_registerName("setExcludeView:"), imp_implementationWithBlock(^(id _self, UIView *view) {
            objc_setAssociatedObject(_self, "excludeView", view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }), "v@:@");

        class_addMethod(PassThroughButtonClass, sel_registerName("excludeView"), imp_implementationWithBlock(^UIView *(id _self) {
            return objc_getAssociatedObject(_self, "excludeView");
        }), "@@:");

        class_addMethod(PassThroughButtonClass, sel_registerName("hitTest:withEvent:"), imp_implementationWithBlock(^UIView *(id _self, CGPoint point, UIEvent *event) {
            UIView *exclude = ((UIView *(*)(id, SEL))objc_msgSend)(_self, sel_registerName("excludeView"));
            if (exclude) {
                CGPoint converted = [exclude convertPoint:point fromView:(UIView *)_self];
                if ([exclude pointInside:converted withEvent:event]) return nil;
            }
            struct objc_super superInfo = {
                .receiver = _self,
                .super_class = class_getSuperclass(PassThroughButtonClass)
            };
            return ((UIView *(*)(struct objc_super *, SEL, CGPoint, UIEvent *))objc_msgSendSuper)(&superInfo, sel_registerName("hitTest:withEvent:"), point, event);
        }), "@@:{CGPoint=@}@");

        objc_registerClassPair(PassThroughButtonClass);
    }

    CGFloat paddingX = 14;
    CGFloat rowHeight = 30;
    CGFloat checkboxSize = 22;
    CGFloat spacing = 12;

    UIView *row = [[UIView alloc] initWithFrame:CGRectMake(paddingX, *currentY, parent.bounds.size.width - paddingX * 2, rowHeight)];
    [parent addSubview:row];

    CGFloat startX = 0;
    UIImageView *warningIcon = nil;

    if (isWarning && iconWarning) {
        warningIcon = [[UIImageView alloc] initWithImage:[iconWarning imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        warningIcon.tintColor = [UIColor colorWithRed:1.0 green:0.65 blue:0.1 alpha:1.0];
        warningIcon.frame = CGRectMake(0, (rowHeight - 18) / 2, 18, 18);
        warningIcon.contentMode = UIViewContentModeScaleAspectFit;
        warningIcon.userInteractionEnabled = YES;
        [row addSubview:warningIcon];
        startX = CGRectGetMaxX(warningIcon.frame) + 8;

        UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWarningPress:)];
        lp.minimumPressDuration = 0.2;
        [warningIcon addGestureRecognizer:lp];
    }

    UIView *box = [[UIView alloc] initWithFrame:CGRectMake(startX, (rowHeight - checkboxSize) / 2, checkboxSize, checkboxSize)];
    box.backgroundColor = *enabledRef
        ? self.panelAccentColor
        : [UIColor colorWithRed:25/255.0 green:32/255.0 blue:40/255.0 alpha:1.0];
    box.clipsToBounds = YES;
    box.tag = 8000;
    applyDiagonalMaskToView(box, 4);
    [row addSubview:box];

    UIImageView *check = [[UIImageView alloc] initWithImage:[iconCheck imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    check.frame = CGRectMake(4, 4, checkboxSize - 8, checkboxSize - 8);
    check.contentMode = UIViewContentModeScaleAspectFit;
    check.tintColor = [UIColor whiteColor];
    check.hidden = !(*enabledRef);
    check.alpha = *enabledRef ? 1.0 : 0.0;
    check.tag = 999;
    [box addSubview:check];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(box.frame) + spacing, 0,
                                                               row.frame.size.width - CGRectGetMaxX(box.frame) - spacing,
                                                               rowHeight)];
    label.text = text;
    label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7];
    label.font = fontRegular;
    [row addSubview:label];

    UIButton *btn = [[PassThroughButtonClass alloc] initWithFrame:box.frame];
    btn.backgroundColor = [UIColor clearColor];
    if (warningIcon) {
        ((void (*)(id, SEL, id))objc_msgSend)(btn, sel_registerName("setExcludeView:"), warningIcon);
    }

[btn addAction:[UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
    BOOL newValue = !(*enabledRef);

    if (enabledRef == &StreamerMode) {
        SetStreamerMode(newValue);
    } else {
        *enabledRef = newValue;
    }

    UIColor *endColor = newValue
        ? self.panelAccentColor
        : [UIColor colorWithRed:25/255.0 green:32/255.0 blue:40/255.0 alpha:1.0];

    [UIView animateWithDuration:0.25 animations:^{
        box.backgroundColor = endColor;
    }];

    if (newValue) {
        check.hidden = NO;
        check.alpha = 0.0;
        [UIView animateWithDuration:0.25 animations:^{
            check.alpha = 1.0;
        }];
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            check.alpha = 0.0;
        } completion:^(BOOL finished) {
            check.hidden = YES;
        }];
    }

}] forControlEvents:UIControlEventTouchUpInside];
    [row addSubview:btn];
    *currentY += rowHeight + 1;
}

- (void)addActionButtonTo:(UIView *)parent
                      atY:(CGFloat *)currentY
                 withIcon:(UIImage *)icon
                 iconTint:(UIColor *)iconTint
                     text:(NSString *)text
              actionBlock:(void (^)(void))action {

    CGFloat padding = 14;
    CGFloat height = 34;
    CGFloat width = parent.bounds.size.width - padding * 2;

    UIView *button = [[UIView alloc] initWithFrame:CGRectMake(padding, *currentY, width, height)];
    button.backgroundColor = [UIColor colorWithRed:25/255.0 green:32/255.0 blue:40/255.0 alpha:1.0];
    button.clipsToBounds = YES;
    [parent addSubview:button];

    applyDiagonalMaskToView(button, 6); // Aplica corte diagonal após adicionar

    CGFloat iconSize = 18;
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    iconView.tintColor = iconTint ?: self.panelAccentColor; // Usa cor dinâmica
    iconView.frame = CGRectMake(12, (height - iconSize) / 2, iconSize, iconSize);
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [button addSubview:iconView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12 + iconSize + 8, 0, width - (12 + iconSize + 8 + 32), height)];
    label.text = text;
    label.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    label.font = fontRegular;
    [button addSubview:label];

    UIButton *tapBtn = [[UIButton alloc] initWithFrame:button.bounds];
    tapBtn.backgroundColor = UIColor.clearColor;

    [tapBtn addAction:[UIAction actionWithHandler:^(__kindof UIAction * _Nonnull _) {

        // Animação de toque
        [UIView animateWithDuration:0.15 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:0 animations:^{
            button.transform = CGAffineTransformMakeScale(0.94, 0.94);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:0 animations:^{
                button.transform = CGAffineTransformIdentity;
            } completion:nil];
        }];

        // Executa ação
        if (action) action();

        // Badge de sucesso (check)
        CGFloat badgeSize = 20;
        UIView *successBadge = [[UIView alloc] initWithFrame:CGRectMake(button.bounds.size.width - badgeSize - 10,
                                                                         (height - badgeSize) / 2,
                                                                         badgeSize, badgeSize)];
        successBadge.backgroundColor = [UIColor colorWithRed:0.2 green:0.7 blue:0.3 alpha:1.0];
        successBadge.layer.cornerRadius = badgeSize / 2;
        successBadge.clipsToBounds = YES;
        successBadge.alpha = 0.0;
        successBadge.transform = CGAffineTransformMakeScale(0.6, 0.6);

        UIImageView *checkIcon = [[UIImageView alloc] initWithImage:[iconCheck imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        checkIcon.tintColor = UIColor.whiteColor;
        checkIcon.frame = CGRectMake(3, 3, badgeSize - 6, badgeSize - 6);
        checkIcon.contentMode = UIViewContentModeScaleAspectFit;
        [successBadge addSubview:checkIcon];

        [button addSubview:successBadge];

        [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:0 animations:^{
            successBadge.alpha = 1.0;
            successBadge.transform = CGAffineTransformIdentity;
        } completion:nil];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.25 animations:^{
                successBadge.alpha = 0.0;
                successBadge.transform = CGAffineTransformMakeScale(0.8, 0.8);
            } completion:^(BOOL finished) {
                [successBadge removeFromSuperview];
            }];
        });

    }] forControlEvents:UIControlEventTouchUpInside];

    [button addSubview:tapBtn];

    *currentY += height + 6;
}

- (void)addSliderTo:(UIView *)parent
               atY:(CGFloat *)currentY
          withText:(NSString *)text
         valueRef:(float *)valueRef
               min:(float)min
               max:(float)max
          onChange:(void (^)(float newValue))onChange {

    CGFloat contentX = 14;
    CGFloat sliderWidth = parent.bounds.size.width - contentX * 2;
    CGFloat sliderHeight = 36;
    CGFloat thumbRadius = 9.0;
    CGFloat trackOffset = 4.0;

    UILabel *sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(contentX, *currentY, sliderWidth, 20)];
    NSString *labelText = [NSString stringWithFormat:@"%@ %.1f×", text, *valueRef];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSRange range = [labelText rangeOfString:[NSString stringWithFormat:@"%.1f×", *valueRef]];
    if (range.location != NSNotFound) {
        [attr addAttribute:NSForegroundColorAttributeName
                     value:self.panelAccentColor
                     range:range];
    }
    sliderLabel.attributedText = attr;
    sliderLabel.font = fontRegular;
    sliderLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0]; // cor fixa
    [parent addSubview:sliderLabel];
    *currentY += 10 + 5;

    UIView *sliderContainer = [[UIView alloc] initWithFrame:CGRectMake(contentX, *currentY, sliderWidth, sliderHeight)];
    sliderContainer.backgroundColor = UIColor.clearColor;
    [parent addSubview:sliderContainer];

    UIView *track = [[UIView alloc] initWithFrame:CGRectMake(thumbRadius - trackOffset, sliderHeight / 2 - 1.5, sliderWidth - thumbRadius * 2 + trackOffset * 2, 3)];
    track.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1.0]; // cor fixa
    track.layer.cornerRadius = 1.5;
    [sliderContainer addSubview:track];

    UIView *fill = [[UIView alloc] initWithFrame:CGRectMake(track.frame.origin.x, track.frame.origin.y, 0, 3)];
    fill.backgroundColor = self.panelAccentColor;
    fill.layer.cornerRadius = 1.5;
    [sliderContainer addSubview:fill];

    UIView *thumb = [[UIView alloc] initWithFrame:CGRectMake(0, 0, thumbRadius * 2, thumbRadius * 2)];
    thumb.backgroundColor = UIColor.clearColor;
    thumb.layer.cornerRadius = thumbRadius;
    thumb.layer.borderColor = self.panelAccentColor.CGColor;
    thumb.layer.borderWidth = 6.0;
    thumb.tag = 7001;
    [sliderContainer addSubview:thumb];

    float initialPercent = (*valueRef - min) / (max - min);
    CGFloat initialX = track.frame.origin.x + initialPercent * track.frame.size.width;
    thumb.center = CGPointMake(initialX, sliderHeight / 2);

    void (^updateSlider)(float, BOOL) = ^(float value, BOOL animated) {
        float percent = (value - min) / (max - min);
        CGFloat x = track.frame.origin.x + percent * track.frame.size.width;

        void (^applyChanges)(void) = ^{
            thumb.center = CGPointMake(x, sliderHeight / 2);
            CGFloat fillWidth = x - track.frame.origin.x - thumb.layer.borderWidth;
            if (fillWidth < 0) fillWidth = 0;
            fill.frame = CGRectMake(track.frame.origin.x, track.frame.origin.y, fillWidth, 3);
        };

        if (animated) {
            [UIView animateWithDuration:0.25 animations:applyChanges];
        } else {
            applyChanges();
        }

        NSString *newLabel = [NSString stringWithFormat:@"%@ %.1f×", text, value];
        NSMutableAttributedString *newAttr = [[NSMutableAttributedString alloc] initWithString:newLabel];
        NSRange r = [newLabel rangeOfString:[NSString stringWithFormat:@"%.1f×", value]];
        if (r.location != NSNotFound) {
            [newAttr addAttribute:NSForegroundColorAttributeName
                            value:self.panelAccentColor
                            range:r];
        }
        sliderLabel.attributedText = newAttr;
        sliderLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    };

    updateSlider(*valueRef, NO);

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    pan.cancelsTouchesInView = NO;
    [thumb addGestureRecognizer:pan];

    SEL sel_addBlock = sel_registerName("addTargetBlock:");
    SEL sel_handle = sel_registerName("_handleBlock:");

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        IMP imp_addBlock = imp_implementationWithBlock(^void(id self, void (^block)(UIGestureRecognizer *)) {
            objc_setAssociatedObject(self, "block", block, OBJC_ASSOCIATION_COPY_NONATOMIC);
            ((void (*)(id, SEL, id, SEL))objc_msgSend)(self, sel_registerName("addTarget:action:"), self, sel_handle);
        });

        IMP imp_handle = imp_implementationWithBlock(^void(id self, UIGestureRecognizer *gesture) {
            void (^block)(UIGestureRecognizer *) = objc_getAssociatedObject(self, "block");
            if (block) block(gesture);
        });

        class_addMethod([UIGestureRecognizer class], sel_addBlock, imp_addBlock, "v@:@");
        class_addMethod([UIGestureRecognizer class], sel_handle, imp_handle, "v@:@");
    });

    ((void (*)(id, SEL, id))objc_msgSend)(pan, sel_addBlock, ^(UIGestureRecognizer *gesture) {
        CGPoint location = [gesture locationInView:sliderContainer];
        float percent = (location.x - track.frame.origin.x) / track.frame.size.width;
        percent = fminf(fmaxf(percent, 0.0), 1.0);
        float newValue = roundf((min + percent * (max - min)) * 10.0f) / 10.0f;
        *valueRef = newValue;
        updateSlider(newValue, YES);
        if (onChange) onChange(newValue);
    });

    *currentY += sliderHeight + 3;
}

- (void)addComboBoxTo:(UIView *)parent
                 atY:(CGFloat *)currentY
           withTitle:(NSString *)title
             options:(NSArray<NSString *> *)options
       selectedIndex:(int *)selectedIndex
          hasWarning:(NSArray<NSNumber *> *)warnings
              action:(void (^)(int newIndex))onSelect {

    CGFloat padding = 14, rowHeight = 34, cornerRadius = 8, spacing = 5, titleHeight = 20;
    CGFloat width = parent.bounds.size.width - padding * 2;

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, *currentY, width, titleHeight)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    titleLabel.font = fontRegular;
    [parent addSubview:titleLabel];
    *currentY += titleHeight + spacing;

    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(padding, *currentY, width, rowHeight)];
    container.backgroundColor = [UIColor colorWithRed:25/255.0 green:32/255.0 blue:40/255.0 alpha:1.0];
    container.clipsToBounds = YES;
    applyDiagonalMaskToView(container, 6);
    [parent addSubview:container];

    BOOL hasWarn = [warnings[*selectedIndex] boolValue];
    CGFloat iconSize = 18;
    CGFloat iconPadding = 10;
    CGFloat labelStartX = hasWarn ? (iconPadding + iconSize + 6) : 10;

    UIImageView *warnIcon = nil;
    if (hasWarn) {
        UIImage *iconImage = [iconWarning imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        warnIcon = [[UIImageView alloc] initWithImage:iconImage];
        warnIcon.tintColor = [UIColor colorWithRed:1.0 green:0.65 blue:0.1 alpha:1.0];
        warnIcon.frame = CGRectMake(iconPadding, (rowHeight - iconSize) / 2, iconSize, iconSize);
        warnIcon.tag = 9002;
        warnIcon.userInteractionEnabled = YES;
        [container addSubview:warnIcon];

        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWarningPress:)];
        [warnIcon addGestureRecognizer:longPress];
    }

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelStartX, 0, width - labelStartX - 36, rowHeight)];
    label.text = options[*selectedIndex];
    label.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    label.font = fontRegular;
    label.tag = 9001;
    label.userInteractionEnabled = NO;
    [container addSubview:label];

    UIImageView *arrowIcon = [[UIImageView alloc] initWithImage:[arrowDown imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    arrowIcon.tintColor = self.panelAccentColor;
    arrowIcon.frame = CGRectMake(width - 24, (rowHeight - 18) / 2, 18, 18);
    arrowIcon.contentMode = UIViewContentModeScaleAspectFit;
    arrowIcon.tag = 9003;
    arrowIcon.userInteractionEnabled = NO;
    [container addSubview:arrowIcon];

    _a9DkPq7LsTv0 *overlay = [[_a9DkPq7LsTv0 alloc] initWithFrame:self.view.bounds];
    overlay.backgroundColor = UIColor.clearColor;
    overlay.userInteractionEnabled = YES;
    overlay.layer.zPosition = 15000;
    overlay.hidden = YES;
    overlay.tag = 100000;
    [self.view addSubview:overlay];

    UIView *header = [contentView viewWithTag:9999];
    overlay._xR3mZ28JqU1o = @[header, container];

    CGFloat dropdownHeight = options.count * rowHeight;
    CGFloat maxVisibleHeight = 4 * rowHeight;
    __block BOOL dropdownShouldOpenUp = NO;

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    scrollView.backgroundColor = [UIColor colorWithRed:25/255.0 green:32/255.0 blue:40/255.0 alpha:1.0];
    scrollView.scrollEnabled = YES;
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.contentSize = CGSizeMake(width, dropdownHeight);
    scrollView.clipsToBounds = NO;

    NSMutableArray<UIButton *> *itemButtons = [NSMutableArray array];

    for (int i = 0; i < options.count; i++) {
        UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(0, i * rowHeight, width, rowHeight)];
        [item setTitle:options[i] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0] forState:UIControlStateNormal];
        item.titleLabel.font = fontRegular;
        item.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        item.titleEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
        item.backgroundColor = [UIColor clearColor];

        if ([warnings[i] boolValue]) {
            UIImageView *wIcon = [[UIImageView alloc] initWithImage:[iconWarning imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
            wIcon.tintColor = [UIColor colorWithRed:1.0 green:0.65 blue:0.1 alpha:1.0];
            wIcon.frame = CGRectMake(10, (rowHeight - 18) / 2, 18, 18);
            wIcon.contentMode = UIViewContentModeScaleAspectFit;
            [item addSubview:wIcon];

            item.titleEdgeInsets = UIEdgeInsetsMake(0, 10 + 18 + 6, 0, 0);

            UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWarningPress:)];
            [wIcon addGestureRecognizer:press];
            wIcon.userInteractionEnabled = YES;
        }

        [item addTarget:self action:@selector(_comboItemTouchDown:) forControlEvents:UIControlEventTouchDown];
        [item addTarget:self action:@selector(_comboItemTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [item addTarget:self action:@selector(_comboItemTouchUp:) forControlEvents:UIControlEventTouchUpOutside];

        [scrollView addSubview:item];
        [itemButtons addObject:item];

        if (i < options.count - 1) {
            UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(12, (i + 1) * rowHeight - 0.5, width - 24, 0.5)];
            divider.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:0.6];
            [scrollView addSubview:divider];
        }
    }

    UIView *scrollContainer = [[UIView alloc] initWithFrame:CGRectZero];
    scrollContainer.clipsToBounds = YES;
    scrollContainer.backgroundColor = scrollView.backgroundColor;
    scrollContainer.alpha = 0.0;
    [scrollContainer addSubview:scrollView];
    [overlay addSubview:scrollContainer];

    __weak UIView *weakScrollContainer = scrollContainer;

    for (int i = 0; i < itemButtons.count; i++) {
        UIButton *item = itemButtons[i];
        [item addAction:[UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
            *selectedIndex = i;
            label.text = options[i];
BOOL hasNewWarn = [warnings[i] boolValue];

// Remove ícone antigo se necessário
UIImageView *existingWarn = [container viewWithTag:9002];
if (existingWarn) {
    [existingWarn removeFromSuperview];
}

// Recria se necessário
if (hasNewWarn) {
    UIImage *iconImage = [iconWarning imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *newWarn = [[UIImageView alloc] initWithImage:iconImage];
    newWarn.tintColor = [UIColor colorWithRed:1.0 green:0.65 blue:0.1 alpha:1.0];
    newWarn.frame = CGRectMake(10, (rowHeight - 18) / 2, 18, 18);
    newWarn.tag = 9002;
    newWarn.userInteractionEnabled = YES;
    [container addSubview:newWarn];

    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWarningPress:)];
    [newWarn addGestureRecognizer:press];
}

// Ajusta a posição do label
CGFloat labelStartX = hasNewWarn ? (10 + 18 + 6) : 10;
label.frame = CGRectMake(labelStartX, 0, width - labelStartX - 36, rowHeight);

            if (onSelect) onSelect(i);

            [UIView animateWithDuration:0.25 animations:^{
                weakScrollContainer.alpha = 0.0;
                arrowIcon.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                overlay.hidden = YES;
            }];
        }] forControlEvents:UIControlEventTouchUpInside];
    }

    UITapGestureRecognizer *closeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeOpenComboFromTap:)];
    closeTap.delegate = self;
    [overlay addGestureRecognizer:closeTap];
    overlay.accessibilityElements = @[container, scrollContainer];

    __block BOOL isAnimatingDropdown = NO;

    UIButton *tapBtn = [[UIButton alloc] initWithFrame:container.bounds];
    tapBtn.backgroundColor = UIColor.clearColor;

    [tapBtn addAction:[UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        if (isAnimatingDropdown) return;

        BOOL isOpen = scrollContainer.alpha > 0.1;
        if (isOpen) {
            isAnimatingDropdown = YES;
            [UIView animateWithDuration:0.25 animations:^{
                scrollContainer.alpha = 0.0;
                arrowIcon.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                overlay.hidden = YES;
                isAnimatingDropdown = NO;
            }];
        } else {
            for (UIView *v in self.view.subviews) {
                if (v.tag == 100000 && v != overlay) v.hidden = YES;
            }

            CGRect containerInWindow = [container convertRect:container.bounds toView:nil];
            CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
            dropdownShouldOpenUp = CGRectGetMaxY(containerInWindow) + rowHeight + spacing + MIN(dropdownHeight, maxVisibleHeight) > screenHeight;

            CGFloat dropdownY = dropdownShouldOpenUp
                ? containerInWindow.origin.y - MIN(dropdownHeight, maxVisibleHeight) - spacing
                : containerInWindow.origin.y + rowHeight + spacing;

            CGFloat visibleHeight = MIN(dropdownHeight, maxVisibleHeight);
            scrollContainer.frame = CGRectMake(containerInWindow.origin.x, dropdownY, width, visibleHeight);
            scrollView.frame = CGRectMake(0, 0, width, visibleHeight);
            overlay.hidden = NO;
            scrollContainer.userInteractionEnabled = NO;
            isAnimatingDropdown = YES;

            [UIView animateWithDuration:0.25 animations:^{
                scrollContainer.alpha = 1.0;
                arrowIcon.transform = CGAffineTransformMakeRotation(M_PI);
                applyDiagonalMaskToView(scrollContainer, 6);
            } completion:^(BOOL finished) {
                scrollContainer.userInteractionEnabled = YES;
                isAnimatingDropdown = NO;
            }];
        }
    }] forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:tapBtn];

    *currentY += rowHeight + 1;
}

void CloseActiveComboBoxIfAny(UIView *rootView) {
    for (UIView *sub in rootView.subviews) {
        if (sub.tag == 100000) {
            [sub removeFromSuperview];
        }
    }
}

- (void)_comboItemTouchDown:(UIButton *)btn {
    UIView *highlight = [btn viewWithTag:888];
    if (highlight) highlight.hidden = NO;
}

- (void)_comboItemTouchUp:(UIButton *)btn {
    UIView *highlight = [btn viewWithTag:888];
    if (highlight) highlight.hidden = YES;
}

- (void)closeOpenComboFromTap:(UITapGestureRecognizer *)tap {
    UIView *overlay = tap.view;
    NSArray *refs = overlay.accessibilityElements;
    if (refs.count < 2) return;

    UIView *comboContainer = refs[0];
    UIView *scrollContainer = refs[1];
    
    CGPoint location = [tap locationInView:self.view];

    if (![comboContainer pointInside:[self.view convertPoint:location toView:comboContainer] withEvent:nil] &&
        ![scrollContainer pointInside:[self.view convertPoint:location toView:scrollContainer] withEvent:nil]) {

        [UIView animateWithDuration:0.25 animations:^{
            scrollContainer.alpha = 0.0;
            scrollContainer.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            overlay.hidden = YES;
        }];

        UIImageView *arrow = [comboContainer viewWithTag:9003];
        if (arrow) arrow.transform = CGAffineTransformIdentity;
    }
}

- (UIColor *)getPanelAccentColor {
    return self.panelAccentColor;
}

- (void)buildAimbotViewInto:(UIView *)parent startY:(CGFloat)startY {
    CGFloat scrollPadding = 12;
    CGFloat contentWidth = parent.bounds.size.width - scrollPadding * 2;
    CGFloat availableHeight = parent.bounds.size.height - startY;

    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, startY, parent.bounds.size.width, availableHeight)];
    scroll.backgroundColor = UIColor.clearColor;
    scroll.showsVerticalScrollIndicator = YES;
    [parent addSubview:scroll];

    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scroll.bounds.size.width, 1)];
    container.backgroundColor = UIColor.clearColor;
    [scroll addSubview:container];

    CGFloat currentY = 0;

    struct {
        NSString *key;
        BOOL *ref;
    } checkboxSettings[] = {
        { ENCRYPT_NS("Aimbot"), &Aimbot },
        { ENCRYPT_NS("Show FOV Circle"), &Fov },
        { ENCRYPT_NS("Ignore Bots"), &IgnoreBots },
        { ENCRYPT_NS("Ignore Knocked"), &IgnoreKnocked },
        { ENCRYPT_NS("Only Visible"), &OnlyVisibleEnemies }
    };

    for (int i = 0; i < sizeof(checkboxSettings) / sizeof(checkboxSettings[0]); i++) {
        [self addCheckboxTo:container
                       atY:&currentY
                  withText:LocalizedStringObjC(checkboxSettings[i].key)
                enabledRef:checkboxSettings[i].ref
                 isWarning:NO];
    }

    currentY += 15;
    UIView *divider1 = [[UIView alloc] initWithFrame:CGRectMake(14, currentY, contentWidth, 1)];
    divider1.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [container addSubview:divider1];
    currentY += 16;

    struct {
        NSString *title;
        NSString *options[4];
        int optionCount;
        int *ref;
    } comboBoxes[] = {
        { ENCRYPT_NS("Aim Mode"),     { ENCRYPT_NS("Closest to Player"), ENCRYPT_NS("Closest to Crosshair") }, 2, &AimMode },
        { ENCRYPT_NS("Target Bone"),  { ENCRYPT_NS("Head"), ENCRYPT_NS("Neck"), ENCRYPT_NS("Chest") }, 3, &AimTarget },
        { ENCRYPT_NS("Aim Trigger"),  { ENCRYPT_NS("Always"), ENCRYPT_NS("Only When Shooting"), ENCRYPT_NS("Only When Aiming") }, 3, &AimWhen }
    };

    for (int i = 0; i < sizeof(comboBoxes) / sizeof(comboBoxes[0]); i++) {
        NSMutableArray *localizedOptions = [NSMutableArray array];
        for (int j = 0; j < comboBoxes[i].optionCount; j++) {
            [localizedOptions addObject:LocalizedStringObjC(comboBoxes[i].options[j])];
        }

        NSMutableArray<NSNumber *> *warnings = [NSMutableArray array];
        for (int j = 0; j < comboBoxes[i].optionCount; j++) {
            if (i == 1 && j == 0) {
                [warnings addObject:@1];
            } else {
                [warnings addObject:@0];
            }
        }

        int *ref = comboBoxes[i].ref;

        [self addComboBoxTo:container
                       atY:&currentY
                 withTitle:LocalizedStringObjC(comboBoxes[i].title)
                   options:localizedOptions
             selectedIndex:ref
                hasWarning:warnings
                    action:^(int newIndex) {
                        *ref = newIndex;
                    }];

        currentY += 15;
    }

    UIView *divider2 = [[UIView alloc] initWithFrame:CGRectMake(14, currentY, contentWidth, 1)];
    divider2.backgroundColor = divider1.backgroundColor;
    [container addSubview:divider2];
    currentY += 16;

    struct {
        NSString *key;
        float *ref;
        float min;
        float max;
    } sliders[] = {
        { ENCRYPT_NS("FOV"), &AimbotFOV, 1.0f, 360.0f },
        // { ENCRYPT_NS("Max Distance"), &AimDis, 1.0f, 500.0f },
        { ENCRYPT_NS("Aim Speed"), &AimSpeed, 0.05f, 1.0f }
    };

    for (int i = 0; i < sizeof(sliders) / sizeof(sliders[0]); i++) {
        [self addSliderTo:container
                     atY:&currentY
                withText:LocalizedStringObjC(sliders[i].key)
               valueRef:sliders[i].ref
                    min:sliders[i].min
                    max:sliders[i].max
                onChange:nil];
    }

    container.frame = CGRectMake(0, 0, contentWidth + scrollPadding, currentY + 5);
    scroll.contentSize = container.frame.size;
}

- (void)buildVisualsViewInto:(UIView *)parent startY:(CGFloat)startY {
    CGFloat scrollPadding = 12;
    CGFloat contentWidth = parent.bounds.size.width - scrollPadding * 2;
    CGFloat availableHeight = parent.bounds.size.height - startY;

    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, startY, parent.bounds.size.width, availableHeight)];
    scroll.backgroundColor = UIColor.clearColor;
    scroll.showsVerticalScrollIndicator = YES;
    [parent addSubview:scroll];

    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scroll.bounds.size.width, 1)];
    container.backgroundColor = UIColor.clearColor;
    [scroll addSubview:container];

    CGFloat currentY = 0;

    [self addCheckboxTo:container
                   atY:&currentY
              withText:LocalizedStringObjC(ENCRYPT_NS("ESP Enable"))
            enabledRef:&enableESP
             isWarning:NO];

    currentY += 8;
    UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(14, currentY, contentWidth, 1)];
    divider.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [container addSubview:divider];
    currentY += 9;

    struct {
        NSString *text;
        BOOL *ref;
    } visuals[] = {
        { ENCRYPT_NS("ESP Boxes"),     &ESPBox },
        { ENCRYPT_NS("ESP Lines"),     &ESPLine },
        { ENCRYPT_NS("ESP Name"),      &ESPName },
        { ENCRYPT_NS("ESP Distance"),  &ESPDistance },
        { ENCRYPT_NS("ESP Health"),    &ESPHealth },
        { ENCRYPT_NS("ESP Skeleton"),  &ESPSkeleton }
    };

    for (int i = 0; i < sizeof(visuals) / sizeof(visuals[0]); i++) {
        [self addCheckboxTo:container
                       atY:&currentY
                  withText:LocalizedStringObjC(visuals[i].text)
                enabledRef:visuals[i].ref
                 isWarning:NO];
    }

    container.frame = CGRectMake(0, 0, contentWidth + scrollPadding, currentY + 5);
    scroll.contentSize = container.frame.size;
}

- (void)buildWeaponViewInto:(UIView *)parent startY:(CGFloat)startY {
    CGFloat currentY = startY;

    [self addCheckboxTo:parent
                  atY:&currentY
             withText:LocalizedStringObjC(ENCRYPT_NS("No Recoil"))
           enabledRef:&norecoil
          isWarning:NO];

    [self addCheckboxTo:parent
                  atY:&currentY
             withText:LocalizedStringObjC(ENCRYPT_NS("Fast Weapon Swap"))
           enabledRef:&swapweapon
          isWarning:NO];

     //   [self addCheckboxTo:parent
        //        atY:&currentY
       //    withText:LocalizedStringObjC(ENCRYPT_NS("Fast Reload"))
       //  enabledRef:&fastReload
       //   isWarning:NO];

}

- (void)buildMiscViewInto:(UIView *)parent startY:(CGFloat)startY {
    CGFloat currentY = startY;

        [self addCheckboxTo:parent
                  atY:&currentY
             withText:LocalizedStringObjC(ENCRYPT_NS("Force 120 FPS"))
          enabledRef:&forceHighFPS
         isWarning:NO];

    [self addCheckboxTo:parent
                  atY:&currentY
             withText:LocalizedStringObjC(ENCRYPT_NS("Reset Guest"))
           enabledRef:&resetguest
          isWarning:NO];

}

- (void)buildSettingsViewInto:(UIView *)parent startY:(CGFloat)startY {
    __weak __typeof__(self) weakSelfOutside = self;

    CGFloat scrollPadding = 12;
    CGFloat contentWidth = parent.bounds.size.width - scrollPadding * 2;
    CGFloat availableHeight = parent.bounds.size.height - startY;

    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, startY, parent.bounds.size.width, availableHeight)];
    scroll.backgroundColor = UIColor.clearColor;
    scroll.showsVerticalScrollIndicator = YES;
    [parent addSubview:scroll];

    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scroll.bounds.size.width, 1)];
    container.backgroundColor = UIColor.clearColor;
    [scroll addSubview:container];

    CGFloat currentY = 0;

    [self addCheckboxTo:container
                   atY:&currentY
              withText:LocalizedStringObjC(ENCRYPT_NS("Streamproof"))
            enabledRef:&StreamerMode
             isWarning:NO];

    currentY += 8;

    UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(14, currentY, contentWidth, 1)];
    divider.backgroundColor = [UIColor colorWithRed:26/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    [container addSubview:divider];
    currentY += 9;

NSMutableArray *localizedLangs = [NSMutableArray arrayWithObjects:
    LocalizedStringObjC(ENCRYPT_NS("English")),
    LocalizedStringObjC(ENCRYPT_NS("Portuguese")),
    LocalizedStringObjC(ENCRYPT_NS("Vietnamese")),
    LocalizedStringObjC(ENCRYPT_NS("Spanish")),
    nil
];

    NSMutableArray<NSNumber *> *langWarnings = [NSMutableArray array];
    for (int i = 0; i < localizedLangs.count; i++) {
        [langWarnings addObject:@0];
    }

    [self addComboBoxTo:container
                   atY:&currentY
             withTitle:LocalizedStringObjC(ENCRYPT_NS("Language"))
               options:localizedLangs
          selectedIndex:(int *)&currentLanguage
            hasWarning:langWarnings
                action:^(int newIndex) {
                    currentLanguage = (AppLanguage)newIndex;
                    __strong __typeof__(weakSelfOutside) strongSelf = weakSelfOutside;
                    if (strongSelf) {
                        CloseActiveComboBoxIfAny(strongSelf.view);
                        [strongSelf buildSidebar];

                        UIView *views[] = {
                            strongSelf->aimbotView,
                            strongSelf->visualsView,
                            strongSelf->miscView,
                            strongSelf->settingsView,
                            strongSelf->accountView,
                            strongSelf->versionView
                        };

                        for (int i = 0; i < sizeof(views)/sizeof(views[0]); i++) {
                            if (views[i].superview) [views[i] removeFromSuperview];
                        }

                        strongSelf->aimbotView = nil;
                        strongSelf->visualsView = nil;
                        strongSelf->weaponView = nil;
                        strongSelf->miscView = nil;
                        strongSelf->settingsView = nil;
                        strongSelf->accountView = nil;
                        strongSelf->versionView = nil;

                        switch (currentTab) {
                            case MenuTabAimbot:    strongSelf->aimbotView = nil; break;
                            case MenuTabVisuals:   strongSelf->visualsView = nil; break;
                            case MenuTabWeapon:    strongSelf->weaponView = nil; break;
                            case MenuTabMisc:      strongSelf->miscView = nil; break;
                            case MenuTabSettings:  strongSelf->settingsView = nil; break;
                            case MenuTabAccount:   strongSelf->accountView = nil; break;
                            case MenuTabVersion:   strongSelf->versionView = nil; break;
                        }

                        headerNeedsLanguageRefresh = YES;
                        [strongSelf updateContentView];
                    }
                }];

    currentY += 10;

NSArray<NSString *> *colorNamesLocalized = [self localizedColorNames];
NSMutableArray<NSNumber *> *colorWarnings = [NSMutableArray array];

for (int i = 0; i < colorNamesLocalized.count; i++) {
    [colorWarnings addObject:@0];
}

    [self addComboBoxTo:container
                   atY:&currentY
             withTitle:LocalizedStringObjC(ENCRYPT_NS("Theme Color"))
               options:colorNamesLocalized
         selectedIndex:&selectedColorIndex
           hasWarning:colorWarnings
              action:^(int newIndex) {
                  selectedColorIndex = newIndex;
                  self.panelAccentColor = colorValues[newIndex];
                  panelAccentColor = self.panelAccentColor;

                  __strong __typeof__(weakSelfOutside) strongSelf = weakSelfOutside;
                  if (strongSelf) {
                      headerNeedsLanguageRefresh = YES;

                      UIView *views[] = {
                          strongSelf->aimbotView,
                          strongSelf->visualsView,
                          strongSelf->miscView,
                          strongSelf->settingsView,
                          strongSelf->accountView,
                          strongSelf->versionView
                      };

                      for (int i = 0; i < sizeof(views)/sizeof(views[0]); i++) {
                          if (views[i].superview) [views[i] removeFromSuperview];
                      }

                      strongSelf->aimbotView = nil;
                      strongSelf->visualsView = nil;
                      strongSelf->weaponView = nil;
                      strongSelf->miscView = nil;
                      strongSelf->settingsView = nil;
                      strongSelf->accountView = nil;
                      strongSelf->versionView = nil;

                      switch (currentTab) {
                          case MenuTabAimbot:    strongSelf->aimbotView = nil; break;
                          case MenuTabVisuals:   strongSelf->visualsView = nil; break;
                          case MenuTabWeapon:    strongSelf->weaponView = nil; break;
                          case MenuTabMisc:      strongSelf->miscView = nil; break;
                          case MenuTabSettings:  strongSelf->settingsView = nil; break;
                          case MenuTabAccount:   strongSelf->accountView = nil; break;
                          case MenuTabVersion:   strongSelf->versionView = nil; break;
                      }

                      [strongSelf updateContentView];
                      [strongSelf buildSidebar];
                  }
              }];

    currentY += 15;

    UIView *divider2 = [[UIView alloc] initWithFrame:CGRectMake(14, currentY, contentWidth, 1)];
    divider2.backgroundColor = divider.backgroundColor;
    [container addSubview:divider2];
    currentY += 16;

    [self addSliderTo:container
                 atY:&currentY
            withText:LocalizedStringObjC(ENCRYPT_NS("Menu Transparency"))
           valueRef:&self->menuAlpha
                min:0.5f
                max:1.0f
            onChange:^(float newAlpha) {
                self->menuAlpha = fmaxf(0.5f, fminf(newAlpha, 1.0f));
                if (self->menuContainer)
                    self->menuContainer.alpha = self->menuAlpha;
            }];

    UIView *divider3 = [[UIView alloc] initWithFrame:CGRectMake(14, currentY, contentWidth, 1)];
    divider3.backgroundColor = divider.backgroundColor;
    [container addSubview:divider3];
    currentY += 16;

    [self addActionButtonTo:container
                       atY:&currentY
                  withIcon:iconSave
                  iconTint:self.panelAccentColor
                      text:LocalizedStringObjC(ENCRYPT_NS("Save Changes"))
               actionBlock:^{
                   __strong __typeof__(weakSelfOutside) strongSelf = weakSelfOutside;
                   if (strongSelf) {
                       [strongSelf saveSettings];
                   }
               }];
    currentY += 2;

    [self addActionButtonTo:container
                       atY:&currentY
                  withIcon:iconRestore
                  iconTint:self.panelAccentColor
                      text:LocalizedStringObjC(ENCRYPT_NS("Restore Defaults"))
               actionBlock:^{
                   __strong __typeof__(weakSelfOutside) strongSelf = weakSelfOutside;
                   if (strongSelf) {
                       [strongSelf resetSettingsToDefaults];
                       [strongSelf buildSidebar];
                       headerNeedsLanguageRefresh = YES;

                       UIView *views[] = {
                           strongSelf->aimbotView,
                           strongSelf->visualsView,
                           strongSelf->miscView,
                           strongSelf->settingsView,
                           strongSelf->accountView,
                           strongSelf->versionView
                       };

                       for (int i = 0; i < sizeof(views)/sizeof(views[0]); i++) {
                           if (views[i].superview) [views[i] removeFromSuperview];
                       }

                       strongSelf->aimbotView = nil;
                       strongSelf->visualsView = nil;
                       strongSelf->weaponView = nil;
                       strongSelf->miscView = nil;
                       strongSelf->settingsView = nil;
                       strongSelf->accountView = nil;
                       strongSelf->versionView = nil;

                       switch (currentTab) {
                           case MenuTabAimbot:    strongSelf->aimbotView = nil; break;
                           case MenuTabVisuals:   strongSelf->visualsView = nil; break;
                           case MenuTabWeapon:    strongSelf->weaponView = nil; break;
                           case MenuTabMisc:      strongSelf->miscView = nil; break;
                           case MenuTabSettings:  strongSelf->settingsView = nil; break;
                           case MenuTabAccount:   strongSelf->accountView = nil; break;
                           case MenuTabVersion:   strongSelf->versionView = nil; break;
                       }

                       [strongSelf updateContentView];
                   }
               }];

    container.frame = CGRectMake(0, 0, contentWidth + scrollPadding, currentY + 5);
    scroll.contentSize = container.frame.size;
}

- (void)buildAccountViewInto:(UIView *)parent startY:(CGFloat)startY {
    CGFloat y = startY;

    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    int64_t secondsLeft = (g_expirationTimestamp > now) ? (g_expirationTimestamp - now) : 0;

    int days = (int)(secondsLeft / 86400);
    int hours = (int)((secondsLeft % 86400) / 3600);
    int minutes = (int)((secondsLeft % 3600) / 60);
    int seconds = (int)(secondsLeft % 60);

    NSMutableArray *parts = [NSMutableArray array];

    if (days > 0) {
        NSString *unit = (days == 1)
            ? LocalizedStringObjC(ENCRYPT_NS("day"))
            : LocalizedStringObjC(ENCRYPT_NS("days"));
        [parts addObject:[NSString stringWithFormat:@"%d %@", days, unit]];
    }

    if (hours > 0) {
        NSString *unit = (hours == 1)
            ? LocalizedStringObjC(ENCRYPT_NS("hour"))
            : LocalizedStringObjC(ENCRYPT_NS("hours"));
        [parts addObject:[NSString stringWithFormat:@"%d %@", hours, unit]];
    }

    if (minutes > 0) {
        NSString *unit = (minutes == 1)
            ? LocalizedStringObjC(ENCRYPT_NS("minute"))
            : LocalizedStringObjC(ENCRYPT_NS("minutes"));
        [parts addObject:[NSString stringWithFormat:@"%d %@", minutes, unit]];
    }

    if (seconds > 0 || parts.count == 0) {
        NSString *unit = (seconds == 1)
            ? LocalizedStringObjC(ENCRYPT_NS("second"))
            : LocalizedStringObjC(ENCRYPT_NS("seconds"));
        [parts addObject:[NSString stringWithFormat:@"%d %@", seconds, unit]];
    }

    NSString *prefix = LocalizedStringObjC(ENCRYPT_NS("subscription_prefix"));
    NSString *timeString = [parts componentsJoinedByString:@", "];
    NSString *fullText = [NSString stringWithFormat:@"%@%@", prefix, timeString];

    UIFont *font = fontRegular ?: [UIFont systemFontOfSize:14];

    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:fullText];
    [attrText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, fullText.length)];
    [attrText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.7 alpha:1.0]
                     range:NSMakeRange(0, prefix.length)];
    [attrText addAttribute:NSForegroundColorAttributeName value:self.panelAccentColor
                     range:NSMakeRange(prefix.length, timeString.length)];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(14, y, parent.bounds.size.width - 28, 0)];
    label.attributedText = attrText;
    label.numberOfLines = 0;
    [label sizeToFit];
    [parent addSubview:label];
}

- (void)buildVersionViewInto:(UIView *)parent startY:(CGFloat)startY {
    CGFloat y = startY;

NSString *version = (g_savedVersionName.length() > 0)
    ? [NSString stringWithUTF8String:g_savedVersionName.c_str()]
    : ENCRYPT_NS("UNKNOWN");


    if (!version || version.length == 0) {
        version = ENCRYPT_NS("UNKNOWN");
    } else {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\d+(\\.\\d+)*"
                                                                                options:0
                                                                                  error:nil];
        NSTextCheckingResult *match = [regex firstMatchInString:version options:0 range:NSMakeRange(0, version.length)];
        if (match) {
            version = [version substringWithRange:match.range];
        } else {
            version = ENCRYPT_NS("UNKNOWN");
        }
    }

    NSString *trialMarker = LocalizedStringObjC(ENCRYPT_NS("trial"));
    BOOL isTrial = [version.uppercaseString containsString:trialMarker.uppercaseString];

    if (isTrial) {
        NSMutableString *text = [NSMutableString string];
        [text appendString:LocalizedStringObjC(ENCRYPT_NS("trial_text_1"))];
        [text appendString:@"\n"];
        [text appendString:LocalizedStringObjC(ENCRYPT_NS("trial_text_2"))];

        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:text];
        UIFont *font = fontRegular ?: [UIFont systemFontOfSize:14];
        if (!font) font = [UIFont systemFontOfSize:15];
        [attr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attr.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.7 alpha:1.0] range:NSMakeRange(0, attr.length)];

        UIColor *highlightColor = self.panelAccentColor;
        NSArray *highlights = @[
            LocalizedStringObjC(ENCRYPT_NS("highlight_trial")),
            LocalizedStringObjC(ENCRYPT_NS("highlight_testing")),
            LocalizedStringObjC(ENCRYPT_NS("highlight_feedback")),
            LocalizedStringObjC(ENCRYPT_NS("highlight_release")),
            LocalizedStringObjC(ENCRYPT_NS("highlight_improve"))
        ];

        for (NSString *word in highlights) {
            NSRange r = [text rangeOfString:word options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound) {
                [attr addAttribute:NSForegroundColorAttributeName value:highlightColor range:r];
            }
        }

        UILabel *trialLabel = [[UILabel alloc] initWithFrame:CGRectMake(14, y, parent.bounds.size.width - 28, 100)];
        trialLabel.attributedText = attr;
        trialLabel.numberOfLines = 0;
        [trialLabel sizeToFit];
        [parent addSubview:trialLabel];
        y += trialLabel.frame.size.height + 10;
    }

    NSTimeInterval ts = g_versionCreatedTimestamp;
    if (ts < 946684800 || ts > 4102444800) {
        ts = [[NSDate date] timeIntervalSince1970];
    }

    NSDate *buildDate = [NSDate dateWithTimeIntervalSince1970:ts];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    formatter.dateFormat = @"MMMM dd yyyy HH:mm:ss";
    NSString *formattedDate = [formatter stringFromDate:buildDate];

    NSString *buildVersion = ENCRYPT_NS("1.114.X");
    NSString *prefix = LocalizedStringObjC(ENCRYPT_NS("build_prefix"));
    NSString *suffix = LocalizedStringObjC(ENCRYPT_NS("build_suffix"));
    NSString *finalLine;

if (currentLanguage == AppLanguagePortuguese) {
    finalLine = [NSString stringWithFormat:ENCRYPT_NS("Esta compilação é a versão %@, desenvolvida em %@ para a versão do jogo %@."), version, formattedDate, buildVersion];
} else if (currentLanguage == AppLanguageVietnamese) {
    finalLine = [NSString stringWithFormat:ENCRYPT_NS("Bản dựng này là phiên bản %@, được phát triển vào %@ cho phiên bản trò chơi %@."), version, formattedDate, buildVersion];
} else if (currentLanguage == AppLanguageSpanish) {
    finalLine = [NSString stringWithFormat:ENCRYPT_NS("Esta compilación es la versión %@, desarrollada el %@ para la versión del juego %@."), version, formattedDate, buildVersion];
} else {
    finalLine = [NSString stringWithFormat:ENCRYPT_NS("This build is version %@, developed on %@ for game version %@."), version, formattedDate, buildVersion];
}

    NSMutableAttributedString *attrBuild = [[NSMutableAttributedString alloc] initWithString:finalLine];
    UIFont *font = fontRegular ?: [UIFont systemFontOfSize:14];
    if (!font) font = [UIFont systemFontOfSize:15];
    [attrBuild addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attrBuild.length)];
    [attrBuild addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.7 alpha:1.0] range:NSMakeRange(0, attrBuild.length)];

    UIColor *highlightColor = self.panelAccentColor;

    NSRange r1 = [finalLine rangeOfString:formattedDate];
    if (r1.location != NSNotFound) {
        [attrBuild addAttribute:NSForegroundColorAttributeName value:highlightColor range:r1];
    }

    NSRange r2 = [finalLine rangeOfString:buildVersion];
    if (r2.location != NSNotFound) {
        [attrBuild addAttribute:NSForegroundColorAttributeName value:highlightColor range:r2];
    }

    NSRange r3 = [finalLine rangeOfString:version];
    if (r3.location != NSNotFound) {
        [attrBuild addAttribute:NSForegroundColorAttributeName value:highlightColor range:r3];
    }

    UILabel *buildLabel = [[UILabel alloc] initWithFrame:CGRectMake(14, y, parent.bounds.size.width - 28, 20)];
    buildLabel.attributedText = attrBuild;
    buildLabel.numberOfLines = 0;
    [buildLabel sizeToFit];
    [parent addSubview:buildLabel];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    UIView *target = gesture.view;
    CGPoint touchPoint = [gesture locationInView:target];

    UIView *touchedView = [target hitTest:touchPoint withEvent:nil];
    if (touchedView.tag == 7001 || [touchedView isKindOfClass:[UIButton class]]) {
        return;
    }

    CGPoint globalTouch = [gesture locationInView:self.view];

    if (gesture.state == UIGestureRecognizerStateBegan) {
        initialTouchPoint = globalTouch;
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGFloat dx = globalTouch.x - initialTouchPoint.x;
        CGFloat dy = globalTouch.y - initialTouchPoint.y;
        CGPoint newCenter = CGPointMake(menuContainer.center.x + dx, menuContainer.center.y + dy);
        menuContainer.center = newCenter;
        initialTouchPoint = globalTouch;

        for (UIView *overlay in self.view.subviews) {
            if (overlay.tag == 100000 && !overlay.hidden) {
                NSArray *refs = overlay.accessibilityElements;
                if (refs.count >= 2) {
                    UIView *comboContainer = refs[0];
                    UIView *dropdown = refs[1];
                    CGRect containerInWindow = [comboContainer convertRect:comboContainer.bounds toView:self.view];
                    dropdown.frame = CGRectMake(containerInWindow.origin.x,
                                                containerInWindow.origin.y + comboContainer.frame.size.height + 2,
                                                dropdown.frame.size.width,
                                                dropdown.frame.size.height);
                }
            }
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([gestureRecognizer.view isKindOfClass:[_a9DkPq7LsTv0 class]]) {
        _a9DkPq7LsTv0 *overlay = (_a9DkPq7LsTv0 *)gestureRecognizer.view;
        CGPoint location = [touch locationInView:overlay];
        for (UIView *view in overlay._xR3mZ28JqU1o) {
            if (view && [view window]) {
                CGPoint pointInView = [overlay convertPoint:location toView:view];
                if ([view pointInside:pointInView withEvent:nil]) {
                    return NO;
                }
            }
        }
    }
    return YES;
}


- (void)preloadIconsAndFonts {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        iconEye     = [self imageFromBase64:ICON_EYE_BASE64];
        iconAimbot  = [self imageFromBase64:ICON_CROSSHAIR_BASE64];
        iconMisc    = [self imageFromBase64:ICON_MISC_BASE64];
        iconWeapon  = [self imageFromBase64:ICON_WEAPON_BASE64];
        iconSettings= [self imageFromBase64:ICON_SETTINGS_BASE64];
        iconAccount = [self imageFromBase64:ICON_ACCOUNT_BASE64];
        iconVersion = [self imageFromBase64:ICON_VERSION_BASE64];
        iconCheck   = [self imageFromBase64:ICON_CHECK_BASE64];
        iconWarning = [self imageFromBase64:ICON_WARNING_BASE64];
        iconSave    = [self imageFromBase64:ICON_SAVE_BASE64];
        iconRestore = [self imageFromBase64:ICON_RESTORE_BASE64];
        arrowDown   = [self imageFromBase64:ICON_ARROWDOWN_BASE64];

        fontRegular  = [self registerFontFromBase64:InterRegular_base64 name:[NSString stringWithUTF8String:ENCRYPT_CSTR("Inter-Regular")] size:14];
        fontSemiBold = [self registerFontFromBase64:InterSemiBold_base64 name:[NSString stringWithUTF8String:ENCRYPT_CSTR("Inter-SemiBold")] size:14];
    });
}

- (UIImage *)imageFromBase64:(const char *)base64 {
    NSString *base64Str = [NSString stringWithUTF8String:base64];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    return [UIImage imageWithData:data];
}

- (UIFont *)registerFontFromBase64:(const char *)base64 name:(NSString *)fontName size:(CGFloat)size {
    NSString *base64Str = [NSString stringWithUTF8String:base64];
    NSData *fontData = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    if (!fontData) return [UIFont systemFontOfSize:size];
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)fontData);
    CGFontRef font = CGFontCreateWithDataProvider(provider);
    if (font) {
        CTFontManagerRegisterGraphicsFont(font, NULL);
        UIFont *customFont = [UIFont fontWithName:fontName size:size];
        CGFontRelease(font);
        CGDataProviderRelease(provider);
        return customFont ?: [UIFont systemFontOfSize:size];
    }

    CGDataProviderRelease(provider);
    return [UIFont systemFontOfSize:size];
}

UIColor* GetLinkedColorFromLabel(UILabel* label) {
    return [UIColor whiteColor]; 
}

@end

__attribute__((constructor))
static void __loadAssetsOnce(void) {
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong id obj = [[_m1Bf03WvGkXe alloc] init];
        [obj preloadIconsAndFonts];
    });
}
