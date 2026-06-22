#ifndef ESP_H
#define ESP_H

#define RAD2DEG(x) ((float)(x) * (float)(180.f / IM_PI))
#define DEG2RAD(x) ((float)(x) * (float)(IM_PI / 180.f))
#include <unordered_map>

#include "./load/globals.h"
#include "Offsets.hpp"

ImU32 color = IM_COL32(255, 255, 255, 150);

static inline ImVec2 operator*(const ImVec2& lhs, const float rhs) { return ImVec2(lhs.x * rhs, lhs.y * rhs); }
static inline ImVec2 operator/(const ImVec2& lhs, const float rhs) { return ImVec2(lhs.x / rhs, lhs.y / rhs); }
static inline ImVec2 operator+(const ImVec2& lhs, const float rhs) { return ImVec2(lhs.x + rhs, lhs.y + rhs); }
static inline ImVec2 operator+(const ImVec2& lhs, const ImVec2& rhs) { return ImVec2(lhs.x + rhs.x, lhs.y + rhs.y); }
static inline ImVec2 operator-(const ImVec2& lhs, const ImVec2& rhs) { return ImVec2(lhs.x - rhs.x, lhs.y - rhs.y); }
static inline ImVec2 operator-(const ImVec2& lhs, const float rhs) { return ImVec2(lhs.x - rhs, lhs.y - rhs); }
static inline ImVec2 operator*(const ImVec2& lhs, const ImVec2& rhs) { return ImVec2(lhs.x * rhs.x, lhs.y * rhs.y); }
static inline ImVec2 operator/(const ImVec2& lhs, const ImVec2& rhs) { return ImVec2(lhs.x / rhs.x, lhs.y / rhs.y); }
static inline ImVec2& operator*=(ImVec2& lhs, const float rhs) {
    lhs.x *= rhs;
    lhs.y *= rhs;
    return lhs;
}
static inline ImVec2& operator/=(ImVec2& lhs, const float rhs) {
    lhs.x /= rhs;
    lhs.y /= rhs;
    return lhs;
}
static inline ImVec2& operator+=(ImVec2& lhs, const ImVec2& rhs) {
    lhs.x += rhs.x;
    lhs.y += rhs.y;
    return lhs;
}
static inline ImVec2& operator-=(ImVec2& lhs, const ImVec2& rhs) {
    lhs.x -= rhs.x;
    lhs.y -= rhs.y;
    return lhs;
}
static inline ImVec2& operator*=(ImVec2& lhs, const ImVec2& rhs) {
    lhs.x *= rhs.x;
    lhs.y *= rhs.y;
    return lhs;
}
static inline ImVec2& operator/=(ImVec2& lhs, const ImVec2& rhs) {
    lhs.x /= rhs.x;
    lhs.y /= rhs.y;
    return lhs;
}
static inline ImVec4 operator+(const ImVec4& lhs, const ImVec4& rhs) { return ImVec4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w); }
static inline ImVec4 operator-(const ImVec4& lhs, const ImVec4& rhs) { return ImVec4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w); }
static inline ImVec4 operator*(const ImVec4& lhs, const ImVec4& rhs) { return ImVec4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w); }

template <typename T>
inline T clamp(const T& n, const T& lower, const T& upper) {
    return std::max(lower, std::min(n, upper));
}


inline float lerp(float a, float b, float f) { return clamp<float>(a + f * (b - a), a > b ? b : a, a > b ? a : b); }

inline ImColor collerp(ImColor a, ImColor b, float f) { return {a.Value.x + f * (b.Value.x - a.Value.x), a.Value.y + f * (b.Value.y - a.Value.y), a.Value.z + f * (b.Value.z - a.Value.z), a.Value.w + f * (b.Value.w - a.Value.w)}; }

bool ESPEnable = false, ESPLine = false, ESPBox = false, ESP2DBox = false, ESP3DBox = false, ESP3DBox2 = false, Fov = false;
bool ESPCount = false, ESPArrow = false, ESPArrow2 = false, ESPHealth = false, ESPHealth2 = false, ESPName = false;
bool ESPOutline = false, ESPDistance = false, ESPDistance2 = false, RS = false;

// Formato da box (0 = arredondada, 1 = retangular, 2 = com cantos)
extern int ESPBoxShape;

// Posição da barra de vida (0 = esquerda, 1 = direita)
extern int ESPHealthPosition;

// Sombra no nome (0 = com sombra)
extern int ESPNameShadow;

// Fonte usada para ESPName
extern ImFont* _espFont;

float sliderDistanceValue = 300.0f;
float AimbotFOV = 90.0f;
int AimCheck = 0;
int AimType = 0;
int AimWhen = 1;
bool Aimbot = false;
float AimDis = 150.0f;
bool Enable = true;
bool isAiming = false;
bool IgnoreBots = false;   // Pode ser ligado/desligado pelo menu
int AimMode = 1;           // 0 = Mais próximo do jogador | 1 = Mais próximo do centro da mira
bool IgnoreKnocked = false; // Ignora inimigos derrubados (knocked)
bool OnlyVisibleEnemies = false;
int AimTarget = 0;
bool ESPSkeleton = false;
bool SilentAim = false;
bool LimitToFOV = false;
bool enableESP = false;
float AimSpeed = 1.0f; // Valor entre 0.0f e 1.0f — 1.0 mira instantaneamente, 0.1 é bem lento
float colorVisible[4]   = { 0.8f, 0.498f, 1.0f, 1.0f };  // Roxo claro
float colorInvisible[4] = { 0.8f, 0.498f, 1.0f, 1.0f };  // Mesmo roxo claro

void* get_main() {
    static void* (*func)() = (void *(*)())getRealOffset(Offsets::get_main);
    return func();
}

void* get_transform(void* obj) {
    static void* (*func)(void*) = (void *(*)(void *))getRealOffset(Offsets::get_transform);
    return func(obj);
}

void* get_transformNode(void* obj) {
    static void* (*func)(void*) = (void *(*)(void *))getRealOffset(Offsets::get_transformNode);
    return func(obj);
}

Vector3 WorldToViewpoint(void* cam, Vector3 pos, int eye) {
    static Vector3 (*func)(void*, Vector3, int) = (Vector3(*)(void *, Vector3, int))getRealOffset(Offsets::WorldToViewpoint);
    return func(cam, pos, eye);
}

Vector3 get_position(void* obj) {
    static Vector3 (*func)(void*) = (Vector3(*)(void *))getRealOffset(Offsets::get_position);
    return func(obj);
}

bool IsTeammate(void* player) {
    static bool (*func)(void*) = (bool (*)(void *))getRealOffset(Offsets::Team);
    return player ? func(player) : false;
}

bool IsLocalPlayer(void* player) {
    static bool (*func)(void*) = (bool (*)(void *))getRealOffset(Offsets::Local);
    return player ? func(player) : false;
}

ImVec2 world2screen_i(Vector3 pos) {
    auto cam = get_main();
    if (!cam) return {0, 0};

    Vector3 worldPoint = WorldToViewpoint(cam, pos, 2);
    Vector3 location;

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;

    location.x = screenWidth * worldPoint.x;
    location.y = screenHeight - (screenHeight * worldPoint.y);
    location.z = worldPoint.z;

    return {location.x, location.y};
}

ImVec2 world2screen_c(Vector3 pos, bool& checker) {
    auto cam = get_main();
    if (!cam) return {0, 0};

    Vector3 worldPoint = WorldToViewpoint(cam, pos, 2);
    Vector3 location;

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;

    location.x = screenWidth * worldPoint.x;
    location.y = screenHeight - (screenHeight * worldPoint.y);
    location.z = worldPoint.z;

    checker = location.z > 1;
    return {location.x, location.y};
}

int get_HP(void* player) {
    static int (*func)(void*) = (int (*)(void*))getRealOffset(Offsets::get_HP);
    return func(player);
}

int get_maxHP(void* player) {
    static int (*func)(void*) = (int (*)(void*))getRealOffset(Offsets::get_maxHP);
    return func(player);
}

bool get_isLiving(void* player) {
    if (get_HP(player) > 0) {
        return true;
    } else {
        return false;
    }
}

monoString* get_Nickname(void* player) {
    static monoString* (*func)(void*) = (monoString* (*)(void*))getRealOffset(Offsets::Local);
    return player ? func(player) : nullptr;
}

std::string monoStringToStdString(monoString* mStr) {
    if (mStr == nullptr) return "";
    return std::string(mStr->toCString());
}

std::string getPlayerNickname(void* player) {
    if (player == nullptr) return "";
    monoString* mStr = get_Nickname(player);
    return monoStringToStdString(mStr);
}

bool get_IsDieing(void* player) {
    static bool (*func)(void*) = (bool (*)(void*))getRealOffset(Offsets::get_IsDieing);
    return player ? func(player) : false;
}

bool get_IsVisible(void* player) {
    static bool (*func)(void*) = (bool (*)(void*))getRealOffset(Offsets::get_IsVisible);
    return player ? func(player) : false;
}

void* GetLocalPlayer(void* game) {
    static void* (*func)(void*) = (void* (*)(void*))getRealOffset(Offsets::GetLocalPlayer);
    return func(game);
}

void* Curent_Match() {
    static void* (*func)(void*) = (void* (*)(void*))getRealOffset(Offsets::CurrentMatch);
    return func(nullptr);
}

void* Camera_main() {
    static void* (*func)(void*) = (void* (*)(void*))getRealOffset(Offsets::Camera_main);
    return func(nullptr);
}

Quaternion GetRotation(void* player) {
    static Quaternion (*func)(void*) = (Quaternion (*)(void*))getRealOffset(Offsets::GetRotation);
    return player ? func(player) : Quaternion();
}

bool get_isLocalTeam(void* player) {
    static bool (*func)(void*) = (bool (*)(void*))getRealOffset(Offsets::get_isLocalTeam);
    return player ? func(player) : false;
}

bool get_IsSighting(void* player) {
    static bool (*func)(void*) = (bool (*)(void*))getRealOffset(Offsets::get_IsSighting);
    return player ? func(player) : false;
}

bool get_IsFiring(void* player) {
    static bool (*func)(void*) = (bool (*)(void*))getRealOffset(Offsets::get_IsFiring);
    return player ? func(player) : false;
}

Vector3 WorldToScreenPoint(void* worldCam, Vector3 worldPos) {
    static Vector3 (*func)(void*, Vector3) = (Vector3 (*)(void*, Vector3))getRealOffset(Offsets::WorldToScreenPoint);
    return func(worldCam, worldPos);
}

void* GetHeadPositions(void* player) {
    static void* (*func)(void*) = (void* (*)(void*))getRealOffset(Offsets::GetHeadPositions);
    return player ? func(player) : nullptr;
}

void* Component_GetTransform(void* component) {
    static void* (*func)(void*) = (void* (*)(void*))getRealOffset(Offsets::Component_GetTransform);
    return component ? func(component) : nullptr;
}

Quaternion GetRotationToTheLocation(Vector3 Target, float Height, Vector3 MyEnemy)
{
    return Quaternion::LookRotation((Target + Vector3(0, Height, 0)) - MyEnemy, Vector3(0, 1, 0));
}

static Vector3 GetHeadPosition(void* player) {
    return get_position(GetHeadPositions(player));
}

Vector3 GetNeckPosition(void* player) {
    Vector3 head = GetHeadPosition(player);
    Vector3 foot = get_position(Component_GetTransform(player));

    if (foot == Vector3(0, 0, 0)) {
        foot = Vector3(head.x, head.y - 1.0f, head.z);
    }

    float proportion = 0.9f; // Pescoço
    return head + (foot - head) * proportion;
}

Vector3 GetChestPosition(void* player) {
    Vector3 head = GetHeadPosition(player);
    Vector3 foot = get_position(Component_GetTransform(player));

    if (foot == Vector3(0, 0, 0)) {
        foot = Vector3(head.x, head.y - 1.0f, head.z);
    }

    float proportion = 0.75f; // Peito
    return head + (foot - head) * proportion;
}

Vector3 GetHipPosition(void* player) {
    void* HipITF = *(void**)((uintptr_t)player + Offsets::HipPosition);
    void* HipTF = get_transformNode(HipITF);
    return get_position(HipTF);
}

Vector3 GetLeftShoulderPosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::LeftShoulderPosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetRightShoulderPosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::RightShoulderPosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetLeftAnklePosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::LeftAnklePosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetRightAnklePosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::RightAnklePosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetLeftToePosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::LeftToePosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetRightToePosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::RightToePosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetLeftHandPosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::LeftHandPosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetRightHandPosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::RightHandPosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetRightForeArmPosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::RightForeArmPosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

Vector3 GetLeftForeArmPosition(void* player) {
    void* ITF = *(void**)((uintptr_t)player + Offsets::LeftForeArmPosition);
    void* TF = get_transformNode(ITF);
    return get_position(TF);
}

static Vector3 CameraMain(void* player) {
    void* tf = *(void**)((uintptr_t)player + Offsets::CameraMain);
    return get_position(tf);
}

Vector3 getPosition(void *transform) {
    return get_position(Component_GetTransform(transform));
}   

static Vector3 GetForward(void* player) {
    static Vector3 (*func)(void*) = (Vector3 (*)(void*))getRealOffset(Offsets::GetForward);
    return player ? func(player) : Vector3();
}

bool isFov(Vector3 vec1, Vector3 vec2, float diameter) {
    int x = vec1.x;
    int y = vec1.y;

    int x0 = vec2.x;
    int y0 = vec2.y;

    float radius = diameter / 2.0f; // Tính toán bán kính từ đường kính

    if ((pow(x - x0, 2) + pow(y - y0, 2)) <= pow(radius, 2)) {
        return true;
    } else {
        return false;
    }
}

Vector3 GetPlayerLocation(void* player) {
    Vector3 location;
    location = get_position(get_transform(player));
    return location;
}

bool IsClientBot(void* player) {
    return *(bool*)((uintptr_t)player + Offsets::IsClientBot);
}

bool IsAvatar(void* player) {
    return *(bool*)((uintptr_t)player + Offsets::IsAvatarInit);
}

bool ShouldIgnoreEnemy(void* enemy) {
    if (!enemy) return true;
    if (IgnoreBots && IsClientBot(enemy)) return true;
    if (IgnoreKnocked && get_IsDieing(enemy)) return true;
    if (get_HP(enemy) <= 0) return true;
    return false;
}

std::vector<void*> players;
void clearPlayers() {
    std::vector<void*> validPlayers;

    for (auto player : players) {
        if (!player) continue;
        if (!get_isLiving(player)) continue;
        if (get_HP(player) <= 0) continue;
        if (ShouldIgnoreEnemy(player)) continue;

        validPlayers.push_back(player);
    }

    players = validPlayers;
}


bool playerFind(void* pl) {
    if (pl != NULL) {
        for (int i = 0; i < players.size(); i++) {
            if (pl == players[i]) return true;
        }
    }
    return false;
}

static void* Player_GetHeadCollider(void* player) {
    typedef void* (*tPlayer_GetHeadCollider)(void*);
    static tPlayer_GetHeadCollider fn = (tPlayer_GetHeadCollider)getRealOffset(Offsets::Player_GetHeadCollider);
    return fn ? fn(player) : nullptr;
}

static Vector3 Transform_GetPosition(void* player) {
    typedef void (*tTransform_GetPosition)(void*, Vector3*);
    static tTransform_GetPosition fn = (tTransform_GetPosition)getRealOffset(Offsets::Transform_GetPosition);

    Vector3 out = Vector3::Zero();
    if (fn && player)
        fn(player, &out);
    return out;
}

static void* GetTransform(void* player) {
    if (!player) return nullptr;

    typedef void* (*tGetTransform)(void*);
    static tGetTransform fn = (tGetTransform)getRealOffset(Offsets::Component_GetTransform);
    return fn ? fn(player) : nullptr;
}

static void* GetAnimator(void* player) {
    if (!player) return nullptr;

    typedef void* (*tGetAnimator)(void*);
    static tGetAnimator fn = (tGetAnimator)getRealOffset(Offsets::GetAnimator);
    return fn ? fn(player) : nullptr;
}

static bool Physics_Raycast(Vector3 camLocation, Vector3 headLocation, unsigned int LayerID, void* collider) {
    typedef bool (*tPhysics_Raycast)(Vector3, Vector3, unsigned int, void*);
    static tPhysics_Raycast fn = (tPhysics_Raycast)getRealOffset(Offsets::Physics_Raycast);
    return fn ? fn(camLocation, headLocation, LayerID, collider) : false;
}

bool IsVisible(void* player) {
    if (!player) return false;

    void* hitObj = nullptr;
    Vector3 cameraLocation = Transform_GetPosition(Component_GetTransform(Camera_main()));
    Vector3 headLocation = Transform_GetPosition(Component_GetTransform(Player_GetHeadCollider(player)));

    if (Physics_Raycast(cameraLocation, headLocation, 12, &hitObj)) {
        void* expectedCollider = Player_GetHeadCollider(player);
        return hitObj == expectedCollider;
    }

    return true;
}

bool IsWithinFOV(float x, float y, float centerX, float centerY, float fovRadius) {
    float dx = x - centerX;
    float dy = y - centerY;
    return (dx * dx + dy * dy) <= (fovRadius * fovRadius);
}

Quaternion GetRotationToLocation(Vector3 targetLocation, float y_bias, Vector3 myLoc) {
    Vector3 direction = (targetLocation + Vector3(0, y_bias, 0)) - myLoc;
    return Quaternion::LookRotation(direction, Vector3::Up());
}

static void set_aim(void* player, Quaternion look) {
    typedef void (*tSetAim)(void*, Quaternion);
    static tSetAim fn = (tSetAim)getRealOffset(Offsets::set_aim);
    if (fn && player)
        fn(player, look);
}

void* targetEnemy = nullptr;
static float lastTargetChangeTime = 0.0f;

bool IsTargetInPlayerView(void* player, void* target) {
    Vector3 playerForward = GetForward(Component_GetTransform(Camera_main())); 
    Vector3 playerToTarget = Vector3::Normalized(GetHeadPosition(target) - CameraMain(player));
    float angle = RAD2DEG(acos(Vector3::Dot(playerForward, playerToTarget)));

    return angle <= AimbotFOV / 6.0f;
}

struct BoneMovementTracker {
    Vector3 lastHip;
    int framesMoved = 0;
};

static std::unordered_map<void*, BoneMovementTracker> boneHistory;

std::vector<void*> GetEnemies(void* match) {
    std::vector<void*> enemies;

    if (!match) return enemies;

    void* localPlayer = GetLocalPlayer(match);
    if (!localPlayer) return enemies;

    Dictionary<uint8_t*, void**>* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + Offsets::MatchPlayers);
    if (!players || players->getNumValues() == 0) return enemies;

    for (int i = 0; i < players->getNumValues(); ++i) {
        void* player = players->getValues()[i];
        if (!player || player == localPlayer) continue;

        if (IsTeammate(player)) continue;
        if (!get_main()) continue;
        if (!IsAvatar(player)) continue; 
        if (get_maxHP(player) <= 0 || get_HP(player) <= 0) continue;
        if (!get_isLiving(player)) continue;
        if (!GetTransform(player)) continue;
        if (!GetAnimator(player)) continue;

        Vector3 pos = GetPlayerLocation(player);
        if ((pos.x == 0 && pos.y == 0 && pos.z == 0) ||
            !std::isfinite(pos.x) || !std::isfinite(pos.y) || !std::isfinite(pos.z)) continue;
        if (fabs(pos.x) > 10000 || fabs(pos.y) > 10000 || fabs(pos.z) > 10000) continue;

        Vector3 localPos = GetPlayerLocation(localPlayer);
        float distance = Vector3::Distance(pos, localPos);
        if (distance > 150.0f) continue;

        Vector3 currentHip = GetHipPosition(player);
        BoneMovementTracker& tracker = boneHistory[player];

        float delta = Vector3::Distance(currentHip, tracker.lastHip);

        if (delta >= 0.2f) {
            tracker.framesMoved++;
            tracker.lastHip = currentHip;
        }

        if (tracker.framesMoved < 3) continue;

        enemies.push_back(player);
    }

    return enemies;
}

void ClearBoneHistory() {
    boneHistory.clear();
}

void DrawText2(ImFont * _espFont, float fontSize, ImVec2 position, ImColor Color, const char *text, ImColor colorFilled)
{
    ImGui::GetBackgroundDrawList()->AddRectFilled(ImVec2(position.x - 3, position.y - 3), 
                                                  ImVec2(position.x + _espFont->CalcTextSizeA(fontSize, MAXFLOAT, 0.0f, text).x + 3, 
                                                         position.y + 12), colorFilled, 0, 0);
    ImDrawList* draw_list = ImGui::GetForegroundDrawList();
    draw_list->AddText(NULL, fontSize, position, Color, text);
}

void DrawEsp() {
    ImDrawList* drawList = ImGui::GetBackgroundDrawList();

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    ImVec2 screenCenter(screenWidth / 2.0f, screenHeight / 2.0f);

    void* CurrentMatch = Curent_Match();
    void* LocalPlayer = GetLocalPlayer(CurrentMatch);
    void* Camera = Camera_main();
    void* mainCamera = get_main();

    if (!CurrentMatch) {
        ClearBoneHistory();
    }

    if (!LocalPlayer || !Camera || !mainCamera) {
        players.clear();
        targetEnemy = nullptr;
        return;
    }

    std::vector<void*> currentPlayers = GetEnemies(CurrentMatch);
    if (currentPlayers.empty()) return;

    for (void* player : currentPlayers) {
        if (!player || !get_main() || IsTeammate(player)) continue;

        Vector3 headPos3D = GetPlayerLocation(player) + Vector3(0, 1.5f, 0);
        Vector3 footPos3D = GetPlayerLocation(player) + Vector3(0, -0.15f, 0);

        bool onScreenHead = false;
        bool onScreenFoot = false;
        ImVec2 headScreen = world2screen_c(headPos3D, onScreenHead);
        ImVec2 footScreen = world2screen_c(footPos3D, onScreenFoot);
        if (!onScreenHead || !onScreenFoot) continue;

        float boxHeight = fabs(headScreen.y - footScreen.y);
        float boxWidth = boxHeight * 0.6f;
        if (boxHeight < 2.0f || boxHeight > 2000.0f) continue;

        Vector3 playerLoc = GetPlayerLocation(player);
        Vector3 cameraLoc = GetPlayerLocation(get_main());
        float distance = Vector3::Distance(playerLoc, cameraLoc);
        if (distance > 150.0f) continue;

        ImVec2 topLeft(footScreen.x - boxWidth / 2.0f, headScreen.y);
        ImVec2 bottomRight(footScreen.x + boxWidth / 2.0f, footScreen.y);

        ImVec2 screenTopCenter(screenWidth / 2.0f, 0.0f);
        ImVec2 boxTopCenter((topLeft.x + bottomRight.x) / 2.0f, topLeft.y);
        ImColor lineColor = (targetEnemy && targetEnemy == player && IsVisible(player)) ? ImColor(0, 255, 0) : ImColor(255, 255, 255);

        if (ESPLine) drawList->AddLine(screenTopCenter, boxTopCenter, lineColor, 0.9f);
        if (ESPBox) drawList->AddRect(topLeft, bottomRight, lineColor, 0.0f, 0, 0.7f);

        if (get_isLiving(player)) {
            int health = get_HP(player);
            int maxhp = get_maxHP(player);

            float boxTopY = topLeft.y;
            float containerYOffset = 6.0f;
            float containerY = boxTopY - 5.0f - 10.0f - containerYOffset;
            float boxCenterX = (topLeft.x + bottomRight.x) / 2.0f;

            ImVec2 HPBarCenter(boxCenterX, containerY);
            float HPBarWidth = 70.0f;
            float HPBarHeight = 4.5f;
            float rounding = HPBarHeight / 2.0f;

            ImVec2 HPBarTopLeft(HPBarCenter.x - HPBarWidth / 2, HPBarCenter.y - HPBarHeight / 2);
            ImVec2 HPBarBottomRight = HPBarTopLeft;
            HPBarBottomRight.x += (HPBarWidth * health / maxhp);
            HPBarBottomRight.y += HPBarHeight;

            ImColor healthColor;
            if (get_IsDieing(player)) {
                healthColor = ImColor(255, 0, 0);
            } else {
                healthColor = (health >= 140) ? ImColor(0, 255, 0) :
                              (health >= 80) ? ImColor(255, 255, 0) : ImColor(255, 0, 0);
            }

            if (ESPHealth) {
                drawList->AddRectFilled(ImVec2(HPBarCenter.x - HPBarWidth / 2, HPBarCenter.y - HPBarHeight / 2),
                                        ImVec2(HPBarCenter.x + HPBarWidth / 2, HPBarCenter.y + HPBarHeight / 2),
                                        ImColor(0, 0, 0, 110), rounding);
                drawList->AddRectFilled(HPBarTopLeft, HPBarBottomRight, healthColor, rounding);
                for (int i = 0; i < 3; ++i) {
                    float segStart = HPBarTopLeft.x + i * (HPBarWidth / 3.0f);
                    float segEnd = segStart + (HPBarWidth / 3.0f);
                    drawList->AddRect(ImVec2(segStart, HPBarTopLeft.y),
                                      ImVec2(segEnd, HPBarTopLeft.y + HPBarHeight),
                                      ImColor(0, 0, 0), rounding, ImDrawCornerFlags_All, 0.9f);
                }
            }

            if (ESPName) {
                std::string nickname = IsClientBot(player) ? "BOT" : getPlayerNickname(player);
                float fontScale = 0.40f;
                float textSizeY = ImGui::GetFontSize() * fontScale;
                ImVec2 textSize = ImGui::CalcTextSize(nickname.c_str()) * fontScale;
                float nameY = HPBarCenter.y + HPBarHeight / 2 + 3.0f;
                ImVec2 namePosition(boxCenterX - textSize.x / 2, nameY);
                ImVec2 bgMin(boxCenterX - HPBarWidth / 2, namePosition.y - 2);
                ImVec2 bgMax(boxCenterX + HPBarWidth / 2, namePosition.y + textSize.y + 3);
                float cutSize = 4.0f;

                ImVec2 points[6] = {
                    ImVec2(bgMin.x + cutSize, bgMin.y),
                    ImVec2(bgMax.x, bgMin.y),
                    ImVec2(bgMax.x, bgMax.y - cutSize),
                    ImVec2(bgMax.x - cutSize, bgMax.y),
                    ImVec2(bgMin.x, bgMax.y),
                    ImVec2(bgMin.x, bgMin.y + cutSize)
                };

                drawList->AddConvexPolyFilled(points, 6, ImColor(6, 9, 14, 255));

                ImColor lineCol = ImColor(1.0f, 0.5f, 1.0f, 1.0f);
                if (panelAccentColor) {
                    CGFloat r, g, b, a;
                    if ([panelAccentColor getRed:&r green:&g blue:&b alpha:&a]) {
                        lineCol = ImColor((float)r, (float)g, (float)b, (float)a);
                    }
                }

                drawList->AddLine(ImVec2(bgMin.x, bgMax.y), ImVec2(bgMax.x - cutSize, bgMax.y), lineCol, 1.0f);
                drawList->AddLine(ImVec2(bgMax.x - cutSize, bgMax.y), ImVec2(bgMax.x, bgMax.y - cutSize), lineCol, 1.0f);
                drawList->AddText(ImGui::GetFont(), textSizeY, namePosition, ImColor(179, 179, 179, 255), nickname.c_str());
            }

            if (ESPDistance) {
                char distanceText[32];
                sprintf(distanceText, "%.0f m", distance);
                ImVec2 distSize = ImGui::CalcTextSize(distanceText) * 0.45f;
                float distY = HPBarCenter.y - distSize.y - 2.0f;
                float distX = HPBarCenter.x - HPBarWidth / 2 + 2.0f;
                ImVec2 distPos(distX, distY);

                ImColor distColor = (distance <= 10.0f) ? ImColor(255, 0, 0) :
                                    (distance <= 20.0f) ? ImColor(255, 128, 0) :
                                    (distance <= 30.0f) ? ImColor(255, 255, 0) : ImColor(0, 255, 0);
                drawList->AddText(ImGui::GetFont(), ImGui::GetFontSize() * 0.45f, distPos, distColor, distanceText);
            }

            if (ESPSkeleton) {
                Vector3 head = GetHeadPosition(player);
                Vector3 hip = GetHipPosition(player);
                Vector3 neck = head - Vector3(0, 0.15f, 0);
                Vector3 leftShoulder = GetLeftShoulderPosition(player);
                Vector3 rightShoulder = GetRightShoulderPosition(player);
                Vector3 leftHand = GetLeftHandPosition(player);
                Vector3 rightHand = GetRightHandPosition(player);
                Vector3 leftForeArm = GetLeftForeArmPosition(player);
                Vector3 rightForeArm = GetRightForeArmPosition(player);
                Vector3 leftAnkle = GetLeftAnklePosition(player);
                Vector3 rightAnkle = GetRightAnklePosition(player);
                Vector3 leftToe = GetLeftToePosition(player);
                Vector3 rightToe = GetRightToePosition(player);

                CGFloat r = 1, g = 1, b = 1, a = 1;
                if (panelAccentColor && [panelAccentColor getRed:&r green:&g blue:&b alpha:&a]) {
                }
                ImColor skeletonColor = ImColor((float)r, (float)g, (float)b, (float)a);

                ImVec2 screenHead = world2screen_i(head);
                ImVec2 screenNeck = world2screen_i(neck);
                ImVec2 screenHip = world2screen_i(hip);
                ImVec2 screenLeftShoulder = world2screen_i(leftShoulder);
                ImVec2 screenRightShoulder = world2screen_i(rightShoulder);
                ImVec2 screenLeftHand = world2screen_i(leftHand);
                ImVec2 screenRightHand = world2screen_i(rightHand);
                ImVec2 screenLeftForeArm = world2screen_i(leftForeArm);
                ImVec2 screenRightForeArm = world2screen_i(rightForeArm);
                ImVec2 screenLeftAnkle = world2screen_i(leftAnkle);
                ImVec2 screenRightAnkle = world2screen_i(rightAnkle);
                ImVec2 screenLeftToe = world2screen_i(leftToe);
                ImVec2 screenRightToe = world2screen_i(rightToe);

                drawList->AddLine(screenNeck, screenHip, skeletonColor, 1.0f);
                drawList->AddLine(screenNeck, screenLeftShoulder, skeletonColor, 1.0f);
                drawList->AddLine(screenNeck, screenRightShoulder, skeletonColor, 1.0f);
                drawList->AddLine(screenLeftShoulder, screenLeftForeArm, skeletonColor, 1.0f);
                drawList->AddLine(screenRightShoulder, screenRightForeArm, skeletonColor, 1.0f);
                drawList->AddLine(screenLeftForeArm, screenLeftHand, skeletonColor, 1.0f);
                drawList->AddLine(screenRightForeArm, screenRightHand, skeletonColor, 1.0f);
                drawList->AddLine(screenHip, screenLeftAnkle, skeletonColor, 1.0f);
                drawList->AddLine(screenHip, screenRightAnkle, skeletonColor, 1.0f);
                drawList->AddLine(screenLeftAnkle, screenLeftToe, skeletonColor, 1.0f);
                drawList->AddLine(screenRightAnkle, screenRightToe, skeletonColor, 1.0f);
            }
        }
    }
}

void AimbotRun() {
    ImDrawList* drawList = ImGui::GetBackgroundDrawList();

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    ImVec2 screenCenter(screenWidth / 2.0f, screenHeight / 2.0f);
    Vector2 vecScreenCenter(screenCenter.x, screenCenter.y); 

    void* CurrentMatch = Curent_Match();
    if (!CurrentMatch) {
        ClearBoneHistory();
        return;
    }

    void* LocalPlayer = GetLocalPlayer(CurrentMatch);
    void* Camera = Camera_main();

    if (!LocalPlayer || !Camera) {
        targetEnemy = nullptr;
        ClearBoneHistory();
        return;
    }

    std::vector<void*> currentPlayers = GetEnemies(CurrentMatch);
    if (currentPlayers.empty()) return;

    float closestDistance = FLT_MAX;
    void* closestEnemy = nullptr;
    float switchThreshold = 5.0f;

    if (targetEnemy && !ShouldIgnoreEnemy(targetEnemy) && !IsTeammate(targetEnemy)) {
        if (OnlyVisibleEnemies && !IsVisible(targetEnemy)) {
            targetEnemy = nullptr;
        } else {
            Vector3 targetPos = (AimTarget == 0) ? GetHeadPosition(targetEnemy) :
                                 (AimTarget == 1) ? (GetHeadPosition(targetEnemy) - Vector3(0, 0.15f, 0)) :
                                                    GetHipPosition(targetEnemy);
            bool onScreen = false;
            ImVec2 screenPos = world2screen_c(targetPos, onScreen);
            Vector2 vecScreenPos(screenPos.x, screenPos.y);

            float dist2D = Vector2::Distance(vecScreenCenter, vecScreenPos);

            if (onScreen && dist2D <= AimbotFOV) {
                closestEnemy = targetEnemy;
                closestDistance = (AimMode == 0) ?
                    Vector3::Distance(targetPos, CameraMain(LocalPlayer)) :
                    dist2D;
            }
        }
    }

    for (void* enemy : currentPlayers) {
        if (!enemy || IsTeammate(enemy) || ShouldIgnoreEnemy(enemy)) continue;
        if (OnlyVisibleEnemies && !IsVisible(enemy)) continue;
        if (!IsTargetInPlayerView(LocalPlayer, enemy)) continue;

        Vector3 targetPos = (AimTarget == 0) ? GetHeadPosition(enemy) :
                             (AimTarget == 1) ? (GetHeadPosition(enemy) - Vector3(0, 0.15f, 0)) :
                                                GetHipPosition(enemy);

        bool onScreen = false;
        ImVec2 screenPos = world2screen_c(targetPos, onScreen);
        if (!onScreen) continue;

        Vector2 vecScreenPos(screenPos.x, screenPos.y);
        float dist2D = Vector2::Distance(vecScreenCenter, vecScreenPos);
        if (dist2D > AimbotFOV) continue;

        float dist = (AimMode == 0) ?
            Vector3::Distance(targetPos, CameraMain(LocalPlayer)) :
            dist2D;

        if (dist + switchThreshold < closestDistance) {
            closestDistance = dist;
            closestEnemy = enemy;
        }
    }

    if (closestEnemy) {
        targetEnemy = closestEnemy;
        Vector3 targetPos = (AimTarget == 0) ? GetHeadPosition(closestEnemy) :
                             (AimTarget == 1) ? (GetHeadPosition(closestEnemy) - Vector3(0, 0.15f, 0)) :
                                                GetHipPosition(closestEnemy);

        Quaternion aimRot = GetRotationToLocation(targetPos, 0.0f, CameraMain(LocalPlayer));
        Quaternion currentRot = GetRotation(Component_GetTransform(LocalPlayer));
        Quaternion finalRot = Quaternion::Lerp(currentRot, aimRot, AimSpeed);

        bool scoped = get_IsSighting(LocalPlayer);
        bool firing = get_IsFiring(LocalPlayer);

        if (AimWhen == 0 || (AimWhen == 1 && firing) || (AimWhen == 2 && scoped)) {
            set_aim(LocalPlayer, finalRot);
        }
    } else {
        targetEnemy = nullptr;
    }
}

#endif