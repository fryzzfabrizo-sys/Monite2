#ifndef GLOBALS_H
#define GLOBALS_H
#pragma once

#import <UIKit/UIKit.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <QuartzCore/CAMetalLayer.h>
#import <SpriteKit/SpriteKit.h>
#include <string>
#include <vector> 
#import "RequireESP/Vector3.h"
#import "LIB/IMGUI/imgui.h"
#import "LIB/IMGUI/imgui_impl_metal.h"

#define KhanhTrinh _qvJVKpzzCYIO
#define tapIconView2 _eo72eVuy4HK8
#define tapIconView _BuNweL0kflws

#define jh_controllerFromString _Yta6W7wAJ573

#define jh_notice_vc _ByEyOlHhZ484
#define currentViewController _iNzNj8Yk0lI1

#define presentVC _LsLm9Gg8Aci8
#define pushVC _z0FwHlrWyTWb

#define fetchViewController _qf3e4YgsjTmb
#define fetchViewControllerFromView _TecTK8kFSV2o
#define fetchViewControllerFromRootViewController _ubU5XOvFGe7L

typedef struct {
    UIView *__view_container;
    UIViewController *__view_controller;
} __struct_MenuContext;

extern __struct_MenuContext *__ctx;

extern bool StreamerMode;

extern bool ESPEnable, ESPLine, ESPBox, ESP2DBox, ESP3DBox, ESP3DBox2, Fov;
extern bool ESPCount, ESPArrow, ESPArrow2, ESPHealth, ESPHealth2, ESPName;
extern bool ESPOutline, ESPDistance, ESPDistance2, RS;
extern float sliderDistanceValue;
extern float AimbotFOV;
extern int AimCheck;
extern int AimType;
extern int AimWhen;
extern int AimMode;
extern bool Aimbot;
extern float AimDis;
extern bool Enable;
extern bool isAiming;
extern bool ESPSkeleton;

extern bool enableESP;

extern bool SilentAim;

extern bool forceHighFPS;
extern bool resetguest;

extern bool swapweapon;

extern int AimTarget;

extern ImFont* g_espFont;

extern bool IgnoreBots; 
extern bool IgnoreKnocked; 
extern bool OnlyVisibleEnemies;
extern bool norecoil;
extern bool LimitToFOV;
extern float AimSpeed;

extern UIView *renderView;

extern UIColor *panelAccentColor; // Cor do tema usada globalmente (ex: FOV)

extern bool infiniteAmmo;
extern bool allowShootWhileMoving;
extern bool fastReload;

// === Variáveis de hook externas ===
extern void (*orig_NoRecoil)(void* instance, Vector3* recoilVec, float a1, float a2);
extern void (*orig_bitch)(void* _this, float a1, float a2);

// === Funções hookadas ===
void NoRecoil(void* instance, Vector3* recoilVec, float a1, float a2);
void bitch(void* _this, float a1, float a2);

// === Utilitários ===
void* GetClosestEnemy(void* match);

void activerecoil(void);
void disablerecoil(void);

#ifdef __cplusplus
#include <string>
extern std::string g_savedKey;
extern std::string g_savedVersionName;
extern int64_t g_versionCreatedTimestamp;
extern int64_t g_expirationTimestamp;

#endif

#endif // GLOBALS_H
