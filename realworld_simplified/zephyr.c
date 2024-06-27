// https://www.cvedetails.com/cve/CVE-2023-4260/
// repository: https://github.com/zephyrproject-rtos/zephyr
// commit: 3521c95
// extract of: subsys/fs/fuse_fs_access.c (function: fuse_fs_access_readdir)

#include <stdio.h>

#define PATH_MAX 11

void fuse_fs_access_readdir(const char *path)
{
    char mount_path[PATH_MAX];
    sprintf(mount_path, "%s/", path); // Problem: if path is 11 characters long (with null terminator) then it will be one byte overflow due to '/' character
}

int main(int argc, char *argv[])
{
    char path[PATH_MAX] = "0123456789";
    fuse_fs_access_readdir(path);
}
