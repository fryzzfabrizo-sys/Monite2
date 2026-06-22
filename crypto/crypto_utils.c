#include <CommonCrypto/CommonCryptor.h>
#include <CommonCrypto/CommonHMAC.h>
#include "base64.h"
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

void generate_random_iv(uint8_t iv[16]) {
    arc4random_buf(iv, 16);
}

void generate_random_salt(uint8_t salt[16]) {
    arc4random_buf(salt, 16);
}

int encrypt_and_package(const uint8_t *plaintext, size_t plaintext_len, const uint8_t key[32],
                       char *out_base64, size_t *out_len) {
    // 1. Gerar salt e IV
    uint8_t salt[16], iv[16];
    generate_random_salt(salt);
    generate_random_iv(iv);

    // 2. Calcular tamanho com padding
    size_t block_size = 16;
    size_t padded_len = ((plaintext_len + block_size - 1) / block_size) * block_size;
    if (padded_len == plaintext_len) padded_len += block_size;

    // 3. Criptografar com AES-CBC e padding PKCS7
    uint8_t *cipher = malloc(padded_len);
    if (!cipher) return 0;

    size_t cipher_len = 0;
    CCCryptorStatus status = CCCrypt(kCCEncrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                     key, kCCKeySizeAES256, iv,
                                     plaintext, plaintext_len, cipher, padded_len, &cipher_len);
    if (status != kCCSuccess) {
        free(cipher);
        return 0;
    }

    // 4. Gerar HMAC (salt + iv + cipher)
    size_t mac_data_len = 16 + 16 + cipher_len;
    uint8_t *mac_data = malloc(mac_data_len);
    if (!mac_data) {
        free(cipher);
        return 0;
    }
    memcpy(mac_data, salt, 16);
    memcpy(mac_data + 16, iv, 16);
    memcpy(mac_data + 32, cipher, cipher_len);

    uint8_t mac[32];
    CCHmac(kCCHmacAlgSHA256, key, 32, mac_data, mac_data_len, mac);

    // 5. Montar pacote final: salt + iv + cipher + mac
    size_t total_len = mac_data_len + 32;
    uint8_t *final_buf = malloc(total_len);
    if (!final_buf) {
        free(cipher);
        free(mac_data);
        return 0;
    }
    memcpy(final_buf, mac_data, mac_data_len);
    memcpy(final_buf + mac_data_len, mac, 32);

    // 6. Codificar em Base64
    size_t base64_len = ((total_len + 2) / 3) * 4 + 1; // +1 para terminação nula
    if (*out_len < base64_len) {
        free(cipher);
        free(mac_data);
        free(final_buf);
        return 0; // Buffer de saída muito pequeno
    }
    base64_encode(final_buf, (BYTE *)out_base64, total_len, 0);
    *out_len = strlen(out_base64);

    // 7. Limpar memória
    free(cipher);
    free(mac_data);
    free(final_buf);
    return 1;
}

bool decrypt_and_validate(const uint8_t* base64Data, size_t base64Len, const uint8_t key[32], uint8_t* out, size_t* out_len) {
    if (!base64Data || !out || !out_len) {
        return false;
    }

    // 1. Base64 decode
    uint8_t decoded[2048];
    size_t decodedLen = base64_decode((const BYTE*)base64Data, decoded, base64Len);
    if (decodedLen <= 64) {
        return false;
    }

    // 2. Separate components
    const uint8_t* salt = decoded;
    const uint8_t* iv = salt + 16;
    const uint8_t* cipher = iv + 16;
    size_t cipher_len = decodedLen - 16 - 16 - 32;
    const uint8_t* mac = cipher + cipher_len;

    // 3. Verify HMAC
    uint8_t computed_mac[32];
    CCHmac(kCCHmacAlgSHA256, key, 32, decoded, 16 + 16 + cipher_len, computed_mac);
    if (memcmp(mac, computed_mac, 32) != 0) {
        return false;
    }

    // 4. Decrypt with AES-CBC
    size_t decrypted_buf_len = cipher_len + 16;
    uint8_t* decrypted = (uint8_t*)malloc(decrypted_buf_len);
    if (!decrypted) {
        return false;
    }

    size_t decrypted_len = 0;
    CCCryptorStatus status = CCCrypt(kCCDecrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                     key, 32, iv,
                                     cipher, cipher_len, decrypted, decrypted_buf_len, &decrypted_len);

    if (status != kCCSuccess) {
        free(decrypted);
        return false;
    }

    if (decrypted_len == 0 || decrypted_len > *out_len) {
        free(decrypted);
        return false;
    }

    // 5. Copy to output
    memcpy(out, decrypted, decrypted_len);
    *out_len = decrypted_len;
    free(decrypted);
    return true;
}