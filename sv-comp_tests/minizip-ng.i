int mz_path_resolve(const char *path, char *output, int max_output) {
  const char *source = path;
  const char *check;
  char *target = output;
  if (max_output <= 0)
    return -1;
  while (*source != 0 && max_output > 1) {
    check = source;
    if ((*check == '\\') || (*check == '/'))
      check += 1;
    if ((source == path) || (target == output) || (check != source)) {
      if (*check == '.') {
        check += 1;
        if (*check == '.') {
          check += 1;
          if ((*check == 0) || (*check == '\\' || *check == '/')) {
            source += (check - source);
            if (target != output) {
              target -= 1;
              do {
                if ((*target == '\\') || (*target == '/'))
                  break;
                target -= 1;
                max_output += 1;
              } while (target > output);
            }
            *target = 0;
            continue;
          }
        }
      }
    }
    *target = *source;
    source += 1;
    target += 1;
    max_output -= 1;
  }
  *target = 0;
  return 0;
}
int main() {
  char output[256];
  mz_path_resolve("x/../y", output, sizeof(output));
}
