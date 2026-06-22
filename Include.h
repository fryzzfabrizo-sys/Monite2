#import <Foundation/Foundation.h>
#import <MetalKit/MetalKit.h>
#import <Metal/Metal.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIAlertView.h>
#import <UIKit/UIControl.h>
#import "utils/CaptainHook.h"
#import "load/ImGuiDrawView.h"
#define IMGUI_DISABLE_DEMO_WINDOWS
#import "LIB/IMGUI/imgui.h"
#import "LIB/IMGUI/imgui_impl_metal.h"
#include "fishhook/patch.h"
#import "fishhook/hook.h"

#include "utils/Obfuscate.h"
#include "LIB/IMGUI/imgui_internal.h"

#include "LIB/Other/Theme.h"
#include "LIB/Other/Icon.h"
#include "LIB/Other/Iconcpp.h"