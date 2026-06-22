#pragma once
#define OFFSETS_LOADED
#include <cstdint>

struct Offsets {
    static uintptr_t get_main;
    static uintptr_t get_transform;
    static uintptr_t get_transformNode;
    static uintptr_t WorldToViewpoint;
    static uintptr_t get_position;
    static uintptr_t Team;
    static uintptr_t Local;
    static uintptr_t get_HP;
    static uintptr_t get_maxHP;
    static uintptr_t get_IsDieing;
    static uintptr_t get_IsVisible;
    static uintptr_t GetLocalPlayer;
    static uintptr_t CurrentMatch;
    static uintptr_t Camera_main;
    static uintptr_t GetRotation;
    static uintptr_t get_isLocalTeam;
    static uintptr_t get_IsSighting;
    static uintptr_t get_IsFiring;
    static uintptr_t WorldToScreenPoint;
    static uintptr_t GetHeadPositions;
    static uintptr_t Component_GetTransform;
    static uintptr_t GetForward;
    static uintptr_t Player_GetHeadCollider;
    static uintptr_t Transform_GetPosition;
    static uintptr_t GetAnimator;
    static uintptr_t Physics_Raycast;
    static uintptr_t set_aim;
    static uintptr_t HipPosition;
    static uintptr_t LeftShoulderPosition;
    static uintptr_t RightShoulderPosition;
    static uintptr_t LeftAnklePosition;
    static uintptr_t RightAnklePosition;
    static uintptr_t LeftToePosition;
    static uintptr_t RightToePosition;
    static uintptr_t LeftHandPosition;
    static uintptr_t RightHandPosition;
    static uintptr_t RightForeArmPosition;
    static uintptr_t LeftForeArmPosition;
    static uintptr_t CameraMain;
    static uintptr_t IsClientBot;
    static uintptr_t IsAvatarInit;
    static uintptr_t MatchPlayers;
};