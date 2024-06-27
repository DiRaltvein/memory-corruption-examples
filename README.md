### Framework how realworld memory corruption vulnerabilities were handled:

- clone latest version of project with known vulnerability.
- checkout to the version right before the vulnerability was fixed or to a version known to contain a vulnerability.
- find the vulnerability and extract the vulnerable logic to create a small test case.
- run different static code analyzers on the initial file with vulnerability as well as on the extracted vulnerability.
- document ammount of errors/warning/notes that the static code analyzer has generated as well as wheather the vulnerability was found by the static code analyzer.
- In addition also document wheather notice about vulnearbility was within first 5 notifications outputted to the console by the static code analyzer.

All known vulnerabilities are found by uzing open database of common vulnerabilities and exploits known as <a href="https://www.cvedetails.com/">CVEdetails.com</a>. CVEdetails allows to filter vulnerabilities by year and vulnerability type and filters used in this work are 'Overflow/Memory corruption' for vulnerability type and 2022 for the year. The vulnerabilities were also sorted by the CVSS Score. In addition, vulnerabilities were also filtered further manually and and vulnerabilities that did not have link to github were ignored.

Extracted vulnerability logic means that the vulnerability that was present in a project gets extracted into a sepparate file. While extracting the business logic gets removed and vulnerability gets simplified as much as possible to make a test case out of it.

Commands and static code analyzers that were used:

- clang/clang++ --analyze -ferror-limit=0 \<filename>
- clang-tidy \<filename>
- cppcheck --enable=all --suppress=missingIncludeSystem --suppress=unmatchedSuppression --force \<filename>
- symbiotic --prp=memsafety -ferror-limit=0 \<filename>

### Versions of static code analyzers used

| Static code analyzer | version |
| :------------------: | :-----: |
|         LLVM         | 19.0.0  |
|       cppcheck       |   2.7   |
|      symbiotic       |  8.0.0  |

- As clang/clang++ and clang-tidy are part of LLVM then the version of LLVM is specified. Also clang/clang++, clang-tidy and symbiotic were not downloaded as executables but were compiled from theirs repositories.

### Result table

The result table contains each analyzed vulnerability with the analysis results. For each vulnerability there is 2 rows in a table. First row contains information about the vulnerability location and the project where it was found as well as the results from static code analyzing tools. Static code analyzers were executed on a single file that contained a vulnerability and in each cell of static code analyzer results are documented in a format of

- \<errors number>/\<warnings number>/\<info notices number> (\<vulnerability detected>/\<vulnerability notice within first 5 notifications>)

Important to note that errors/warnings/notes were counted only that are realted to the code and not to the execution of the static code analyzer or any other meta information. For instance, notes as:

- INFO: Total slicing time: 0.009580373764038086
- INFO: Starting verification
- NOTE: In the future, the result is going to be reported in SV-COMP format only with --report=sv-comp switch
  and similar were not counted into the total number of errors/warnings/notes outputted by the static code analyzer.

Second row in a table where in a CVE column 'Extracted' is specified stands for the simplified version of the vulnerability that was extraced into a separate file to make a test case out of it. This test case is once again analyzer in the exactly same way as the original file and the analysis results are documented in the table in an exactly the same way as the original file results.

If static code analyzer has ✖ instead of the results it measn that static code analyzer was for some reason unable to analyze the file.

|       CVE       | Project (url) | Commit (hash) | file length | clang/clang++ |    clang-tidy    |   cppcheck    |  symbiotic  |
| :-------------: | :-----------: | :-----------: | :---------: | :-----------: | :--------------: | :-----------: | :---------: |
|  CVE-2022-4603  |      ppp      |    fb3529c    |     534     | 0/20/0 (✖/✖)  |  0/36/463 (✖/✖)  |  1/0/4 (✖/✖)  |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |   0/0/0 (✖/✖)    |  0/0/0 (✖/✖)  | 1/0/0 (✓/✓) |
| CVE-2019-25078  |   pacparser   |    f013613    |     536     | 37/0/5 (✖/✖)  |   37/0/5 (✖/✖)   |  1/0/7 (✖/✖)  |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |  0/8/7 (✖/✖)\*   |  0/0/1 (✖/✖)  | 0/0/0 (✖/✖) |
|  CVE-2022-4202  |     gpac      |    faac2ce    |    6141     |  0/0/0 (✖/✖)  |  0/44/40 (✖/✖)   | 3/2/311 (✓/✖) |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |   0/0/0 (✖/✖)    |  1/0/2 (✓/✓)  | 0/0/0 (✖/✖) |
|  CVE-2024-0321  |     gpac      |    d2de8b5    |    4656     |  0/1/0 (✖/✖)  | 0/96/76 (✖/✖)\*  | 0/11/23 (✖/✖) |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |  0/2/2 (✖/✖)\*   |  0/0/0 (✖/✖)  | 1/0/0 (✓/✓) |
| CVE-2021-37778  |  gps-sdr-sim  |    d361b2c    |    2364     |  0/6/0 (✖/✖)  | 0/91/120 (✖/✖)\* | 0/0/29 (✖/✖)  | 0/0/0 (✖/✖) |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |  0/1/1 (✖/✖)\*   |  0/0/0 (✖/✖)  | 0/0/0 (✖/✖) |
| CVE-2022-29021  |   openrazer   |    9991fc6    |    1445     |  0/0/0 (✖/✖)  |   0/0/0 (✖/✖)    | 0/0/84 (✖/✖)  |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |  0/1/1 (✖/✖)\*   |  0/0/0 (✖/✖)  | 1/0/0 (✓/✓) |
| CVE-2022-31003  |   sofia-sip   |    5f18366    |    1943     |  0/0/0 (✖/✖)  |   0/3/3 (✖/✖)    | 0/1/19 (✖/✖)  |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |   0/1/1 (✖/✖)    |  0/0/0 (✖/✖)  | 0/0/0 (✖/✖) |
|  CVE-2023-4260  |    zephyr     |  14d88c6dc8b  |     544     |       -       |        -         |       -       |      -      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |  0/1/1 (✖/✖)\*   |  0/0/0 (✖/✖)  | 0/0/0 (✖/✖) |
| CVE-2014-125106 |    nanopb     |    d0466bd    |    1159     |  0/0/0 (✖/✖)  |   0/2/2 (✖/✖)    |  0/0/0 (✖/✖)  |      ✖      |
|    Extracted    |               |               |             |  0/0/0 (✖/✖)  |   0/0/0 (✖/✖)    |  0/0/0 (✖/✖)  | 0/0/0 (✖/✖) |
|     CVE-000     |               |               |             |       -       |        -         |       -       |      -      |
|    Extracted    |               |               |             |       -       |        -         |       -       |      -      |

Star next to result means that althrough static code analyzer was not able to detect the vulnerability it pointed out that insecure method is used and if resolved the vulnerability would also be fixed.

CppCheck:

- errors
  - portability problems
- warnings
- notes:
  - style notes
  - note
