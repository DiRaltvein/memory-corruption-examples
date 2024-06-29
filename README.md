### Framework how realworld memory corruption vulnerabilities were handled:

- clone latest version of project with known vulnerability.
- checkout to the version right before the vulnerability was fixed or to a version known to contain a vulnerability.
- find the vulnerability and extract the vulnerable logic to create a small test case.
- run different static code analyzers on the initial file with vulnerability as well as on the extracted vulnerability.
- document ammount of errors/warning/notes that the static code analyzer has generated as well as some other data.

All known vulnerabilities were found by using an open database of common vulnerabilities and exploits known as <a href="https://www.cvedetails.com/">CVEdetails.com</a>. Vulnerabilities that did not have link to github were ignored.

Extracted vulnerability logic means that the vulnerability that was present in a project gets extracted into a sepparate file. While extracting the business logic gets removed and vulnerability gets simplified as much as possible to make a test case out of it.

Commands and static code analyzers that were used:

- clang/clang++ --analyze -ferror-limit=0 \<filename>
- clang-tidy \<filename>
- cppcheck --enable=all --suppress=missingIncludeSystem --suppress=unmatchedSuppression --force \<filename>
- symbiotic --prp=memsafety -ferror-limit=0 \<filename>
- ikos -f text --rm-db -a='\*' --entry-points=\<function> \<filename>

### Versions of static code analyzers used

| Static code analyzer | version |
| :------------------: | :-----: |
|     LLVM (Clang)     | 19.0.0  |
|       Cppcheck       |   2.7   |
|         ikos         |  3.3.0  |
|      symbiotic       |  8.0.0  |
|         GCC          | 13.2.0  |

### Result table

The result table contains each analyzed vulnerability with the analysis results. For each vulnerability there is 2 rows in a table. First row contains information about the vulnerability location and the project where it was found as well as the results from static code analyzing tools. Static code analyzers were executed on a single file that contained a vulnerability and in each cell of static code analyzer results are documented in a format of

- \<errors number>/\<warnings number>/\<info notices number> (\<vulnerability detected>/\<vulnerability notice within first 5 notifications>)

Important to note that errors/warnings/notes were counted only that are realted to the code and not to the execution of the static code analyzer or any other meta information. For instance, notes as:

- INFO: Total slicing time
- INFO: Starting verification
- INFO: total time

and similar were not counted into the total number of errors/warnings/notes outputted by the static code analyzer.

Second row in a table where in a CVE column 'Extracted' is specified stands for the simplified version of the vulnerability that was extraced into a separate file to make a test case out of it. This test case is once again analyzer in the exactly same way as the original file and the analysis results are documented in the table in an exactly the same way as the original file results.

If static code analyzer has ✖ instead of the results it means that static code analyzer was for some reason unable to analyze the file.

|       CVE       | Project (url) | Commit (hash) | file (function) | file length | clang/clang++ | clang-tidy | cppcheck | ikos | symbiotic |
| :-------------: | :-----------: | :-----------: | :-------------: | :---------: | :-----------: | :--------: | :------: | :--: | --------- |
|  CVE-2022-4603  |      ppp      |    fb3529c    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2019-25078  |   pacparser   |    f013613    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|  CVE-2022-4202  |     gpac      |    faac2ce    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|  CVE-2024-0321  |     gpac      |    d2de8b5    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2021-37778  |  gps-sdr-sim  |    d361b2c    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2022-29021  |   openrazer   |    9991fc6    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2022-31003  |   sofia-sip   |    5f18366    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|  CVE-2023-4260  |    zephyr     |  14d88c6dc8b  |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2014-125106 |    nanopb     |    d0466bd    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2021-32292  |    json-c     |    104b408    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
| CVE-2021-33304  |    picotcp    |    f336ead    |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|     CVE-000     |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |
|    Extracted    |               |               |        -        |      -      |       -       |     -      |    -     |  -   | -         |

Star next to result means that althrough static code analyzer was not able to detect the vulnerability it pointed out that insecure method is used and if resolved the vulnerability would also be fixed.

CppCheck:

- errors
  - error
  - portability
- warnings
  - warning
- notes:
  - style notes
  - information
  - performance

Ikos errors/warnings/notes generated during compilation by clang were not taken into account.
