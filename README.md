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
- CVE must be resolved
- The cause of vulnerability should be determinable\*

CVE status is important because when CVE is resolved then it is mostly much easier to locate and understand the problem.

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
- Null dereference (ND)

| id  |       CVE       | vuln. type |       Project       | Commit (hash) |                  file (function)                  | file length |     clang      |  cppcheck   |     ikos      |    infer    | gcc          | symbiotic  | n   |
| :-: | :-------------: | :--------: | :-----------------: | :-----------: | :-----------------------------------------------: | :---------: | :------------: | :---------: | :-----------: | :---------: | ------------ | ---------- | --- |
|  1  |  CVE-2022-4603  |    AOOB    |         ppp         |    fb3529c    |                pppdump.c (dumpppp)                |     534     |  0/20/0(✖/✖)   | 0/0/0(✖/✖)  |  0/44/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/2/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
|  2  | CVE-2019-25078  |    AOOB    |      pacparser      |    f013613    |        pacparser.c (pacparser_find_proxy)         |     536     |   0/7/3(✖/✖)   | 1/0/0(✖/✖)  |  0/11/0(✖/✖)  | 1/0/0(✓/✓)  | 0/2/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/24/0(✓/✖)  | 1/0/0(✖/✖)  | 0/4/2(✖/✖)   | 0/0/0(✖/✖) |     |
|  3  |  CVE-2022-4202  |     IO     |        gpac         |    faac2ce    |         lsr_dec.c (lsr_translate_coords)          |    6141     |  0/34/37(✖/✖)  | 0/0/0(✖/✖)  |       ✖       | 9/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
|  4  |  CVE-2024-0321  |    AOOB    |        gpac         |    d2de8b5    |        load_text.c (gf_text_get_utf8_line)        |    4656     |  0/35/26(✖/✖)  | 0/0/0(✖/✖)  | 0/104/0(✖/✖)  | 3/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
|  5  | CVE-2021-37778  |    AOOB    |     gps-sdr-sim     |    d361b2c    |                  gpssim.c (main)                  |    2364     |  0/22/19(✖/✖)  | 0/0/0(✖/✖)  |       ✖       | 6/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  1/1/0(✖/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|  6  | CVE-2022-29021  |    AOOB    |      openrazer      |    9991fc6    |              razerchromacommon.c (-)              |    1448     |  0/23/32(✖/✖)  | 0/0/0(✖/✖)  |  0/32/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  2/0/0(✓/✓)   | 1/0/0(✓/✓)  | 0/1/2(✓/✓)   | 1/0/0(✓/✓) |     |
|  7  | CVE-2022-31003  |    AOOB    |      sofia-sip      |    5f18366    |            sdp_parse.c (parse_message)            |    1943     |   0/4/2(✖/✖)   | 0/0/0(✖/✖)  | 0/1171/0(✓/✖) | 1/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
|  8  |  CVE-2023-4260  |    AOOB    |       zephyr        |  14d88c6dc8b  |     fuse_fs_access.c (fuse_fs_access_readdir)     |     544     |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
|  9  | CVE-2014-125106 |     IO     |       nanopb        |    d0466bd    |            pb_decode.c (pb_dec_string)            |    1159     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  | 0/103/0(✓/✖)  | 7/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 1/0/0(✓/✓)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 10  | CVE-2021-32292  |    AOOB    |       json-c        |    56a89f9    |              json_parse.c (parseit)               |     188     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/51/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/8/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 11  | CVE-2021-33304  |    UAF     |       picotcp       |    f336ead    |   pico_fragments.c (pico_fragments_reassemble)    |     589     |       -        |      -      |       -       |      -      | -            | -          | CTU |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 1/0/2(✓/✓)  |  0/2/0(✓/✓)   | 2/0/0(✓/✓)  | 0/1/0(✓/✓)   | 1/0/0(✓/✓) |     |
| 12  | CVE-2022-28550  |    AOOB    |        jhead        |    06e8d7a    |                jhead.c (DoCommand)                |    1814     |   0/7/0(✖/✖)   | 1/0/0(✖/✖)  |  1/18/0(✖/✖)  | 2/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/16/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 13  | CVE-2015-10065  |    AOOB    |        FiND         |    3cc9b68    |          my_validator.cpp (init_result)           |     127     |   0/9/0(✖/✖)   | 12/0/0(✖/✖) |  0/45/0(✖/✖)  | 1/0/0(✖/✖)  | 0/6/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 0/0/0(✖/✖)  | 0/2/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 14  | CVE-2021-33797  |     IO     |        mujs         |    292415b    |               jsdtoa.c (js_strtod)                |     747     |   0/1/1(✖/✖)   | 0/0/0(✖/✖)  |       ✖       | 8/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/11/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 15  | CVE-2023-25076  |    AOOB    |      sniproxy       |    822bb80    |              address.c (new_address)              |     492     |   0/6/0(✖/✖)   | 0/0/0(✖/✖)  |  1/68/0(✓/✖)  | 0/0/0(✖/✖)  | 0/2/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  | 0/12//0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 16  | CVE-2023-41361  |    AOOB    |         frr         |    c2b0d6a    |   bgp_open.c (bgp_capability_software_version)    |    1973     |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/8/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 17  | CVE-2023-50965  |    AOOB    |   MicroHttpServer   |    4398570    |         middleware.c (\_ReadStaticFiles)          |     144     |   0/3/0(✖/✖)   | 0/0/0(✖/✖)  |  0/48/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/6/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 18  |  CVE-2023-2905  |    AOOB    |      mongoose       |    8114443    |          mqtt.c (decode_variable_length)          |     540     |   0/2/1(✖/✖)   | 0/0/0(✖/✖)  |  0/11/0(✓/✓)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/5/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 19  | CVE-2023-27103  |    AOOB    |      libde265       |    97b334a    |   motion.cc (derive_collocated_motion_vectors)    |    2180     |  0/19/14(✖/✖)  | 0/0/0(✖/✖)  | 0/311/0(✓/✖)  | 10/0/0(✖/✖) | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 1/0/0(✓/✓)  | 0/0/0(✖/✖)   | ✖          |     |
| 20  | CVE-2023-30078  |    AOOB    |      libeconf       |    dcfc789    |           libeconf.c (econf_writeFile)            |     772     |   0/5/1(✖/✖)   | 0/0/0(✖/✖)  | 0/132/0(✓/✖)  | 3/0/0(✖/✖)  | 0/5/3(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/2/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
| 21  | CVE-2023-31568  |    AOOB    |       podofo        |    882e729    |          PdfEncrypt.cpp (PdfEncryptRC4)           |    2002     |   0/7/3(✖/✖)   | 0/0/0(✖/✖)  |       ✖       | 5/0/0(✖/✖)  | 0/0/4(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/4/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 22  |    CVE-39975    |    UAF     |        krb5         |   0ceab6c36   |          do_tgs_req.c (process_tgs_req)           |    1128     |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/7/0(✓/✖)   | 1/0/0(✓/✓)  | 0/2/0(✓/✓)   | 1/0/0(✓/✓) |     |
| 23  | CVE-2023-43641  |    AOOB    |       libcue        |    78279d0    |              cd.c (track_set_index)               |     414     |   0/1/1(✖/✖)   | 0/0/0(✖/✖)  |  0/12/0(✓/✖)  | 0/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/8/0(✓/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 24  | CVE-2023-46602  |    AOOB    |     DemolccMAX      |    889db62    |             IccUtilXml.cpp (icFixXml)             |    1524     |  0/15/22(✖/✖)  | 0/0/0(✖/✖)  |  0/41/0(✓/✖)  | 6/0/0(✖/✖)  | 0/3/0(✖/✖)   | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/20/0(✓/✓)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 25  | CVE-2023-48106  |    AOOB    |     minizip-ng      |    97d8e65    |             mz_os.c (mz_path_resolve)             |     351     |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/92/0(✓/✖)  | 1/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/24/0(✓/✖)  | 1/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✖/✖) |     |
| 26  | CVE-2023-48107  |    AOOB    |     minizip-ng      |    97d8e65    |            mz_os.c (mz_path_has_slash)            |     351     |   0/1/0(✖/✖)   | 0/0/0(✖/✖)  |  0/11/0(✓/✓)  | 1/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/12/0(✓/✓)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 27  | CVE-2023-23609  |    AOOB    |     contiki-ng      |   c2334371e   |   ble-l2cap.c (input_l2cap_frame_flow_channel)    |     610     |   1/0/0(✖/✖)   | 1/0/0(✖/✖)  | 0/110/0(✓/✖)  | 2/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/4/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 28  | CVE-2023-25564  |    AOOB    |     gss-ntlmssp     |    97c62c6    |       src/ntlm.c (ntlm_decode_u16l_str_hdr)       |    1450     |  0/25/8(✓/✖)   | 1/0/0(✖/✖)  |  0/36/0(✓/✖)  | 12/0/0(✓/✓) | 0/4/0(✓/✓)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/20/0(✓/✖)  | 1/0/0(✓/✓)  | 0/2/0(✓/✓)   | 0/0/0(✖/✖) |     |
| 29  | CVE-2021-32845  |    UBI     |      hyperkit       |    451558f    |        pci_virtio_rnd.c (pci_vtrnd_notify)        |     187     |   1/0/0(✖/✖)   | 0/0/0(✖/✖)  |       ✖       |      ✖      | 1/1/1(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/13/0(✓/✖)  | 2/0/0(✓/✓)  | 0/1/0(✓/✓)   | 1/0/0(✖/✖) |     |
| 30  | CVE-2021-32846  |    AOOB    |      hyperkit       |    41272a9    |          pci_virtio_sock.c (iovec_pull)           |    2462     |   9/0/3(✖/✖)   | 3/0/0(✖/✖)  |       ✖       |      ✖      | 5/2/1(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✖/✖)   | 0/0/0(✖/✖)  |  0/5/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 31  | CVE-2021-34119  |    UBI     |       htmldoc       |    ee77825    |           ps-pdf.cxx (parse_paragraph)            |    13026    | 0/111/139(✖/✖) | 1/0/0(✖/✖)  |       ✖       | 30/0/0(✖/✖) | 0/6/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  1/1/0(✓/✓)   | 1/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 32  | CVE-2021-32495  |    UAF     |       radare2       |    a07dedb    |              marshal.c (get_object)               |    1222     |   0/6/5(✖/✖)   | 2/0/0(✖/✖)  | 0/302/0(✖/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  1/2/0(✓/✓)   | 1/0/0(✓/✓)  | 0/3/0(✓/✓)   | 1/0/0(✓/✓) |     |
| 33  | CVE-2022-47021  |     ND     |      opusfile       |    cf218fb    |               opusfile.c(op_open1)                |    3355     |  0/10/0(✖/✖)   | 0/0/0(✖/✖)  |       ✖       | 8/0/0(✖/✖)  | 0/2/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✖/✖)   | 0/0/0(✖/✖)  |  0/5/0(✓/✓)   | 0/0/0(✖/✖)  | 0/1/0(✓/✓)   | 0/0/0(✖/✖) |     |
| 34  | CVE-2022-47094  |    UBI     |        gpac         |    706111f    |         dmx_m2ts.c (m2tsdmx_declare_pid)          |    1499     |   0/4/2(✖/✖)   | 0/0/0(✖/✖)  | 0/502/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 0/0/0(✖/✖)  | 0/2/0(✓/✓)   | 1/0/0(✓/✓) |     |
| 35  | CVE-2022-47659  |    AOOB    |        gpac         |    2bcc36b    |         reframe_latm.c (latm_dmx_process)         |     691     |       -        |      -      |       -       |      -      | -            | -          | CTU |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/1/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 3/0/0(✓/✓) |     |
| 36  |  CVE-2023-0341  |    AOOB    | editorconfig-core-c |    412225d    |                ec_glob.c (ec_glob)                |     396     |   0/4/1(✖/✖)   | 0/0/0(✖/✖)  | 4/186/0(✓/✖)  | 1/0/0(✖/✖)  | 0/3/34(✖/✖)  | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/9/0(✓/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 37  |  CVE-2023-3012  |     ND     |        gpac         |    8f3088b    |       xml_parser.c (xml_sax_append_string)        |    2508     |   0/2/1(✖/✖)   | 0/0/0(✖/✖)  |  0/61/0(✓/✓)  | 5/0/0(✖/✖)  | 0/2/11(✖/✖)  | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/4/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 38  | CVE-2023-25221  |    AOOB    |      libde265       |    a050853    | motion.cc (derive_spatial_luma_vector_prediction) |    2166     |  0/18/14(✖/✖)  | 0/0/0(✖/✖)  | 0/588/0(✓/✖)  | 8/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/3/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 39  | CVE-2023-27590  |    AOOB    |        rizin        |    e7eae14    |           profile.c (gdb_to_rz_profile)           |     678     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  2/39/0(✖/✖)  | 0/0/0(✖/✖)  | 0/1/9(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/1/0(✖/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 40  | CVE-2023-34488  |    AOOB    |       NanoNNG       |    bb6f17f    |           mqtt_parser.c (conn_handler)            |    1883     |  0/16/5(✖/✖)   | 0/0/0(✖/✖)  | 0/472/0(✓/✖)  | 4/0/0(✖/✖)  | 0/3/2(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/2/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 41  | CVE-2023-36192  |    AOOB    |       sngrep        |    a7b8436    |        capture.c (capture_ws_check_packet)        |    1461     |  0/16/1(✖/✖)   | 0/0/0(✖/✖)  |  0/37/0(✓/✖)  | 3/0/0(✖/✖)  | 0/2/0(✖/✖)   | ✖          |     |
| 42  | CVE-2023-36193  |    AOOB    |      gifsicle       |    2be438a    |              clp.c (ambiguity_error)              |    2495     |  0/12/1(✖/✖)   | 0/0/0(✖/✖)  | 0/442/0(✓/✖)  | 2/0/0(✖/✖)  | 0/14/76(✖/✖) | ✖          |     |
| 43  | CVE-2023-43361  |    AOOB    |    vorbis-tools     |    7168723    |          platform.c (create_directorie)           |     331     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/36/0(✓/✖)  | 0/0/0(✖/✖)  | 0/2/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/3/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
| 44  | CVE-2023-47470  |    AOOB    |       FFmpeg        |    5c635b7    |          evc_ps.c (ref_pic_list_struct)           |     409     |  0/23/5(✖/✖)   | 0/0/0(✖/✖)  |  0/37/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
| 45  | CVE-2023-48014  |    AOOB    |        gpac         |    cd8a95c    |      av_parsers.c (hevc_parse_vps_extension)      |    12426    |   0/39/(✖/✖)   | 1/0/2(✖/✖)  | 0/635/0(✓/✖)  | 30/0/0(✓/✖) | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   1/0/0(✓/✓)   | 1/0/2(✓/✓)  |  1/0/0(✓/✓)   | 1/0/0(✓/✓)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 46  | CVE-2020-36646  |     ND     |       ZenLib        |    14b165e    |    Ztring.cpp (Date_From_Seconds_1970_Local )     |    2475     |  0/22/27(✖/✖)  | 3/0/0(✖/✖)  | 0/148/0(✖/✖)  | 5/0/0(✖/✖)  | 0/16/0(✖/✖)  | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/5/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 47  | CVE-2021-46901  |    AOOB    |        6lbr         |    c3092a1    |              httpd.c (httpd_is_file)              |     293     |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/5/0(✖/✖)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 48  | CVE-2022-46449  |    AOOB    |         MPD         |    c2d0f35    |            Error.hxx (FormatLastError)            |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/1/0(✓/✓)   | 0/0/0(✖/✖)  | 0/1/1(✖/✖)   | 1/0/0(✓/✓) |     |
| 49  |  CVE-2023-2617  |     ND     |   opencv_contrib    |    960b3f6    | decoded_bit_stream_parser.cpp (decodeByteSegment) |     490     |  0/4/1/(✖/✖)   | 1/0/0(✖/✖)  |       ✖       | 7/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
| 50  | CVE-2023-23108  |     ND     |        crasm        |    932f329    |                 pseudos.c (Xasc)                  |     543     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/17/0(✓/✓)  | 1/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/4/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 51  | CVE-2023-26917  |     ND     |       libyang       |    7572486    |    parser_common.c (lysp_stmt_validate_value)     |    3574     |  0/50/5(✖/✖)   | 38/0/0(✖/✖) |  0/42/0(✓/✓)  | 28/0/0(✖/✖) | 0/3/114(✖/✖) | ✖          |     |
| 52  | CVE-2023-29995  |    AOOB    |       NanoNNG       |    1d2a611    |          mqtt_parser.c (copyn_utf8_str)           |    1847     |  0/17/5(✖/✖)   | 0/0/0(✖/✖)  | 0/100/0(✓/✖)  | 4/0/0(✖/✖)  | 0/3/2(✖/✖)   | ✖          |     |
| 53  | CVE-2023-29996  |     ND     |       NanoNNG       |   f2a4dac0    |       mqtt_parser.c (nmq_unsubinfo_decode)        |    1812     |  0/17/5(✖/✖)   | 0/0/0(✖/✖)  |  0/81/0(✓/✖)  | 4/0/0(✖/✖)  | 0/3/2(✖/✖)   | ✖          |     |
| 54  | CVE-2023-32307  |    AOOB    |      sofia-sip      |    3f17604    |    stun_common.c (stun_parse_attr_error_code)     |     841     |   0/3/0(✖/✖)   | 1/0/0(✖/✖)  |  0/29/0(✓/✓)  | 5/0/0(✖/✖)  | 0/13/4(✖/✖)  | ✖          |     |
|  ?  |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/4/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 55  | CVE-2023-33659  |    AOOB    |       NanoNNG       |    d9792f5    |        mqtt_parser.c (nmq_subinfo_decode)         |    1871     |  0/16/5(✖/✖)   | 0/0/0(✖/✖)  | 0/137/0(✓/✖)  | 4/0/0(✖/✖)  | 0/3/2(✖/✖)   | ✖          |     |
| 56  | CVE-2023-33660  |    AOOB    |       NanoNNG       |    d9792f5    |             mqtt_parser.c (copyn_str)             |    1871     |  0/16/5(✖/✖)   | 0/0/0(✖/✖)  |  0/55/0(✓/✖)  | 4/0/0(✖/✖)  | 0/3/2(✖/✖)   | ✖          |     |
| 57  | CVE-2023-37185  |     ND     |      c-blosc2       |    144ed29    |        blosc2-zfp.c (zfp_prec_decompress)         |     877     |  0/12/15(✖/✖)  | 1/0/0(✖/✖)  |  1/58/0(✓/✖)  | 2/0/0(✖/✖)  | 0/1/30(✖/✖)  | ✖          |     |
| 58  | CVE-2023-37186  |     ND     |      c-blosc2       |    425e8a9    |           ndlz8x8.c (ndlz8_decompress)            |     577     |   0/5/5(✖/✖)   | 0/0/0(✖/✖)  | 0/136/0(✓/✖)  | 0/0/0(✖/✖)  | 0/8/8(✖/✖)   | ✖          |     |
| 59  | CVE-2023-37187  |     ND     |      c-blosc2       |    144ed29    |         blosc2-zfp.c (zfp_acc_decompress)         |     877     |  0/12/15(✖/✖)  | 1/0/0(✖/✖)  |  1/70/0(✓/✖)  | 2/0/0(✖/✖)  | 0/1/30(✖/✖)  | ✖          |     |
| 60  | CVE-2023-37188  |     ND     |      c-blosc2       |    144ed29    |        blosc2-zfp.c (zfp_rate_decompress)         |     877     |  0/12/15(✖/✖)  | 1/0/0(✖/✖)  |  1/64/0(✓/✖)  | 2/0/0(✖/✖)  | 0/1/30(✖/✖)  | ✖          |     |
| 61  | CVE-2023-38313  |     ND     |       OpenNDS       |    8214525    |       http_microhttpd.c (preauthenticated)        |    2102     |  0/11/7(✖/✖)   | 0/0/0(✖/✖)  | 2/1001/0(✓/✖) | 3/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/1/0(✓/✓)   | 0/0/0(✖/✖)  | 0/1/1(✓/✓)   | 1/0/0(✓/✓) |     |
| 62  | CVE-2023-38315  |     ND     |       OpenNDS       |    8214525    |      http_microhttpd.c (try_to_authenticate)      |    2102     |  0/11/7(✖/✖)   | 0/0/0(✖/✖)  |  0/48/0(✓/✖)  | 3/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          |     |
| 63  | CVE-2023-38320  |     ND     |       OpenNDS       |    99ef4e0    |       http_microhttpd.c (show_preauthpage)        |    2114     |  0/11/7(✖/✖)   | 0/0/0(✖/✖)  | 0/126/0(✓/✖)  | 3/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          |     |
| 64  | CVE-2023-38322  |     ND     |       OpenNDS       |    99ef4e0    |          http_microhttpd.c (do_binauth)           |    2114     |  0/11/7(✖/✖)   | 0/0/0(✖/✖)  |  1/52/0(✓/✖)  | 3/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          |     |
| 65  | CVE-2023-38434  |    UAF     |        xhttp        |    72f812d    |                  xhttp.c (xhttp)                  |    1869     |   0/9/1(✖/✖)   | 1/0/0(✖/✖)  | 9/1126/0(✓/✖) | 13/0/0(✖/✖) | 0/5/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  1/0/0(✓/✓)   | 1/0/0(✓/✓)  | 0/1/0(✓/✓)   | 1/0/0(✓/✓) |     |
| 66  | CVE-2023-39125  |    AOOB    |      NTSC-CRT       |    4dd4272    |                bmp_rw.c (loadBMP)                 |     160     |  0/13/3(✖/✖)   | 3/0/0(✖/✖)  |  0/33/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/7/0(✖/✖)   | 0/0/0(✖/✖)  |  0/14/0(✓/✓)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 0/0/0(✖/✖) |     |
| 67  | CVE-2023-39351  |     ND     |       FreeRDP       |    63a2f65    |             rfx.c rfx_process_message             |    2121     |   0/6/1(✖/✖)   | 0/0/0(✖/✖)  | 0/1496/0(✓/✖) | 1/0/0(✖/✖)  | 0/2/20(✖/✖)  | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/6/0(✓/✓)   | 1/0/0(✓/✓)  | 0/2/0(✓/✓)   | 0/0/0(✖/✖) |     |
| 68  | CVE-2023-40296  |    AOOB    |  async-sockets-cpp  |    d66588d    |              udpsocket.hpp (Receive)              |     170     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/54/0(✖/✖)  | 0/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          | 1\* |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/21/0(✖/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
| 69  | CVE-2023-47016  |    AOOB    |       radare2       |  386d9486a1   |   bin_xnu_kernelcache.c (process_constructors)    |    2219     |  0/10/2(✖/✖)   | 0/0/0(✖/✖)  |  0/85/0(✖/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          | 2\* |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/9/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 70  | CVE-2023-48105  |    AOOB    | wasm-micro-runtime  |    52db362    |   wasm_loader.c (wasm_loader_prepare_bytecode)    |    9979     |  0/17/8(✖/✖)   | 0/0/0(✖/✖)  | 0/1286/0(✓/✖) | 24/0/0(✖/✖) | 0/0/0(✖/✖)   | ✖          | 3\* |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/2/1(✓/✓)   | 0/0/0(✖/✖)  |  0/0/0(✖/✖)   | 2/0/0(✓/✓)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 71  | CVE-2023-49355  |    AOOB    |         jq          |    88f01a7    |             decNumber.c (decToString)             |    8143     |  0/32/10(✖/✖)  | 0/0/0(✖/✖)  | 0/276/0(✓/✖)  | 24/0/0(✖/✖) | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/1/0(✓/✓)   | 0/0/0(✖/✖)  |  0/10/0(✓/✓)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 72  |  CVE-2023-4504  |    AOOB    |        cups         |    9d57699    |           raster-interpret.c (scan_ps)            |    1724     |   0/1/1(✖/✖)   | 0/0/0(✖/✖)  | 0/276/0(✓/✖)  | 0/0/0(✖/✖)  | 0/5/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/4/0(✓/✓)   | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 73  | CVE-2021-45423  |    AOOB    |        libpe        |    4d9c279    |              exports.c (pe_exports)               |     217     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  | 0/132/0(✓/✖)  | 0/0/0(✖/✖)  | 0/1/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/2/0(✖/✖)   | 0/2/0(✖/✖)  |  0/7/0(✓/✖)   | 0/0/0(✖/✖)  | 0/2/0(✖/✖)   | 1/0/0(✓/✓) |     |
| 74  | CVE-2022-43634  |    AOOB    |      netatalk       |    0637355    |            dsi_write.c (dsi_writeinit)            |     79      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/90/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | ✖          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/18/0(✓/✖)  | 0/0/0(✖/✖)  | 0/0/0(✖/✖)   | 2/0/0(✓/✓) |     |
| 75  | CVE-2023-41101  |    AOOB    |       OpenNDS       |    5e04ea1    |           http_microhttpd.c (get_query)           |    2122     |   0/0/0(✖/✖)   | 0/0/0(✖/✖)  |  0/7/0(✖/✖)   | 0/0/0(✖/✖)  | 0/3/0(✖/✖)   | 3/0/0(✓/✓) |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 76  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 77  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 78  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 79  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 80  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 81  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
| 82  |     CVE-000     |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |
|     |    Extracted    |            |                     |               |                         -                         |      -      |       -        |      -      |       -       |      -      | -            | -          |     |

No cross Cross Translation Unit (CTU) analysis was performed because not all static code analyzers support it.
At least for now. Maybe later I will do CTU

Notes:

- 1\*
  - udp-client.cpp file was analyzed in the examples folder but only notes from udpsocket.hpp file were recorded. udp-server file was analyzed because static code analyzers like ikos and symbiotic can not analyze whole file and need and entry point
- 2\*
  - static code analyzer notifications were counter from file bin_xnu_kernelcache.c as well as from r_endian.h where the out of bound access actually happens
- 3\*
  - while loop where is vulnerability takes 2812 code rows WOW.
