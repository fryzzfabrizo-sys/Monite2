#ifndef CRYPTO_UTILS_H
#define CRYPTO_UTILS_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void generate_random_iv(uint8_t iv[16]);
void generate_random_salt(uint8_t salt[16]);

int encrypt_and_package(const uint8_t *plaintext, size_t plaintext_len, const uint8_t key[32],
                        char *out_base64, size_t *out_len);

                        bool decrypt_and_validate(const uint8_t* base64Data, size_t base64Len, const uint8_t key[32], uint8_t* out, size_t* out_len);

#ifdef __cplusplus
}
#endif

#endif