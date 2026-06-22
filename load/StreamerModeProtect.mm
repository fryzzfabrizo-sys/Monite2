#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "../Obfuscate.h"
#import "globals.h"
#import "StreamerModeProtect.h"
#import "../oxorany_include.h"
#import "imguiload.h"

UIView *protectedView = nil;

BOOL __fn_hideCaptureForView(UIView *v, BOOL hidden) {
    static dispatch_once_t __once;
    static NSString *__maskKey = nil;

    dispatch_once(&__once, ^{
        const char *b64 = oxorany("ZGlzYWJsZVVwZGF0ZU1hc2s=");
        NSData *data = [[NSData alloc] initWithBase64EncodedString:[NSString stringWithUTF8String:b64]
                                                           options:NSDataBase64DecodingIgnoreUnknownCharacters];
        if (data) {
            __maskKey = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    });

    if (!v) return NO;
    if (!__maskKey || ![v.layer respondsToSelector:NSSelectorFromString(__maskKey)]) return NO;

    NSInteger value = hidden ? ((1 << 1) | (1 << 4)) : 0;
    [v.layer setValue:@(value) forKey:__maskKey];
    return YES;
}

void UpdateStreamProtectionForView(UIView *view) {
    protectedView = view;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:ENCRYPT_NS("StreamerMode")]) {
        StreamerMode = [defaults boolForKey:ENCRYPT_NS("StreamerMode")];
    }

    if (view) {
        __fn_hideCaptureForView(view, StreamerMode);
    }
}

void SetStreamerMode(BOOL value) {
    StreamerMode = value;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:value forKey:ENCRYPT_NS("StreamerMode")];
    [defaults synchronize];

    if (renderView) __fn_hideCaptureForView(renderView, value);
    if (protectedView && protectedView != renderView) __fn_hideCaptureForView(protectedView, value);

    if (__ctx && __ctx->__view_container) {
        __fn_hideCaptureForView(__ctx->__view_container, value);
    }
    if (__ctx && __ctx->__view_controller && __ctx->__view_controller.view) {
        __fn_hideCaptureForView(__ctx->__view_controller.view, value);
    }

    if (extraInfoInstance && extraInfoInstance.vna && extraInfoInstance.vna.view) {
        __fn_hideCaptureForView(extraInfoInstance.vna.view, value);
    }

    if ([extraInfoInstance respondsToSelector:@selector(KhanhTrinh)]) {
        [extraInfoInstance KhanhTrinh];
    }
}

__attribute__((constructor))
static void __applyStreamerMode(void) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:ENCRYPT_NS("StreamerMode")]) {
            StreamerMode = [defaults boolForKey:ENCRYPT_NS("StreamerMode")];
        }

        if (renderView) {
            __fn_hideCaptureForView(renderView, StreamerMode);
        }
        if (protectedView && protectedView != renderView) {
            __fn_hideCaptureForView(protectedView, StreamerMode);
        }
    });
}

