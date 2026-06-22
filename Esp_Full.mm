#import "load/ImGuiDrawView.h"
#include <mach-o/dyld.h>
#include <mach-o/getsect.h>
#include <mach/mach.h>
#include <math.h>
#import <Foundation/Foundation.h>
#import "Include.h"
#include <vector>
#include <thread>
#include "Il2cpp.h"
#include "RequireESP/Vector3.h"
#include "RequireESP/Vector2.h"
#include "RequireESP/Quaternion.h"
#include "RequireESP/Monostring.h"
#include "RequireESP/Esp.h"
#import <UIKit/UIKit.h>

UIWindow *mainWindow;
UIButton *menuView;
@interface _kRt85NyZjPoX () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;

@end

@implementation _kRt85NyZjPoX

static bool MenDeal = true;
ImFont* g_espFont = nullptr;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); 
    (void)io;
    
    SetDarkThemeColors();
    io.ConfigWindowsMoveFromTitleBarOnly = true;
    io.IniFilename = NULL;
    static const ImWchar icons_ranges[] = { 0xf000, 0xf3ff, 0 };
    ImFontConfig icons_config;
    ImFontConfig CustomFont;
    CustomFont.FontDataOwnedByAtlas = false;
    icons_config.MergeMode = true;
    icons_config.PixelSnapH = true;
    icons_config.OversampleH = 7;
    icons_config.OversampleV = 7;
    NSString *FontPath = @"/System/Library/Fonts/Core/HelveticaNeue.ttc";
    g_espFont = io.Fonts->AddFontFromFileTTF(FontPath.UTF8String, 40.f, NULL, io.Fonts->GetGlyphRangesVietnamese());
    io.Fonts->AddFontFromMemoryCompressedTTF(font_awesome_data, font_awesome_size, 25.0f, &icons_config, icons_ranges);
    ImGui_ImplMetal_Init(_device);

    return self;
}

+ (void)_mWx41FrTcQaL:(BOOL)open
{
    MenDeal = open;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView{
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;
    self.mtkView.userInteractionEnabled = NO;
}

#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)drawInMTKView:(MTKView*)view
{
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    
    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    
    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:NSSENCRYPT("ImGui Jane")];
        
        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();
        ImGuiStyle& style = ImGui::GetStyle();
        
        
        ImFont* font = ImGui::GetFont();
        font->Scale = 18.f / font->FontSize;
        
CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;

CGFloat x = (screenWidth - 390) / 2.0;
CGFloat y = (screenHeight - 261) / 2.0;

        ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);

            if (enableESP) {
        DrawEsp();
    }

    if (Aimbot) {
        AimbotRun();
    }

    if (Fov) {
        ImDrawList* drawList = ImGui::GetBackgroundDrawList();

        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        ImVec2 screenCenter(screenWidth / 2.0f, screenHeight / 2.0f);

        CGFloat r, g, b, a;
        [panelAccentColor getRed:&r green:&g blue:&b alpha:&a];
        drawList->AddCircle(screenCenter, AimbotFOV, ImColor((float)r, (float)g, (float)b, (float)a), 256, 0.5f);
    }

        ImGui::Render();
        ImDrawData* draw_data = ImGui::GetDrawData();
        ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
        
        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];
        
        [commandBuffer presentDrawable:view.currentDrawable];
        
    }
    [commandBuffer commit];
}


- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size{}

@end
