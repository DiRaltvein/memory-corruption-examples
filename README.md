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
File length is last file row where at least some symbols are present.

|       CVE       | Project (url) | Commit (hash) |               file (function)                | file length |    clang     |  cppcheck  |     ikos     |   infer    | gcc        | symbiotic  |
| :-------------: | :-----------: | :-----------: | :------------------------------------------: | :---------: | :----------: | :--------: | :----------: | :--------: | ---------- | ---------- |
|  CVE-2022-4603  |      ppp      |    fb3529c    |             pppdump.c (dumpppp)              |     534     | 0/20/0(✖/✖)  | 0/0/0(✖/✖) | 0/39/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  0/2/0(✓/✓)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 1/0/0(✓/✓) |
| CVE-2019-25078  |   pacparser   |    f013613    |      pacparser.c (pacparser_find_proxy)      |     536     |  0/7/3(✖/✖)  | 1/0/0(✖/✖) | 0/11/0(✖/✖)  | 1/0/0(✓/✓) | 0/2/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) | 0/17/0(✓/✖)  | 1/0/0(✖/✖) | 0/4/2(✖/✖) | 0/0/0(✖/✖) |
|  CVE-2022-4202  |     gpac      |    faac2ce    |       lsr_dec.c (lsr_translate_coords)       |    6141     | 0/34/37(✖/✖) | 0/0/0(✖/✖) |  0/4/0(✖/✖)  | 9/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  1/0/0(✓/✓)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|  CVE-2024-0321  |     gpac      |    d2de8b5    |     load_text.c (gf_text_get_utf8_line)      |    4656     | 0/35/26(✖/✖) | 0/0/0(✖/✖) | 0/89/0(✓/✖)  | 3/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/1/0(✓/✓)  | 0/0/0(✖/✖) |  0/0/0(✖/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 1/0/0(✓/✓) |
| CVE-2021-37778  |  gps-sdr-sim  |    d361b2c    |               gpssim.c (main)                |    2364     | 0/22/19(✖/✖) | 0/0/0(✖/✖) |      ✖       | 6/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  1/1/0(✖/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
| CVE-2022-29021  |   openrazer   |    9991fc6    |           razerchromacommon.c (-)            |    1448     | 0/23/32(✖/✖) | 0/0/0(✖/✖) | 0/23/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/1/0(✓/✓)  | 0/0/0(✖/✖) |  2/0/0(✓/✓)  | 1/0/0(✓/✓) | 0/1/2(✓/✓) | 1/0/0(✓/✓) |
| CVE-2022-31003  |   sofia-sip   |    5f18366    |         sdp_parse.c (parse_message)          |    1943     |  0/4/2(✖/✖)  | 0/0/0(✖/✖) | 0/885/0(✖/✖) | 1/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  1/0/0(✓/✓)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|  CVE-2023-4260  |    zephyr     |  14d88c6dc8b  |  fuse_fs_access.c (fuse_fs_access_readdir)   |     544     |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  0/0/0(✖/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| CVE-2014-125106 |    nanopb     |    d0466bd    |         pb_decode.c (pb_dec_string)          |    1159     |  0/0/0(✖/✖)  | 0/0/0(✖/✖) | 0/79/0(✖/✖)  | 7/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  1/0/0(✓/✓)  | 1/0/0(✓/✓) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| CVE-2021-32292  |    json-c     |    56a89f9    |            json_parse.c (parseit)            |     188     |  0/0/0(✖/✖)  | 0/0/0(✖/✖) | 0/43/0(✖/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) |  0/8/0(✓/✓)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| CVE-2021-33304  |    picotcp    |    f336ead    | pico_fragments.c (pico_fragments_reassemble) |     589     |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |  0/1/0(✓/✓)  | 1/0/2(✓/✓) |  0/2/0(✓/✓)  | 2/0/0(✓/✓) | 0/1/0(✓/✓) | 1/0/0(✓/✓) |
| CVE-2022-28550  |     jhead     |    06e8d7a    |             jhead.c (DoCommand)              |    1814     |  0/7/0(✖/✖)  | 1/0/0(✖/✖) | 1/15/0(✖/✖)  | 2/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|    Extracted    |               |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖) | 0/14/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|     CVE-000     |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |
|    Extracted    |               |               |                      -                       |      -      |      -       |     -      |      -       |     -      | -          | -          |

Star next to result means that althrough static code analyzer was not able to detect the vulnerability it pointed out that insecure method is used and if resolved the vulnerability would also be fixed.

No cross Cross Translation Unit (CTU) analysis was performed because not all static code analyzers support it. because of that some errors are unnotices like CVE-2021-33304.

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
Also Ikos provices following classification for output notifications:

- \* (all)
- error
- warning
- safe
- unreachable

Ikos outputs a lot of unreachable notices that were not taken into account because they are false positives. Code is reachable and because of that unreachable notes were not taken into account when creating table.

CVE-2024-0321:

- ikos: memory access might be invalid, could not infer information about pointer 'szLine'. Gave it a star(\*) but it lacks knowledge to report it as error
