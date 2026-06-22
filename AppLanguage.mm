#import "AppLanguageBridge.h"

NSString *LocalizedStringObjC(NSString *key) {
    std::string keyStr = [key UTF8String];
    std::string result = LocalizedString(keyStr);
    return [NSString stringWithUTF8String:result.c_str()];
}
