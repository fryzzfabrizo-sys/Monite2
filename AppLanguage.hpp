#pragma once
#include <string>

enum AppLanguage {
    AppLanguageEnglish,
    AppLanguagePortuguese,
    AppLanguageVietnamese,
    AppLanguageSpanish
};

extern AppLanguage currentLanguage;

std::string LocalizedString(const std::string& key);
