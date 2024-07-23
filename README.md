### Framework how realworld memory corruption vulnerabilities were handled:

- clone latest version of project with known vulnerability.
- checkout to the version right before the vulnerability was fixed or to a version known to contain a vulnerability.
- find the vulnerability and extract the vulnerable logic to create a small test case.
- run different static code analyzers on the initial file with vulnerability as well as on the extracted vulnerability.
- document ammount of errors/warning/notes that the static code analyzer has generated as well as some other data.

All known vulnerabilities were found by using an open database of common vulnerabilities and exploits known as <a href="https://www.cvedetails.com/">CVEdetails.com</a>. Vulnerabilities that did not have link to github were ignored.

Extracted vulnerability logic means that the vulnerability that was present in a project gets extracted into a sepparate file. While extracting the business logic gets removed and vulnerability gets simplified as much as possible to make a test case out of it.

Commands and static code analyzers that were used:

- clang --analyze -Xclang -analyzer-checker=core,alpha -ferror-limit=0 \<filename>
- clang++ --analyze -Xclang -analyzer-checker=core,alpha -Xclang -analyzer-config -Xclang aggressive-binary-operation-simplification=true -ferror-limit=0 \<filename>
- cppcheck --force \<filename>
- ikos ikos -w --globals-init=all -a "boa, dbz, nullity, prover, uva, sio, uio, poa, shc, pcmp, sound, fca, dfa" -f text --rm-db --entry-points=\<function> \<filename>
- infer run --bufferoverrun --pulse-unsafe-malloc --keep-going -- gcc -c
- gcc/g++ -fanalyzer -c \<filename>
- symbiotic --prp=memsafety --malloc-never-fails \<filename>

### Criteria for CVE selection

CVE's were selected from availible CVE's on <a href="https://www.cvedetails.com/">CVEdetails.com</a>. Within this thesis only memory corruption vulnerabilities were analyzed so all CVE's were filtered (Overflow and Memory corruption are two different categories on CVEdetails website but during this thesis they are treated as the same group so filtering was done by each category separatly but within this thesis the results were presented togeather). Apart from CVE type also year filter was applied to show CVE's that were disclosed in 2023 year. This was done mostly to get results that are related to currect state of the art rather than analyzing decades old vulnerabilities. Lastly, all CVE's were also sorted by the CVSS score mainly to make research more consistent and verifiable, as without sorting entries may appear in different order.

Apart from sorting and filtering CVE's were selected based on the following criteria:

- CVE should be related to memory corruption
- CVE should have a link to a github or any other public open source repository
- The cause of vulnerability should be determinable\*

While last criteria may seem inappropriate as it is too subjective it is important to understant why and where the vulnerability is in the code in order to correctly extract it and to be able to tell wheather static code analyzer managed to find it or not. While in most cases it was possible to understand where the vulnerability lies in some instances it was extremly challanging and vulnerabilities where author could not determine the exact code location with a flaw were skipped.

### Selection of static code analyzers

Main criteria for static code analyzers was for them to detect memory corruption vulnerabilities and support for C and C++ code analysis. While selecting analyzers two simple test files were selected, where one was written in C and another one in C++. When testing wheather static code analyzer is suitable or not they were tested on this two test cases and if they managed to find most of the vulnerabilities they were considered as suitable. In the end six static code analyzers were selected as in authors opinion it is enough to get an overview of the state of the art in static code analyzer field.

#### Versions of static code analyzers used

| Static code analyzer | version |
| :------------------: | :-----: |
|     LLVM (Clang)     | 19.0.0  |
|       Cppcheck       |   2.7   |
|         ikos         |  3.3.0  |
|        infer         |  1.2.0  |
|         GCC          | 13.2.0  |
|      symbiotic       |  8.0.0  |

#### How flags for static analyzer invocation were selected

When deciding which flags to use with a certain static code analyzer following goals were priotarized:

- static code analyzer should analyze only file with vulnerability and not whole project (some also analyze only one function as they need to have an entry point into the program)
- analyzer should be configured in a way that all checkers that are relevant to memory safety are turned on.
- Other then memory safety checkers default checkers should be preserved as much as possible to gather statistics on how many notes static analyzer gives per file with vulnerability.

Other then the goals some flags were added also to reduce number of notes given by the static code analyzer. For instance symbiotic flag '--malloc-never-fails' or infer flag '--pulse-unsafe-malloc' are used to make malloc calls always success. Otherwise these tools will report any pointer returned by malloc invocation as potentially a NULL pointer and many projects to not check for a NULL pointer after calling malloc function. Addition of these malloc never fails flags greatly reduces number of warnings thrown by static code analyzer and makes analysis more managable.

Reason for preserving defailt checkers is measure how many notifications does vulnerable file output and wheather this amount is adequate compared to the file size. This metric is supposed to reflect approximately how many errors would production scan get for a certain file. Word approximately is used because every software engineer configures static code analyzer differently and because of that the number of notifications thrown by static code analyzer can also vary. Nevertheless, for the sake of measurment in this thesis default configuration checkers were preserved in most cases to measure amount of notifications per file. Onliest default checker that was eliminated was Dead Code Analysis or dca parametr of an -a flag from ikos static code analyzer. It was eliminated because it introduces too much false positives and only made it difficult to count/analyze the errors outputted by ikos.

Some static code analyzer invocation looks very simple with not a lot of flags present. For instance, static code analyzers like gcc and cppcheck have only 2 and 1 flag respectively. Lack of invocation flags is related to the fact that there was no need to add any other flags as default configuration was more then enough to catch all problems related to memory safety. Before analyzing real world projects with known vulnerabilities a simple test case was created to test wheather static code analyzer finds all simple bugs such as overflow, use before initialization and use after free. If static code analyzer finds all the simple problems then all checks for memory safety are on by default and there is not need to enable anything additionally. In addition testing analyzer of test bugs also documentation was read and all possible flags were analyzed but if there were no flags to enable then the analyzer invocation was left as it is.

By the means of simple test cases static code analyzers were also selected and those who could not find simple memory corruption problems were not selected for analysis.

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

#### Notification classification

In this thesis all notifications are classified only into 3 groups that are: errors, warnings and notes. While most of the selected static code analyzers have excatly the same note classification there are also some namely CppCheck that had its own note classification. Because there was a need to record notes from different analyzers it was important to standardize different categories of notes and because of that CppCheck analyzer classification were mapped to classifications used in other analyzers. The mapping is as follows:

- errors
  - error
  - portability
- warnings
  - warning
- notes:
  - style notes
  - information
  - performance

#### Ikos notes

Ikos errors/warnings/notes generated during compilation by clang were not taken into account.
Also Ikos provices following classification for output notifications:

- \* (all)
- error
- warning
- safe
- unreachable

As there was an overwhelming amount of unreachable notes only errors and warning notes were taken into account

Ikos to analyze C++ files in front of functions 'extern "C"' was added to preserve function name otherwise ikos could not find entrypoint to start the analysis

#### Table

Vulnerability types:

- use after free (UAF)
- use before initialization (UBI)
- Access out of bound (AOOB)
- Integer overflow (IO)

| id  |       CVE       | vuln. type |     Project     | Commit (hash) |               file (function)                | file length |    clang     |  cppcheck   |     ikos      |   infer    | gcc        | symbiotic  |
| :-: | :-------------: | :--------: | :-------------: | :-----------: | :------------------------------------------: | :---------: | :----------: | :---------: | :-----------: | :--------: | ---------- | ---------- |
|  1  |  CVE-2022-4603  |    AOOB    |       ppp       |    fb3529c    |             pppdump.c (dumpppp)              |     534     | 0/20/0(✖/✖)  | 0/0/0(✖/✖)  |  0/44/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/2/0(✓/✓)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 1/0/0(✓/✓) |
|  2  | CVE-2019-25078  |    AOOB    |    pacparser    |    f013613    |      pacparser.c (pacparser_find_proxy)      |     536     |  0/7/3(✖/✖)  | 1/0/0(✖/✖)  |  0/11/0(✖/✖)  | 1/0/0(✓/✓) | 0/2/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/24/0(✓/✖)  | 1/0/0(✖/✖) | 0/4/2(✖/✖) | 0/0/0(✖/✖) |
|  3  |  CVE-2022-4202  |     IO     |      gpac       |    faac2ce    |       lsr_dec.c (lsr_translate_coords)       |    6141     | 0/34/37(✖/✖) | 0/0/0(✖/✖)  |       ✖       | 9/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|  4  |  CVE-2024-0321  |    AOOB    |      gpac       |    d2de8b5    |     load_text.c (gf_text_get_utf8_line)      |    4656     | 0/35/26(✖/✖) | 0/0/0(✖/✖)  | 0/104/0(✖/✖)  | 3/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/1/0(✓/✓)  | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 1/0/0(✓/✓) |
|  5  | CVE-2021-37778  |    AOOB    |   gps-sdr-sim   |    d361b2c    |               gpssim.c (main)                |    2364     | 0/22/19(✖/✖) | 0/0/0(✖/✖)  |       ✖       | 6/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  1/1/0(✖/✖)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|  6  | CVE-2022-29021  |    AOOB    |    openrazer    |    9991fc6    |           razerchromacommon.c (-)            |    1448     | 0/23/32(✖/✖) | 0/0/0(✖/✖)  |  0/32/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/1/0(✓/✓)  | 0/0/0(✖/✖)  |  2/0/0(✓/✓)   | 1/0/0(✓/✓) | 0/1/2(✓/✓) | 1/0/0(✓/✓) |
|  7  | CVE-2022-31003  |    AOOB    |    sofia-sip    |    5f18366    |         sdp_parse.c (parse_message)          |    1943     |  0/4/2(✖/✖)  | 0/0/0(✖/✖)  | 0/1171/0(✓/✖) | 1/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|  8  |  CVE-2023-4260  |    AOOB    |     zephyr      |  14d88c6dc8b  |  fuse_fs_access.c (fuse_fs_access_readdir)   |     544     |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|  9  | CVE-2014-125106 |     IO     |     nanopb      |    d0466bd    |         pb_decode.c (pb_dec_string)          |    1159     |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  | 0/103/0(✓/✖)  | 7/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 1/0/0(✓/✓) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 10  | CVE-2021-32292  |    AOOB    |     json-c      |    56a89f9    |            json_parse.c (parseit)            |     188     |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/51/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/8/0(✓/✓)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 11  | CVE-2021-33304  |    UAF     |     picotcp     |    f336ead    | pico_fragments.c (pico_fragments_reassemble) |     589     |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/1/0(✓/✓)  | 1/0/2(✓/✓)  |  0/2/0(✓/✓)   | 2/0/0(✓/✓) | 0/1/0(✓/✓) | 1/0/0(✓/✓) |
| 12  | CVE-2022-28550  |    AOOB    |      jhead      |    06e8d7a    |             jhead.c (DoCommand)              |    1814     |  0/7/0(✖/✖)  | 1/0/0(✖/✖)  |  1/18/0(✖/✖)  | 2/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/16/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 13  | CVE-2015-10065  |    AOOB    |      FiND       |    3cc9b68    |        my_validator.cpp (init_result)        |     127     |  0/9/0(✖/✖)  | 12/0/0(✖/✖) |  0/45/0(✖/✖)  | 1/0/0(✖/✖) | 0/6/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 0/0/0(✖/✖) | 0/2/0(✖/✖) | 0/0/0(✖/✖) |
| 14  | CVE-2021-33797  |     IO     |      mujs       |    292415b    |             jsdtoa.c (js_strtod)             |     747     |  0/1/1(✖/✖)  | 0/0/0(✖/✖)  |       ✖       | 8/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/11/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 15  | CVE-2023-25076  |    AOOB    |    sniproxy     |    822bb80    |           address.c (new_address)            |     492     |  0/6/0(✖/✖)  | 0/0/0(✖/✖)  |  1/68/0(✓/✖)  | 0/0/0(✖/✖) | 0/2/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  | 0/12//0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 16  | CVE-2023-41361  |    AOOB    |       frr       |    c2b0d6a    | bgp_open.c (bgp_capability_software_version) |    1973     |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/8/0(✓/✓)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 17  |     CVE-000     |    AOOB    | MicroHttpServer |    4398570    |       middleware.c (\_ReadStaticFiles)       |     144     |  0/3/0(✖/✖)  | 0/0/0(✖/✖)  |  0/48/0(✓/✖)  | 0/0/0(✖/✖) | 0/0/0(✖/✖) | ✖          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |  0/0/0(✖/✖)  | 0/0/0(✖/✖)  |  0/6/0(✓/✓)   | 0/0/0(✖/✖) | 0/0/0(✖/✖) | 0/0/0(✖/✖) |
| 18  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 19  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 20  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 21  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 22  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 23  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 24  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 25  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 26  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 27  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 28  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 29  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
| 30  |     CVE-000     |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |
|     |    Extracted    |            |                 |               |                      -                       |      -      |      -       |      -      |       -       |     -      | -          | -          |

No cross Cross Translation Unit (CTU) analysis was performed because not all static code analyzers support it. because of that some errors are unnotices like CVE-2021-33304.
At least for now. Maybe later I will do CTU
