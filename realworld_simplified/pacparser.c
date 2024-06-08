// https://www.cvedetails.com/cve/CVE-2019-25078/
// extract of: src/pacparser.c

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

// -------------------------- COPIED --------------------------
// You must free the result if result is non-NULL.
char *str_replace(const char *orig, char *rep, char *with)
{
    char *result;  // the return string
    char *ins;     // the next insert point
    char *tmp;     // varies
    int count;     // number of replacements
    int len_front; // distance between rep and end of last rep
    int len_rep = strlen(rep);
    int len_with = strlen(with);

    // Get the count of replacements
    ins = orig;
    for (count = 0; (tmp = strstr(ins, rep)); ++count)
    {
        ins = tmp + len_rep;
    }

    tmp = result = malloc(strlen(orig) + (len_with - len_rep) * count + 1);

    // first time through the loop, all the variable are set correctly
    // from here on,
    //    tmp points to the end of the result string
    //    ins points to the next occurrence of rep in orig
    //    orig points to the remainder of orig after "end of rep"
    while (count--)
    {
        ins = strstr(orig, rep);
        len_front = ins - orig;
        tmp = strncpy(tmp, orig, len_front) + len_front;
        tmp = strcpy(tmp, with) + len_with;
        orig += len_front + len_rep; // move to next "end of rep"
    }

    // Copy the remaining string.
    strcpy(tmp, orig);
    return result;
}

int main(int argc, char *argv[])
{
    char host[] = "I am host";
    char url[] = "and I''''''''' am url";
    // URL-encode "'" as we use single quotes to stick the URL into a temporary script.
    char *sanitized_url = str_replace(url, "'", "%27");

    // char script[32 + strlen(url) + strlen(host)];
    char *script = (char *)malloc(32 + strlen(url) + strlen(host));
    script[0] = '\0';
    strcat(script, "findProxyForURL('");
    strcat(script, sanitized_url);
    strcat(script, "', '");
    strcat(script, host);
    strcat(script, "')");
    printf("%s\n", script);
    free(script);
    return 0;
}
