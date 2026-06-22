#include <stdlib.h>
#include "base64.h"

static const BYTE charset[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

BYTE revchar(char ch) {
    if (ch >= 'A' && ch <= 'Z') return ch - 'A';
    if (ch >= 'a' && ch <= 'z') return ch - 'a' + 26;
    if (ch >= '0' && ch <= '9') return ch - '0' + 52;
    if (ch == '+') return 62;
    if (ch == '/') return 63;
    return 0; // trata '=' como 0
}

size_t base64_encode(const BYTE in[], BYTE out[], size_t len, int newline_flag) {
    size_t idx, idx2, blks, left_over;

    blks = len / 3;
    left_over = len % 3;

    if (out == NULL) {
        idx2 = blks * 4;
        if (left_over)
            idx2 += 4;
        return idx2; // Retorna tamanho necessário sem quebras de linha
    }

    idx2 = 0;
    for (idx = 0; idx < len; idx += 3, idx2 += 4) {
        out[idx2] = charset[in[idx] >> 2];
        out[idx2 + 1] = charset[((in[idx] & 0x03) << 4) | (idx + 1 < len ? in[idx + 1] >> 4 : 0)];
        out[idx2 + 2] = (idx + 1 < len) ? charset[((in[idx + 1] & 0x0f) << 2) | (idx + 2 < len ? in[idx + 2] >> 6 : 0)] : '=';
        out[idx2 + 3] = (idx + 2 < len) ? charset[in[idx + 2] & 0x3F] : '=';
    }
    out[idx2] = '\0'; // Garante terminação nula
    return idx2;
}

size_t base64_decode(const BYTE in[], BYTE out[], size_t len) {
    if (len % 4 != 0) return 0; // base64 precisa ser múltiplo de 4

    size_t idx = 0;
    for (size_t i = 0; i < len; i += 4) {
        BYTE c1 = revchar(in[i]);
        BYTE c2 = revchar(in[i + 1]);
        BYTE c3 = in[i + 2] == '=' ? 0 : revchar(in[i + 2]);
        BYTE c4 = in[i + 3] == '=' ? 0 : revchar(in[i + 3]);

        out[idx++] = (c1 << 2) | (c2 >> 4);
        if (in[i + 2] != '=') out[idx++] = ((c2 & 0xF) << 4) | (c3 >> 2);
        if (in[i + 3] != '=') out[idx++] = ((c3 & 0x3) << 6) | c4;
    }

    return idx;
}