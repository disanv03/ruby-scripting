#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define MAX_EXT_LEN 11
#define MAX_MT_LEN 51
#define MAX_FNAME_LEN 501

typedef struct {
    char ext[MAX_EXT_LEN];
    char mt[MAX_MT_LEN];
} mime_t;

int main() {
    int n, q, i;
    scanf("%d%d", &n, &q);
    
    mime_t mimes[n];
    for (i = 0; i < n; i++) {
        scanf("%s%s", mimes[i].ext, mimes[i].mt);
        // Convert the extension to lowercase
        for (int j = 0; mimes[i].ext[j]; j++) {
            mimes[i].ext[j] = tolower((unsigned char) mimes[i].ext[j]);
        }
    }
    
    char fname[MAX_FNAME_LEN];
    for (i = 0; i < q; i++) {
        scanf("%s", fname);
        char *dot = strrchr(fname, '.');
        
        if (dot == NULL) {
            printf("UNKNOWN\n");
            continue;
        }
        
        dot++;  // skip the dot
        int j;
        for (j = 0; dot[j]; j++) {
            dot[j] = tolower((unsigned char) dot[j]); // ensure arguement is valid
        }

        int found = 0;
        for (j = 0; j < n; j++) {
            if (strcmp(dot, mimes[j].ext) == 0) {
                printf("%s\n", mimes[j].mt);
                found = 1;
                break;
            }
        }
        
        if (!found) {
            printf("UNKNOWN\n");
        }
    }
    
    return 0;
}