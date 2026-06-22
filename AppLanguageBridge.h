#pragma once

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C++" {
    #include "AppLanguage.hpp"
}
#endif

#ifdef __cplusplus
extern "C" {
#endif

NSString *LocalizedStringObjC(NSString *key);

#ifdef __cplusplus
}
#endif
