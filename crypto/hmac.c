#include "hmac.h"
#include "sha256.h"
#include <string.h>

void hmac_sha256(const uint8_t *key, size_t key_len,
                 const uint8_t *data, size_t data_len,
                 uint8_t mac_out[32]) {
    uint8_t kopad[64], kipad[64], tempkey[32];

    if (key_len > 64) {
        SHA256_CTX tctx;
        sha256_init(&tctx);
        sha256_update(&tctx, key, key_len);
        sha256_final(&tctx, tempkey);
        key = tempkey;
        key_len = 32;
    }

    memset(kopad, 0x5c, 64);
    memset(kipad, 0x36, 64);
    for (size_t i = 0; i < key_len; i++) {
        kopad[i] ^= key[i];
        kipad[i] ^= key[i];
    }

    uint8_t inner_hash[32];
    SHA256_CTX ctx;
    sha256_init(&ctx);
    sha256_update(&ctx, kipad, 64);
    sha256_update(&ctx, data, data_len);
    sha256_final(&ctx, inner_hash);

    sha256_init(&ctx);
    sha256_update(&ctx, kopad, 64);
    sha256_update(&ctx, inner_hash, 32);
    sha256_final(&ctx, mac_out);
}