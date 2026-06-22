#pragma once
#import <UIKit/UIKit.h>

extern BOOL StreamerMode;
extern UIView *protectedView;

BOOL __fn_hideCaptureForView(UIView *v, BOOL hidden);
void UpdateStreamProtectionForView(UIView *view);
void SetStreamerMode(BOOL value);
