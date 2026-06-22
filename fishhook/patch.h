#pragma once
#include <string>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <CoreFoundation/CoreFoundation.h>

#ifdef __cplusplus
extern "C" {
#endif

bool getType(unsigned int data);
struct MemoryFileInfo;
MemoryFileInfo getBaseInfo();
MemoryFileInfo getMemoryFileInfo(const std::string& fileName);
void* get_image_header(const char* image_name, intptr_t* slide);
uintptr_t getAbsoluteAddress(const char* fileName, uintptr_t address);
bool vm(long long offset, unsigned int data);
uint64_t getRealOffset(uint64_t offset);

#ifdef __cplusplus
}
#endif
