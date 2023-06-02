#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LINE_SIZE 1024

int main() {
    char line[MAX_LINE_SIZE];

    while (fgets(line, sizeof(line), stdin) != NULL) {
        // remove newline character, "\O" is preferred as \n declare the end of the line to read
        line[strcspn(line, "\n")] = '\0';

        if (strcmp(line, "exit") == 0) {
            break;
        }

        char *chunk = strtok(line, " ");
        while (chunk != NULL) {
            int count = 0;
            char character = '\0';
            int len = strlen(chunk);
            
            if (strcmp(chunk, "nl") == 0) {
                printf("\n");
            } else if (len > 2 && (strcmp(&chunk[len-2], "sp") == 0 || 
                                   strcmp(&chunk[len-2], "bS") == 0 || 
                                   strcmp(&chunk[len-2], "sQ") == 0)) {
                // isolate count and character
                count = atoi(strndup(chunk, len - 2));
                if (strcmp(&chunk[len-2], "sp") == 0) {
                    character = ' ';
                } else if (strcmp(&chunk[len-2], "bS") == 0) {
                    character = '\\';
                } else if (strcmp(&chunk[len-2], "sQ") == 0) {
                    character = '\'';
                }
            } else {
                count = atoi(strndup(chunk, len - 1));
                character = chunk[len-1];
            }
            
            for(int i = 0; i < count; i++) {
                printf("%c", character);
            }

            chunk = strtok(NULL, " "); // call the next pointer , call NULL to
            // continue with the same string it was working on before, starting
            // where it left off
        }

        printf("\n");
    }

    return 0;
}

// 'strcspn' : "string span for complement"
// 'strndup' : "string n duplicate". duplicate max length 'n' given string
// 'atoi' : "ASCII to integer"
// 'strtok' : "string tokenize" used to split a string.
// 'fgets' : "file get string"
