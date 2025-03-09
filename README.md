### Framework how realworld memory corruption vulnerabilities were handled:

- clone latest version of project with known vulnerability.
- checkout to the version right before the vulnerability was fixed or to a version known to contain a vulnerability.
- find the vulnerability and extract the vulnerable logic to create a small test case.
- run different static code analyzers on the initial file with vulnerability as well as on the extracted vulnerability.
- document ammount of errors/warning/notes that the static code analyzer has generated as well as some other data.

All known vulnerabilities were found by using an open database of common vulnerabilities and exploits known as <a href="https://www.cvedetails.com/">CVEdetails.com</a>. Vulnerabilities that did not have link to github were ignored.

Extracted vulnerability logic means that the vulnerability that was present in a project gets extracted into a sepparate file. While extracting the business logic gets removed and vulnerability gets simplified as much as possible to make a test case out of it.

Commands and static code analyzers that were used:

- clang --analyze -Xclang -analyzer-checker=core,alpha.core,security,alpha.security,optin,unix,alpha.unix,nullability -Xclang -analyzer-disable-checker=security.insecureAPI -ferror-limit=0 \<filename>
- clang++ --analyze -Xclang -analyzer-checker=core,alpha.core,security,alpha.security,optin,unix,alpha.unix,nullability,cplusplus,alpha.cplusplus -Xclang -analyzer-disable-checker=security.insecureAPI -Xclang -analyzer-config -Xclang aggressive-binary-operation-simplification=true -ferror-limit=0 \<filename>
- cppcheck --enable=warning,portability --force --inconclusive \<filename>
- ikos -w --globals-init=all -a "boa, dbz, nullity, prover, uva, sio, uio, poa, shc, pcmp, sound, fca, dfa" -f text --rm-db --entry-points=\<function> \<filename>
- infer run --default-checkers --headers --biabduction --biabduction-unsafe-malloc --bufferoverrun --pulse-unsafe-malloc --keep-going -- gcc -c \<filename>
- gcc/g++ -fanalyzer -Wall -Wextra -Wformat=2 -c \<filename>
- symbiotic --prp=memsafety --malloc-never-fails \<filename>

### Criteria for CVE selection

CVE's were selected from availible CVE's on <a href="https://www.cvedetails.com/">CVEdetails.com</a>. Within this thesis only memory corruption vulnerabilities were analyzed so all CVE's were filtered (Overflow and Memory corruption are two different categories on CVEdetails website but during this thesis they are treated as the same group so filtering was done by each category separatly but within this thesis the results were presented togeather). Apart from CVE type also year filter was applied to show CVE's that were disclosed in 2023 year. This was done mostly to get results that are related to currect state of the art rather than analyzing decades old vulnerabilities. Lastly, all CVE's were also sorted by the CVSS score mainly to make research more consistent and verifiable, as without sorting entries may appear in different order.

Apart from sorting and filtering CVE's were selected based on the following criteria:

- CVE should be related to memory corruption
- CVE should have a link to a github or any other public open source repository
- The cause of vulnerability should be determinable\*

While last criteria may seem inappropriate as it is too subjective it is important to understant why and where the vulnerability is in the code in order to correctly extract it and to be able to tell wheather static code analyzer managed to find it or not. While in most cases it was possible to understand where the vulnerability lies in some instances it was extremly challanging and vulnerabilities where author could not determine the exact code location with a flaw were skipped.

### Selection of static code analyzers

Main criteria for static code analyzers was for them to detect memory corruption vulnerabilities and support C and C++ code analysis. While selecting analyzers two simple test files were created, where one was written in C and another one in C++. When testing wheather static code analyzer is suitable or not they were tested on this two test files and if they managed to find most of the vulnerabilities they were considered suitable. In the end six static code analyzers were selected as in authors opinion it is enough to get an overview of the state of the art in static code analyzer field.

#### Versions of static code analyzers used

| Static code analyzer | version |
| :------------------: | :-----: |
|     LLVM (Clang)     | 19.0.0  |
|       Cppcheck       |   2.7   |
|         ikos         |  3.3.0  |
|        infer         |  1.2.0  |
|         GCC          | 14.2.0  |
|      symbiotic       |  8.0.0  |

#### How flags for static analyzer invocation were selected

When deciding which flags to use with a certain static code analyzer following goals were priotarized:

- static code analyzer should analyze only file with vulnerability and not whole project (exception is ikos and symbiotic that analyze only one function and require an entry point)
- analyzer should be configured in a way that all checkers that are relevant to memory safety and undefined behaviour are turned on.

Other then the goals some flags were added also to reduce number of notes given by the static code analyzer. For instance symbiotic flag '--malloc-never-fails' or infer flag '--pulse-unsafe-malloc' are used to make malloc calls always success. Otherwise these tools will report any pointer returned by malloc invocation as potentially a NULL pointer and many projects do not check for a NULL pointer after calling malloc function. Addition of these malloc never fails flags greatly reduces number of warnings thrown by static code analyzer and makes analysis more managable. In addition, security.insecureAPI checkers were removed as they did not add any value to the output of the analysis. Checkers from that group only noted use of old and potentially dangerous methods and did not pay attention on wheather their use is actually dangerous in certain context.

Onliest default checker that was eliminated was Dead Code Analysis or dca parametr of an -a flag from ikos static code analyzer. It was eliminated because it introduces too much false positives and only made it difficult to count/analyze the errors outputted by ikos.

### Result table

The result table contains each analyzed vulnerability with the analysis results. For each vulnerability there is 2 rows in a table. First row contains information about the vulnerability location and the project where it was found as well as the results from static code analyzing tools. Static code analyzers were executed on a single file that contained a vulnerability and in each cell of static code analyzer results are documented in a format of

- \<errors number>/\<warnings number>/\<info notices number> (\<vulnerability detected>/\<vulnerability notice within first 5 notifications>)

Important to note that errors/warnings/notes were counted only that are realted to single file with vulnerability and not to the execution of the static code analyzer or any other meta information. Similarly, notes thrown from other files in a project or system header files were not taken into account. For instance, notes as:

- INFO: Total slicing time
- INFO: Starting verification
- INFO: total time

and similar were not counted into the total number of errors/warnings/notes outputted by the static code analyzer.

Second row in a table where in a CVE column 'Extracted' is specified stands for the simplified version of the vulnerability that was extraced into a separate file to make a test case out of it. This test case is once again analyzer in the exactly same way as the original file and the analysis results are documented in the table in an exactly the same way as the original file results.

If static code analyzer has ✖ instead of the results it means that static code analyzer was for some reason unable to analyze the file.
File length is last file row where at least some symbols are present.
Function length is calculates as <last row of a function (usually row with })> - <first row of a function (usually function declaration)> + 1

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

Ikos to analyze C++ files in front of functions 'extern "C"' was added to preserve function name otherwise ikos could not find entrypoint to start the analysis
Also in case function was static, 'static' keyword was removed in order for ikos to find it

#### Table

Vulnerability types:

- use after free (UAF)
- use before initialization (UBI)
- Access out of bound (AOOB)
- Integer overflow (IO)
- Null dereference (ND)
- Denial of service (DOS)
- Undefined behaviour (UB)

| id  |            CVE            | vuln. type |       Project       | Commit (hash) |                    file (function)                     | file len | func len |    clang    |   cppcheck   |     ikos      |    infer     | gcc             | symbiotic  | - |
| :-: | :-----------------------: | :--------: | :-----------------: | :-----------: | :----------------------------------------------------: | :------: | :------: | :---------: | :----------: | :-----------: | :----------: | --------------- | ---------- | --- |
|  1  |       CVE-2022-4603       |    AOOB    |         ppp         |    fb3529c    |                  pppdump.c (dumpppp)                   |   534    |   173    | 0/20/0(✖/✖) |  1/0/0(✖/✖)  |  0/44/0(✖/✓)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/2/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
|  2  |      CVE-2019-25078       |    AOOB    |      pacparser      |    f013613    |           pacparser.c (pacparser_find_proxy)           |   536    |    57    | 0/4/0(✖/✖)  |  1/0/0(✖/✖)  |  0/11/0(✖/✖)  |  2/0/0(✓/✓)  | 0/15/1(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/24/0(✓/✖)  |  1/0/0(✖/✖)  | 0/4/0(✖/✖)      | ✖          |     |
|  3  |       CVE-2022-4202       |     IO     |        gpac         |    faac2ce    |            lsr_dec.c (lsr_translate_coords)            |   6141   |    24    | 0/6/0(✖/✖)  |  2/3/4(✖/✖)  |       ✖       |  9/0/0(✖/✖)  | 0/259/238 (✖/✖) | ✖          |     |
|     | Extracted (not sanitized) |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/13/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
|  4  |       CVE-2024-0321       |    AOOB    |        gpac         |    d2de8b5    |          load_text.c (gf_text_get_utf8_line)           |   4656   |   103    | 0/11/0(✖/✖) | 0/11/6(✖/✖)  | 0/104/0(✓/✓)  |  3/0/0(✖/✖)  | 0/33/2(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/13/0(✖/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
|  5  |      CVE-2021-37778       |    AOOB    |     gps-sdr-sim     |    d361b2c    |                    gpssim.c (main)                     |   2364   |   693    | 0/6/0(✖/✖)  |  0/0/0(✖/✖)  |       ✖       |  7/0/0(✖/✖)  | 0/2/1(✖/✖)      | 0/0/0(✖/✖) |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/4/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|  6  |      CVE-2022-29021       |    AOOB    |      openrazer      |    9991fc6    |     razerchromacommon.c (razer_chroma_standard...)     |   1448   |    15    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/32/0(✖/✖)  |  0/0/0(✖/✖)  | 0/23/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  2/0/0(✓/✓)   |  1/0/0(✓/✓)  | 0/2/4(✓/✓)      | 1/0/0(✓/✓) |     |
|  7  |      CVE-2022-31003       |    AOOB    |      sofia-sip      |    5f18366    |              sdp_parse.c (parse_message)               |   1943   |   149    | 0/2/0(✖/✖)  |  0/1/2(✖/✖)  | 0/1171/0(✓/✖) |  2/0/0(✖/✖)  | 0/14/7(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/13/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
|  8  |       CVE-2023-4260       |    AOOB    |       zephyr        |    14d88c6    |       fuse_fs_access.c (fuse_fs_access_readdir)        |   544    |    90    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/0/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
|  9  |      CVE-2014-125106      |     IO     |       nanopb        |    d0466bd    |              pb_decode.c (pb_dec_string)               |   1159   |    31    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/113/0(✓/✖)  |  8/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  1/0/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 10  |      CVE-2021-32292       |    AOOB    |       json-c        |    56a89f9    |                 json_parse.c (parseit)                 |   188    |    66    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/51/0(✓/✖)  |  1/0/0(✖/✖)  | 0/2/1(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/2/0(✖/✖)  |  0/0/0(✖/✖)  |  0/28/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 11  |      CVE-2021-33304       |    UAF     |       picotcp       |    f336ead    |      pico_fragments.c (pico_fragments_reassemble)      |   589    |    54    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  1/0/2(✓/✓)  |  0/3/0(✓/✓)   |  1/0/0(✓/✓)  | 0/2/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 12  |      CVE-2022-28550       |    AOOB    |        jhead        |    06e8d7a    |                  jhead.c (DoCommand)                   |   1814   |    86    | 0/6/0(✖/✖)  |  1/1/0(✖/✖)  |  1/18/0(✖/✖)  |  2/0/0(✖/✖)  | 0/5/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/18/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 13  |      CVE-2015-10065       |    AOOB    |        FiND         |    3cc9b68    |             my_validator.cpp (init_result)             |   127    |    76    | 0/9/0(✖/✖)  | 12/1/0(✖/✖)  |  0/45/0(✖/✖)  | 11/0/0(✖/✖)  | 0/10/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/1/0(✖/✖)  |  0/3/0(✖/✖)   |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 14  |      CVE-2021-33797       |     IO     |        mujs         |    292415b    |                  jsdtoa.c (js_strtod)                  |   747    |   186    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |       ✖       |  8/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/11/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 15  |      CVE-2023-25076       |    AOOB    |      sniproxy       |    822bb80    |                address.c (new_address)                 |   492    |   125    | 0/6/0(✖/✖)  |  0/1/2(✖/✖)  |  1/68/0(✓/✖)  |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/12/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 16  |      CVE-2023-41361       |    AOOB    |         frr         |    c2b0d6a    |      bgp_open.c (bgp_capability_software_version)      |   1973   |    34    | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/44/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/116(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  2/1/0(✓/✓)   |  2/0/0(✓/✓)  | 0/2/4(✓/✓)      | 1/0/0(✓/✓) |     |
| 17  |      CVE-2023-50965       |    AOOB    |   MicroHttpServer   |    4398570    |            middleware.c (\_ReadStaticFiles)            |   144    |    58    | 0/3/0(✖/✖)  |  0/0/0(✖/✖)  |  0/48/0(✓/✖)  |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
| 18  |       CVE-2023-2905       |    AOOB    |      mongoose       |    8114443    |            mqtt.c (decode_variable_length)             |   540    |    16    | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/11/0(✓/✓)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/4/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 19  |      CVE-2023-27103       |    AOOB    |      libde265       |    97b334a    |      motion.cc (derive_collocated_motion_vectors)      |   2180   |   174    | 0/8/0(✖/✖)  |  0/0/3(✖/✖)  | 0/216/0(✓/✖)  | 10/0/0(✖/✖)  | 0/6/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  2/5/0(✓/✓)   |  1/0/0(✓/✓)  | 0/0/0(✖/✖)      | ✖          |     |
| 20  |      CVE-2023-30078       |    AOOB    |      libeconf       |    dcfc789    |              libeconf.c (econf_writeFile)              |   772    |    84    | 0/4/0(✖/✖)  |  0/3/0(✖/✖)  | 0/132/0(✖/✖)  |  3/0/0(✖/✖)  | 0/3/3(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/1/0(✓/✓)  |  0/2/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 21  |      CVE-2023-31568       |    AOOB    |       podofo        |    882e729    |             PdfEncrypt.cpp (PdfEncryptRC4)             |   2002   |    17    | 0/26/3(✖/✖) |  0/7/0(✖/✖)  |       ✖       | 26/0/0(✖/✖)  | 0/0/4(✖/✖)      | ✖          |     |
| 22  |         CVE-39975         |    UAF     |        krb5         |    0ceab6c    |             do_tgs_req.c (process_tgs_req)             |   1128   |    67    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/7/0(✓/✖)   |  2/0/0(✓/✓)  | 0/2/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 23  |      CVE-2023-43641       |    AOOB    |       libcue        |    78279d0    |                 cd.c (track_set_index)                 |   414    |    9     | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/12/0(✓/✖)  |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
| 24  |      CVE-2023-46602       |    AOOB    |     DemolccMAX      |    889db62    |               IccUtilXml.cpp (icFixXml)                |   1524   |    34    | 0/12/0(✖/✖) |  0/7/0(✖/✖)  |  0/41/0(✓/✖)  |  5/0/0(✖/✖)  | 0/18/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/20/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 25  |      CVE-2023-48106       |    AOOB    |     minizip-ng      |    97d8e65    |               mz_os.c (mz_path_resolve)                |   351    |    83    | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/92/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/24/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✖/✖) |     |
| 26  |      CVE-2023-48107       |    AOOB    |     minizip-ng      |    97d8e65    |              mz_os.c (mz_path_has_slash)               |   351    |    6     | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/11/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/20/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 27  |      CVE-2023-49468       |    AOOB    |      libde265       |    03988ce    |              slice.cc (read_coding_unit)               |   5086   |   332    | 0/8/0(✖/✖)  |  0/0/3(✖/✖)  | 2/1316/0(✓/✖) |  9/0/0(✖/✖)  | 0/23/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/17/0(✓/✖)  |  1/0/0(✓/✓)  | 0/4/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 28  |      CVE-2023-25564       |    AOOB    |     gss-ntlmssp     |    97c62c6    |           ntlm.c (ntlm_decode_u16l_str_hdr)            |   1450   |    39    | 0/18/0(✓/✓) |  1/0/0(✖/✖)  |  0/36/0(✓/✖)  |  7/0/0(✓/✓)  | 0/7/0(✓/✖)      | ✖          |     |
|     | Extracted (not sanitized) |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/26/0(✓/✖)  |  1/0/0(✓/✓)  | 0/4/0(✓/✓)      | 0/0/0(✖/✖) |     |
| 29  |      CVE-2021-32845       |    UBI     |      hyperkit       |    451558f    |          pci_virtio_rnd.c (pci_vtrnd_notify)           |   187    |    32    | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/20/0(✓/✖)  |  2/0/0(✖/✖)  | 0/2/1(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/25/0(✓/✖)  |  3/0/0(✓/✓)  | 0/4/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 30  |      CVE-2021-32846       |    AOOB    |      hyperkit       |    41272a9    |             pci_virtio_sock.c (iovec_pull)             |   2483   |    36    | 0/6/0(✖/✖)  |  7/2/0(✖/✖)  |  0/66/0(✓/✖)  |  7/0/0(✖/✖)  | 0/16/7(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/5/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 31  |      CVE-2021-34119       |    UBI     |       htmldoc       |    ee77825    |              ps-pdf.cxx (parse_paragraph)              |  13026   |   728    | 0/42/0(✖/✖) |  6/4/4(✖/✖)  |       ✖       | 34/0/0(✖/✖)  | 0/38/33(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  1/1/0(✓/✓)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 32  |      CVE-2021-32495       |    UAF     |       radare2       |    a07dedb    |                 marshal.c (get_object)                 |   1222   |   136    | 0/1/0(✖/✖)  |  3/0/0(✖/✖)  | 0/296/0(✓/✖)  |  1/0/0(✖/✖)  | 0/8/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  1/2/0(✓/✓)   |  1/0/0(✓/✓)  | 0/5/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 33  |      CVE-2022-47021       |     ND     |      opusfile       |    cf218fb    |                 opusfile.c (op_open1)                  |   3355   |    75    | 0/10/0(✖/✖) | 1/4/13(✖/✖)  |       ✖       |  8/0/0(✖/✖)  | 0/2/0(✖/✖)      | ✖          |     |
| 34  |      CVE-2022-47094       |    UBI     |        gpac         |    706111f    |            dmx_m2ts.c (m2tsdmx_declare_pid)            |   1499   |   377    | 0/2/0(✖/✖)  |  0/2/0(✖/✖)  | 0/501/0(✓/✖)  |  0/0/0(✖/✖)  | 0/6/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/81/0(✓/✖)  |  0/0/0(✖/✖)  | 0/1/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 35  |      CVE-2022-47659       |    AOOB    |        gpac         |    2bcc36b    |             bitstream.c (gf_bs_read_data)              |   1775   |    47    | 0/0/0(✖/✖)  | 12/0/0(✖/✖)  | 0/868/0(✖/✖)  | 11/0/0(✖/✖)  | 0/13/6(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/6/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 36  |       CVE-2023-0341       |    AOOB    | editorconfig-core-c |    412225d    |                  ec_glob.c (ec_glob)                   |   396    |   332    | 0/4/1(✖/✖)  |  0/0/0(✖/✖)  | 4/185/0(✓/✖)  |  1/0/0(✖/✖)  | 0/4/2(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/9/0(✓/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 37  |       CVE-2023-3012       |     ND     |        gpac         |    8f3088b    |          xml_parser.c (xml_sax_append_string)          |   2508   |    21    | 0/1/0(✖/✖)  |  0/4/0(✖/✖)  |  0/61/0(✓/✓)  |  8/0/0(✖/✖)  | 0/17/15(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/4/0(✓/✓)  |  0/0/0(✖/✖)  |  0/49/0(✓/✓)  |  1/0/0(✖/✖)  | 0/1/0(✓/✓)      | ✖          |     |
| 38  |      CVE-2023-25221       |    AOOB    |      libde265       |    a050853    |   motion.cc (derive_spatial_luma_vector_prediction)    |   2166   |   314    | 0/7/0(✖/✖)  |  0/0/3(✖/✖)  | 0/588/0(✓/✖)  |  8/0/0(✖/✖)  | 0/6/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/2/0(✓/✓)   |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 39  |      CVE-2023-27590       |    AOOB    |        rizin        |    e7eae14    |             profile.c (gdb_to_rz_profile)              |   678    |   125    | 0/0/0(✖/✖)  |  1/1/0(✓/✓)  |  2/39/0(✖/✖)  |  1/0/0(✖/✖)  | 0/1/9(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/1/0(✓/✓)  |  1/15/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 40  |      CVE-2023-34488       |    AOOB    |       NanoNNG       |    bb6f17f    |              mqtt_parser.c (conn_handler)              |   1883   |   169    | 0/11/0(✖/✖) |  0/5/2(✖/✖)  | 0/472/0(✓/✖)  |  4/0/0(✖/✖)  | 0/15/2(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/16/0(✓/✖)  |  2/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 41  |      CVE-2023-36192       |    AOOB    |       sngrep        |    a7b8436    |          capture.c (capture_ws_check_packet)           |   1461   |    98    | 0/14/0(✖/✖) |  0/0/0(✖/✖)  |  0/37/0(✓/✖)  |  6/0/0(✖/✖)  | 0/7/0(✖/✖)      | ✖          |     |
| 42  |      CVE-2023-36193       |    AOOB    |      gifsicle       |    2be438a    |                clp.c (ambiguity_error)                 |   2495   |    45    | 0/13/0(✖/✖) |  0/1/2(✖/✖)  | 0/442/0(✓/✖)  |  3/0/0(✖/✖)  | 0/15/91(✖/✖)    | ✖          |     |
| 43  |      CVE-2023-43361       |    AOOB    |    vorbis-tools     |    7168723    |             platform.c (create_directorie)             |   331    |    70    | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/36/0(✓/✖)  |  0/0/0(✖/✖)  | 0/3/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/3/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 44  |      CVE-2023-47470       |    AOOB    |       FFmpeg        |    5c635b7    |             evc_ps.c (ref_pic_list_struct)             |   409    |    24    | 0/20/0(✖/✖) |  0/0/0(✖/✖)  |  0/37/0(✓/✖)  |  0/0/0(✖/✖)  | 0/5/0(✖/✖)      | ✖          |     |
| 45  |      CVE-2023-48014       |    AOOB    |        gpac         |    cd8a95c    |        av_parsers.c (hevc_parse_vps_extension)         |  12426   |   313    | 0/23/0(✖/✖) | 2/5/14(✖/✖)  | 0/635/0(✓/✖)  | 33/0/0(✓/✖)  | 0/74/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/1/2(✓/✓)  |  0/1/0(✓/✓)   |  1/0/0(✓/✓)  | 0/2/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 46  |      CVE-2020-36646       |     ND     |       ZenLib        |    14b165e    |       Ztring.cpp (Date_From_Seconds_1970_Local)        |   2475   |    34    | 0/2/0(✖/✖)  |  4/2/4(✓/✓)  |  0/96/0(✓/✖)  |  4/0/0(✖/✖)  | 0/15/0(✖/✖)     | ✖          |     |
| 47  |      CVE-2021-46901       |    AOOB    |        6lbr         |    c3092a1    |                httpd.c (httpd_is_file)                 |   293    |    7     | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/4/0(✖/✖)   |  1/0/0(✖/✖)  | 0/1/22(✖/✖)     | ✖          |     |
| 48  |      CVE-2022-46449       |    AOOB    |         MPD         |    c2d0f35    |              Error.hxx (FormatLastError)               |   207    |    17    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |       ✖       |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/6/0(✓/✓)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 49  |       CVE-2023-2617       |     ND     |   opencv_contrib    |    960b3f6    |   decoded_bit_stream_parser.cpp (decodeByteSegment)    |   490    |    43    | 0/3/0(✖/✖)  |  0/0/0(✖/✖)  |  0/5/0(✖/✖)   |  9/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/19/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 50  |      CVE-2023-23108       |     ND     |        crasm        |    932f329    |                    pseudos.c (Xasc)                    |   543    |    57    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/17/0(✓/✓)  |  1/0/0(✖/✖)  | 0/49/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/15/0(✓/✓)  |  1/0/0(✖/✖)  | 0/3/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 51  |      CVE-2023-26917       |     ND     |       libyang       |    7572486    |       parser_common.c (lysp_stmt_validate_value)       |   3574   |   129    | 0/45/0(✖/✖) | 38/1/0(✖/✖)  |  0/41/0(✓/✓)  | 28/0/0(✖/✖)  | 0/3/111(✖/✖)    | ✖          |     |
| 52  |      CVE-2023-29995       |    AOOB    |       NanoNNG       |    1d2a611    |             mqtt_parser.c (copyn_utf8_str)             |   1847   |    30    | 0/12/0(✖/✖) |  0/5/2(✖/✖)  | 0/100/0(✓/✖)  |  4/0/0(✖/✖)  | 0/4/2(✖/✖)      | ✖          |     |
| 53  |      CVE-2023-29996       |     ND     |       NanoNNG       |   f2a4dac0    |          mqtt_parser.c (nmq_unsubinfo_decode)          |   1812   |    76    | 0/12/0(✖/✖) |  0/5/2(✖/✖)  |  0/81/0(✓/✖)  |  4/0/0(✖/✖)  | 0/4/2(✖/✖)      | ✖          |     |
| 54  |      CVE-2023-32307       |    AOOB    |      sofia-sip      |    3f17604    |       stun_common.c (stun_parse_attr_error_code)       |   841    |    21    | 0/3/0(✖/✖)  |  1/0/0(✖/✖)  |  0/29/0(✖/✖)  |  5/0/0(✖/✖)  | 0/21/4(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  1/1/0(✓/✓)   |  0/0/0(✖/✖)  | 0/2/2(✓/✓)      | 1/0/0(✓/✓) |     |
| 55  |      CVE-2023-33659       |    AOOB    |       NanoNNG       |    d9792f5    |           mqtt_parser.c (nmq_subinfo_decode)           |   1871   |   112    | 0/11/0(✖/✖) |  0/5/2(✖/✖)  | 0/137/0(✓/✖)  |  4/0/0(✖/✖)  | 0/4/2(✖/✖)      | ✖          |     |
| 56  |      CVE-2023-33660       |    AOOB    |       NanoNNG       |    d9792f5    |               mqtt_parser.c (copyn_str)                |   1871   |    29    | 0/11/0(✖/✖) |  0/5/2(✖/✖)  |  0/55/0(✓/✖)  |  4/0/0(✖/✖)  | 0/4/2(✖/✖)      | ✖          |     |
| 57  |      CVE-2023-37185       |     ND     |      c-blosc2       |    144ed29    |           blosc2-zfp.c (zfp_prec_decompress)           |   877    |   117    | 0/2/0(✖/✖)  |  8/0/0(✖/✖)  |  1/21/0(✓/✖)  |  2/0/0(✖/✖)  | 0/1/30(✖/✖)     | ✖          |     |
| 58  |      CVE-2023-37186       |     ND     |      c-blosc2       |    425e8a9    |              ndlz8x8.c (ndlz8_decompress)              |   577    |   149    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/136/0(✓/✖)  |  0/0/0(✖/✖)  | 0/6/6(✖/✖)      | ✖          |     |
| 59  |      CVE-2023-37187       |     ND     |      c-blosc2       |    144ed29    |           blosc2-zfp.c (zfp_acc_decompress)            |   877    |    93    | 0/2/0(✖/✖)  |  8/0/0(✖/✖)  |  1/33/0(✓/✖)  |  2/0/0(✖/✖)  | 0/1/30(✖/✖)     | ✖          |     |
| 60  |      CVE-2023-37188       |     ND     |      c-blosc2       |    144ed29    |           blosc2-zfp.c (zfp_rate_decompress)           |   877    |    94    | 0/2/0(✖/✖)  |  8/0/0(✖/✖)  |  1/27/0(✓/✖)  |  2/0/0(✖/✖)  | 0/1/30(✖/✖)     | ✖          |     |
| 61  |      CVE-2023-38313       |     ND     |       OpenNDS       |    8214525    |          http_microhttpd.c (preauthenticated)          |   2102   |   174    | 0/3/0(✖/✖)  |  0/2/4(✖/✖)  | 2/1001/0(✓/✖) |  3/0/0(✖/✖)  | 0/24/4(✖/✖)     | ✖          |     |
| 62  |      CVE-2023-38315       |     ND     |       OpenNDS       |    8214525    |        http_microhttpd.c (try_to_authenticate)         |   2102   |    48    | 0/3/0(✖/✖)  |  0/2/4(✓/✓)  |  0/48/0(✓/✖)  |  3/0/0(✖/✖)  | 0/24/4(✖/✖)     | ✖          |     |
| 63  |      CVE-2023-38320       |     ND     |       OpenNDS       |    99ef4e0    |          http_microhttpd.c (show_preauthpage)          |   2114   |    76    | 0/3/0(✖/✖)  |  0/2/4(✖/✖)  | 0/126/0(✓/✖)  |  3/0/0(✖/✖)  | 0/24/4(✖/✖)     | ✖          |     |
| 64  |      CVE-2023-38322       |     ND     |       OpenNDS       |    99ef4e0    |             http_microhttpd.c (do_binauth)             |   2114   |   118    | 0/3/0(✖/✖)  |  0/2/4(✖/✖)  |  1/52/0(✓/✖)  |  3/0/0(✖/✖)  | 0/24/4(✖/✖)     | ✖          |     |
| 65  |      CVE-2023-38434       |    UAF     |        xhttp        |    72f812d    |                    xhttp.c (xhttp)                     |   1869   |    90    | 0/8/0(✖/✖)  |  2/2/0(✖/✖)  | 9/1126/0(✖/✖) | 13/0/0(✖/✖)  | 0/6/0(✖/✖)      | ✖          |     |
| 66  |      CVE-2023-39125       |    AOOB    |      NTSC-CRT       |    4dd4272    |                   bmp_rw.c (loadBMP)                   |   160    |    40    | 0/10/0(✖/✖) |  3/0/0(✖/✖)  |  0/33/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/6/0(✖/✖)  |  0/0/0(✖/✖)  |  0/14/0(✓/✓)  |  0/0/0(✖/✖)  | 0/2/1(✓/✓)      | 0/0/0(✖/✖) |     |
| 67  |      CVE-2023-39351       |     ND     |       FreeRDP       |    63a2f65    |              rfx.c (rfx_process_message)               |   2121   |    31    | 0/5/0(✖/✖)  |  0/2/4(✖/✖)  | 0/1435/0(✓/✖) |  1/0/0(✖/✖)  | 1/4/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✓/✓)  |  0/0/0(✖/✖)  |  0/4/0(✓/✓)   |  1/0/0(✓/✓)  | 0/2/0(✓/✓)      | 0/0/0(✖/✖) |     |
| 68  |      CVE-2023-40296       |    AOOB    |  async-sockets-cpp  |    d66588d    |                udpsocket.hpp (Receive)                 |   170    |    15    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/54/0(✖/✖)  |  4/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/21/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 69  |      CVE-2023-47016       |    AOOB    |       radare2       |    386d948    |      bin_xnu_kernelcache.c (process_constructors)      |   2219   |    57    | 0/8/0(✖/✖)  |  0/9/3(✖/✖)  |  0/85/0(✓/✖)  |  5/0/0(✖/✖)  | 0/20/3(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/9/0(✓/✓)   |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 70  |      CVE-2023-48105       |    AOOB    | wasm-micro-runtime  |    52db362    |      wasm_loader.c (wasm_loader_prepare_bytecode)      |   9979   |   2947   | 0/13/0(✖/✖) |  2/0/0(✖/✖)  | 0/1260/0(✓/✖) | 24/0/0(✖/✖)  | 1/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/1(✓/✓)  |  0/0/0(✖/✖)  |  0/1/0(✓/✓)   |  1/0/0(✓/✓)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 71  |      CVE-2023-49355       |    AOOB    |         jq          |    88f01a7    |               decNumber.c (decToString)                |   8143   |   146    | 0/24/1(✖/✖) |  2/8/0(✖/✖)  | 0/276/0(✓/✖)  | 24/0/0(✖/✖)  | 0/1/1(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/10/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 72  |       CVE-2023-4504       |    AOOB    |        cups         |    9d57699    |              raster-interpret.c (scan_ps)              |   1724   |   343    | 0/0/0(✖/✖)  |  1/0/0(✖/✖)  | 0/276/0(✓/✖)  |  0/0/0(✖/✖)  | 0/8/3(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/23/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 73  |      CVE-2021-45423       |    AOOB    |        libpe        |    4d9c279    |                 exports.c (pe_exports)                 |   217    |   178    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/132/0(✓/✖)  |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/2/0(✖/✖)  |  0/0/0(✖/✖)  |  0/7/0(✓/✓)   |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 74  |      CVE-2022-43634       |    AOOB    |      netatalk       |    0637355    |              dsi_write.c (dsi_writeinit)               |    79    |    19    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/90/0(✖/✖)  |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/18/0(✓/✖)  |  0/0/0(✖/✖)  | 0/4/2(✖/✖)      | 2/0/0(✓/✓) |     |
| 75  |      CVE-2023-41101       |    AOOB    |       OpenNDS       |    5e04ea1    |             http_microhttpd.c (get_query)              |   2122   |    80    | 0/3/0(✖/✖)  |  0/2/4(✖/✖)  |  1/25/0(✖/✖)  |  3/0/0(✖/✖)  | 0/24/4(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/7/0(✖/✖)   |  0/0/0(✖/✖)  | 0/5/0(✖/✖)      | 3/0/0(✓/✓) |     |
| 76  |      CVE-2023-44709       |     IO     |       plutovg       |    30ccd4d    |           plutovg.c (plutovg_surface_create)           |   654    |    11    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |       ✖       |  0/0/0(✖/✖)  | 0/7/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/35/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 77  |      CVE-2023-49287       |    AOOB    |       tinydir       |    74acffd    |             tinydir.h (tinydir_file_open)              |   838    |   123    | 0/1/1(✖/✖)  |  0/0/0(✖/✖)  |  0/12/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/15/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 78  |      CVE-2023-51771       |    AOOB    |   MicroHttpServer   |    a8ab029    |                server.c (\_ParseHeader)                |   469    |    90    | 0/2/0(✖/✖)  |  0/0/0(✖/✖)  | 0/139/0(✓/✖)  |  1/0/0(✖/✖)  | 0/3/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/17/0(✓/✓)  |  1/0/0(✖/✖)  | 0/2/0(✖/✖)      | 1/0/0(✖/✖) |     |
| 79  |      CVE-2020-25887       |    AOOB    |      mongoose       |   9fe1c93c    |        mg_resolv.c (mg_resolve_from_hosts_file)        |   288    |    38    | 0/1/0(✖/✖)  |  0/1/0(✖/✖)  |  1/6/0(✖/✖)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  1/0/0(✖/✖)  |  0/6/0(✖/✖)   |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
| 80  |      CVE-2022-38072       |    AOOB    |       admesh        |    767a105    |         normals.c (stl_fix_normal_directions)          |   332    |   108    | 0/4/0(✖/✖)  |  0/3/6(✖/✖)  |       ✖       |  2/0/0(✖/✖)  | 0/3/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/16/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 81  |       CVE-2023-0841       |    AOOB    |        gpac         |    ea7395f    |            reframe_mp3.c (mp3_dmx_process)             |   913    |   237    | 0/1/0(✖/✖)  |  0/2/4(✖/✖)  | 0/961/0(✖/✖)  |  1/0/0(✖/✖)  | 0/13/6(✖/✖)     | ✖          |     |
| 82  |      CVE-2023-33457       |    AOOB    |      workflow       |    1601c8b    |                  URIParser.cc (parse)                  |   507    |   153    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/0/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/3/0(✓/✓)  |  0/0/0(✖/✖)  |  0/64/0(✓/✖)  |  1/0/0(✖/✖)  | 0/7/0(✖/✖)      | ✖          |     |
| 83  |      CVE-2023-36239       |    DOS     |       libming       |    6f91d1a    |           parser.c (parseSWF_DEFINEFONTINFO)           |   3411   |    31    | 0/53/0(✓/✖) |  0/0/0(✖/✖)  |  0/60/0(✓/✖)  | 85/0/0(✖/✖)  | 0/86/74(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/3/0(✓/✓)  |  0/0/0(✖/✖)  |  0/77/0(✓/✖)  |  5/0/0(✓/✓)  | 0/8/0(✓/✖)      | 0/0/0(✖/✖) |     |
| 84  |      CVE-2023-37457       |    AOOB    |      asterisk       |    39760d1    |        res_pjsip_header_funcs.c (update_header)        |   1294   |    25    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/8/0(✓/✓)   |  0/0/0(✖/✖)  | 0/3/1(✓/✓)      | 3/0/0(✓/✓) |     |
| 85  |      CVE-2015-10088       |     UB     |        ayttm        |    da8940c    |                 proxy.c (http_connect)                 |   373    |    67    | 0/4/0(✖/✖)  |  0/1/2(✖/✖)  |  1/35/0(✖/✖)  |  3/0/0(✖/✖)  | 0/10/2(✓/✓)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/3/0(✖/✖)   |  0/0/0(✖/✖)  | 0/2/1(✓/✓)      | 0/0/0(✖/✖) |     |
| 86  |      CVE-2023-43887       |    AOOB    |      libde265       |    296503d    |                     pps.cc (dump)                      |   992    |   108    | 0/1/0(✖/✖)  |  0/5/0(✖/✖)  |       ✖       |  1/0/0(✖/✖)  | 0/8/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/6/0(✓/✖)   |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 87  |      CVE-2020-28840       |    AOOB    |        jhead        |    e64e904    |                jpgfile.c (process_COM)                 |   775    |    31    | 0/31/0(✖/✖) | 0/6/12(✖/✖)  |  0/16/0(✓/✖)  |  4/0/0(✖/✖)  | 0/5/4(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/6/0(✓/✓)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 88  |      CVE-2021-33983       |    AOOB    |       flatcc        |    e926d38    |                parser.c (error_ref_sym)                |   1543   |    31    | 0/8/0(✓/✓)  |  0/1/3(✖/✖)  |       ✖       |  5/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/13/0(✓/✖)  |  3/0/0(✓/✓)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 89  |      CVE-2022-33065       |     IO     |     libsndfile      |    c7b69d7    |               mat4.c (mat4_read_header)                |   390    |   127    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  2/2/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     | Extracted (not sanitized) |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  1/5/0(✓/✓)   |  4/0/0(✓/✓)  | 0/1/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 90  |      CVE-2022-47087       |    AOOB    |        gpac         |    73a8c42    |       av_parsers.c (gf_vvc_read_pps_bs_internal)       |  12296   |   249    | 0/22/0(✖/✖) | 0/7/18(✖/✖)  | 0/509/0(✓/✖)  | 35/0/0(✖/✖)  | 0/74/25(✖/✖)    | ✖          |     |
| 91  |      CVE-2022-47088       |    AOOB    |        gpac         |    73a8c42    |       av_parsers.c (gf_vvc_read_pps_bs_internal)       |  12296   |   249    | 0/22/0(✖/✖) | 0/7/18(✖/✖)  | 0/509/0(✓/✖)  | 35/0/0(✖/✖)  | 0/74/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/24/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 92  |      CVE-2022-47089       |    AOOB    |        gpac         |    15e3aec    |       av_parsers.c (gf_vvc_read_sps_bs_internal)       |  12296   |   388    | 0/22/0(✖/✖) | 2/7/18(✖/✖)  | 2/761/0(✓/✖)  | 35/0/0(✖/✖)  | 0/75/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/4/0(✖/✖)  |  0/0/0(✖/✖)  |  0/7/0(✖/✖)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 93  |      CVE-2022-47091       |    AOOB    |        gpac         |    4876076    |           load_text.c (gf_text_process_sub)            |   4415   |   120    | 0/10/0(✖/✖) | 0/11/6(✖/✖)  | 7/850/0(✓/✖)  |  2/0/0(✖/✖)  | 0/32/2(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/22/0(✓/✖)  |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 94  |      CVE-2022-47095       |  IO/AOOB   |        gpac         |    6ddedfb    |        av_parsers.c (hevc_parse_vps_extension)         |  12339   |   306    | 0/22/0(✖/✖) | 2/7/18(✖/✖)  | 0/623/0(✓/✖)  | 35/0/0(✖/✖)  | 0/75/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/6/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 95  |      CVE-2022-47653       |    AOOB    |        gpac         |    007bf61    |          av_parsers.c (eac3_update_channels)           |  12345   |    14    | 0/22/0(✖/✖) | 2/7/18(✖/✖)  |  0/47/0(✓/✖)  | 35/0/0(✖/✖)  | 0/75/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/1/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 96  |      CVE-2022-47654       |    AOOB    |        gpac         |    a1e1975    |      av_parsers.c (gf_hevc_read_sps_bs_internal)       |  12346   |   276    | 0/22/0(✖/✖) | 2/7/18(✖/✖)  | 0/767/0(✓/✖)  | 35/0/0(✖/✖)  | 0/75/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/7/0(✓/✖)   |  1/0/0(✖/✖)  | 0/1/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 97  |      CVE-2022-47656       |    AOOB    |        gpac         |    1967ff2    |      av_parsers.c (gf_hevc_read_sps_bs_internal)       |  12371   |   282    | 0/22/0(✖/✖) | 2/6/16(✖/✖)  | 0/772/0(✓/✖)  | 35/0/0(✖/✖)  | 0/74/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/9/0(✓/✖)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 98  |      CVE-2022-47657       |    AOOB    |        gpac         |    348d772    |        av_parsers.c (hevc_parse_vps_extension)         |  12377   |   308    | 0/22/0(✖/✖) | 2/6/16(✖/✖)  | 0/619/0(✓/✖)  | 35/0/0(✖/✖)  | 0/74/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/18/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 99  |      CVE-2022-47658       |    AOOB    |        gpac         |    9f1e633    |      av_parsers.c (gf_hevc_read_vps_bs_internal)       |  12382   |   107    | 0/22/0(✖/✖) | 2/6/16(✖/✖)  | 0/778/0(✓/✖)  | 35/0/0(✖/✖)  | 0/74/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/17/0(✓/✖)  |  3/0/0(✓/✓)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 100 |      CVE-2022-47660       |     IO     |        gpac         |    55c8b3a    |        isom_write.c (gf_isom_shift_cts_offset)         |   8864   |    17    | 0/7/0(✖/✖)  | 6/11/19(✖/✖) |  0/93/0(✓/✖)  | 14/0/0(✖/✖)  | 0/28/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/1/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 101 |      CVE-2022-47663       |    AOOB    |        gpac         |    080a627    |            reframe_h263.c (h263dmx_process)            |   759    |    58    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/784/0(✓/✖)  |  0/0/0(✖/✖)  | 0/8/1(✖/✖)      | ✖          |     |
| 102 |       CVE-2023-0866       |    AOOB    |        gpac         |    be9f8d3    |           reframe_adts.c (adts_dmx_process)            |   1040   |    67    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/1513/0(✓/✖) |  0/0/0(✖/✖)  | 0/5/0(✖/✖)      | ✖          |     |
| 103 |       CVE-2023-0996       |    AOOB    |       libheif       |    f61fe73    |            heif_emscripten.h (strided_copy)            |   304    |    14    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/25/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 1/0/0(✓/✓)  |  0/0/0(✖/✖)  |  0/4/0(✓/✓)   |  0/0/0(✖/✖)  | 0/2/2(✓/✓)      | 1/0/0(✓/✓) |     |
| 104 |       CVE-2023-1190       |    AOOB    |      imageinfo      |    ea3eb17    |             imageinfo.hpp (IIProcessFunc)              |   1468   |    81    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/0/0(✖/✖)   |  1/0/0(✖/✖)  | 0/26/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/56/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 105 |       CVE-2023-1448       |    AOOB    |        gpac         |    a5efec8    |             mpegts.c (gf_m2ts_process_sdt)             |   3363   |    94    | 0/2/0(✖/✖)  |  0/1/0(✖/✖)  | 0/214/0(✓/✖)  | 10/0/0(✖/✖)  | 0/76/6(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/3/0(✓/✓)  |  0/0/0(✖/✖)  |  0/20/0(✓/✖)  |  2/0/0(✖/✖)  | 0/2/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 106 |       CVE-2023-1452       |    AOOB    |        gpac         |    7460cb3    |          load_text.c (gf_text_get_UTF8_line)           |   4539   |    85    | 0/9/0(✖/✖)  | 0/11/6(✖/✖)  | 0/106/0(✓/✖)  |  3/0/0(✖/✖)  | 0/33/2(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/19/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 107 |      CVE-2023-23143       |    AOOB    |        gpac         |    78b76fa    |             av_parsers.c (avc_parse_slice)             |  12386   |   108    | 0/22/0(✖/✖) | 2/6/16(✓/✓)  | 0/339/0(✓/✖)  | 35/0/0(✖/✖)  | 0/74/25(✖/✖)    | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/1/2(✓/✓)  |  0/5/0(✓/✓)   |  1/0/0(✓/✓)  | 0/1/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 108 |      CVE-2023-26733       |     ND     |      TinyTIFF       |    f13ce29    |    tinytiffreader.c (TinyTIFFReader_readNextFrame)     |   1054   |   113    | 0/4/0(✖/✖)  |  0/1/3(✖/✖)  | 0/319/0(✖/✖)  | 21/0/0(✖/✖)  | 0/16/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/5/0(✓/✓)  |  0/0/0(✖/✖)  |  0/40/0(✓/✓)  |  0/0/0(✖/✖)  | 0/14/4(✓/✖)     | 0/0/0(✖/✖) |     |
| 109 |      CVE-2023-29596       |     UB     |        cmix         |    24bf476    |                 paq8.cpp (ConvertUTF8)                 |   8384   |    11    | 0/40/0(✖/✖) |      ✖       |       ✖       | 165/0/0(✖/✖) | 0/18/6(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/8/0(✖/✖)   |  0/0/0(✖/✖)  | 0/3/1(✓/✓)      | 0/0/0(✖/✖) |     |
| 110 |      CVE-2023-33204       |     IO     |       sysstat       |    c43167c    |               common.c (check_overflow)                |   1748   |    13    | 0/1/0(✖/✖)  |  1/0/0(✖/✖)  |  0/4/0(✓/✓)   |  0/0/0(✖/✖)  | 0/8/0(✖/✖)      | ✖          |     |
|     | Extracted (not sanitized) |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/15/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 111 |      CVE-2023-36183       |    AOOB    |     OpenImageIO     |    1cd0d0a    |                 icoinput.cpp (readimg)                 |   439    |   129    | 0/0/0(✖/✖)  |      ✖       |       ✖       |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/2/0(✖/✖)  |  0/0/0(✖/✖)  |  0/23/0(✖/✖)  |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | ✖          |     |
| 112 |      CVE-2023-36243       |     ND     |       flvmeta       |    1c9cee8    |         dump_xml.c (xml_on_metadata_tag_only)          |   307    |    15    | 0/0/0(✖/✖)  |  0/9/0(✖/✖)  |  0/67/0(✓/✖)  |  0/0/0(✖/✖)  | 0/10/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/30/0(✓/✓)  |  3/0/0(✖/✖)  | 0/3/0(✓/✓)      | 1/0/0(✓/✓) |     |
| 113 |      CVE-2023-45681       |    AOOB    |         stb         |    5736b15    |              stb_vorbis.c (start_decoder)              |   5584   |   627    | 0/18/1(✖/✖) |  1/4/0(✖/✖)  |       ✖       |  2/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/34/0(✓/✖)  |  2/0/0(✓/✓)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 114 |      CVE-2023-46228       |  IO/AOOB   |       zchunk        |    67f921e    |               comp.c (comp_add_to_data)                |   750    |    18    | 0/4/0(✖/✖)  |  0/2/4(✖/✖)  |  0/55/0(✓/✖)  |  1/0/0(✖/✖)  | 0/12/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/3/0(✖/✖)  |  0/0/0(✖/✖)  |  0/30/0(✓/✖)  |  4/0/0(✓/✓)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 115 |      CVE-2023-42801       |    AOOB    | moonlight-common-c  |    8b84d17    |         Misc.c (extractVersionQuadFromString)          |   161    |    31    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/13/0(✖/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/16/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 116 |      CVE-2020-20335       |  IO/AOOB   |        kilo         |    0099562    |                kilo.c (editorUpdateRow)                |   1299   |    25    | 0/7/0(✖/✖)  |  0/0/0(✖/✖)  |  4/94/0(✖/✖)  |  9/0/0(✖/✖)  | 0/8/0(✖/✖)      | 0/0/0(✖/✖) |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/4/0(✖/✖)  |  0/0/0(✖/✖)  |  0/36/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✖/✖) |     |
| 117 |      CVE-2021-46896       |    AOOB    |    PX4-Autopilot    |    31a599f    |        mavlink_receiver.cpp (handle_message...)        |   3582   |    40    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/4/0(✓/✓)   |  0/0/0(✖/✖)  | 0/1/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 118 |       CVE-2022-4899       |    AOOB    |        zstd         |    1b445c1    |               util.c (mallocAndJoin2Dir)               |   1412   |    27    | 0/7/0(✖/✖)  |  0/0/0(✖/✖)  |  0/21/0(✓/✖)  |  4/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/23/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 119 |      CVE-2023-26767       |    AOOB    |      liblouis       |    3071eb6    |      compileTranslationTable.c (lou_setDataPath)       |   5340   |    9     | 0/80/0(✖/✖) | 0/15/26(✖/✖) |  0/3/0(✖/✖)   | 62/0/0(✖/✖)  | 0/13/6(✖/✖)     | ✖          |     |
| 120 |      CVE-2023-26768       |    AOOB    |      liblouis       |    517f6f1    |                logging.c (lou_logFile)                 |   160    |    16    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/12/0(✖/✖)  |  0/0/0(✖/✖)  | 0/3/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/23/0(✖/✖)  |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 121 |      CVE-2023-26769       |    AOOB    |      liblouis       |    21a2ee7    |      compileTranslationTable.c (resolveSubtable)       |   5340   |    69    | 0/80/0(✖/✖) | 0/15/26(✖/✖) |  0/36/0(✖/✖)  | 62/0/0(✖/✖)  | 0/13/6(✖/✖)     | ✖          |     |
| 122 |      CVE-2023-27585       |    AOOB    |      pjproject      |    5e2d564    |                    dns.c (parse_rr)                    |   772    |   137    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/274/0(✖/✖)  |  7/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/3/0(✓/✓)  |  0/0/0(✖/✖)  |  0/33/0(✓/✖)  |  1/0/0(✖/✖)  | 0/1/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 123 |      CVE-2023-36321       |    AOOB    |     dlt-daemon      |    198715e    |            dlt_common.c (dlt_file_message)             |   4310   |    35    | 0/29/0(✖/✖) |  2/6/0(✖/✖)  | 0/434/0(✓/✖)  |  7/0/0(✖/✖)  | 0/4/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/9/0(✓/✖)  |  0/0/0(✖/✖)  |  0/30/0(✓/✖)  |  3/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 124 |      CVE-2023-38403       |     IO     |        iperf        |    b4878b3    |                iperf_api.c (JSON_read)                 |   4938   |    38    |      ✖      |  0/3/2(✖/✖)  |  0/7/0(✓/✖)   |  7/0/0(✖/✖)  | 0/58/2(✖/✖)     | ✖          |     |
| 125 |      CVE-2023-40589       |    AOOB    |       FreeRDP       |    1bbed81    |              ncrush.c (ncrush_decompress)              |   2966   |   263    | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  | 5/256/0(✓/✖)  | 11/0/0(✓/✓)  | 0/0/0(✖/✖)      | ✖          |     |
| 126 |      CVE-2023-46852       |    AOOB    |      memcached      |    bc11696    |         proto_proxy.c (proxy_process_command)          |   1051   |   206    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/850/0(✓/✖)  |  5/0/0(✖/✖)  | 0/2/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/79/0(✓/✖)  |  0/0/0(✖/✖)  | 0/2/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 127 |      CVE-2022-47092       |     IO     |        gpac         |    1918a58    |      av_parsers.c (gf_hevc_read_sps_bs_internal)       |  12341   |   272    | 0/22/0(✖/✖) | 2/7/18(✖/✖)  | 0/760/0(✓/✖)  | 35/0/0(✖/✖)  | 0/75/25(✖/✖)    | ✖          |     |
| 128 |       CVE-2023-2977       |    AOOB    |       OpenSC        |   tfe7cb49    |     pkcs15-cardos.c (cardos_have_verifyrc_package)     |   942    |    49    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 1/0/0(✓/✓)  |  0/0/0(✖/✖)  |  4/33/0(✓/✓)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 129 |      CVE-2023-42295       |     IO     |     OpenImageIO     |    c7f8169    |             bmpinput.cpp (read_rle_image)              |   556    |    81    | 0/0/0(✖/✖)  |      ✖       |       ✖       |  0/0/0(✖/✖)  | 0/0/1(✖/✖)      | ✖          |     |
| 130 |      CVE-2023-22741       |    AOOB    |      sofia-sip      |    2cb3820    |          stun_common.c (stun_parse_attribute)          |   828    |    85    | 0/3/0(✖/✖)  |  1/0/0(✖/✖)  |  8/92/0(✓/✖)  |  5/0/0(✖/✖)  | 0/18/3(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/25/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 131 |      CVE-2023-23086       |    AOOB    |      MojoJson       |    be503f8    |                  Json.c (SkipString)                   |   961    |    27    | 0/3/0(✖/✖)  |  0/0/0(✖/✖)  |  0/19/0(✖/✖)  |  0/0/0(✖/✖)  | 0/1/1(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/19/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 132 |       CVE-2023-4322       |    AOOB    |       radare2       |    78fafcb    |                   plugin.c (decode)                    |   333    |   123    | 0/2/0(✖/✖)  |  0/4/8(✖/✖)  | 0/196/0(✓/✖)  |  1/0/0(✖/✖)  | 0/7/2(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/10/0(✓/✓)  |  0/0/0(✖/✖)  | 0/3/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 133 |      CVE-2023-23088       |    AOOB    |     json-parser     |    fc599bf    |         json_parser.c (\_\_parse_json_members)         |   1075   |    58    | 0/55/0(✖/✖) |  0/0/0(✖/✖)  | 1/316/0(✓/✖)  |  4/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/2/0(✓/✓)  |  0/0/0(✖/✖)  |  0/3/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 134 |      CVE-2023-45664       |    UAF     |         stb         |    5736b15    |          stb_image.h (stbi\_\_load_gif_main)           |   7987   |    84    | 0/14/0(✖/✖) |  2/0/3(✖/✖)  | 0/326/0(✖/✖)  | 0/22/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/2/0(✓/✓)  |  0/0/0(✖/✖)  |  0/19/0(✖/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 135 |      CVE-2023-36273       |    AOOB    |      libredwg       |    77a8562    |                 bits.c (bit_calc_CRC)                  |   3639   |    46    |      -      |      -       |       -       |      -       | -               | -          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/3/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 136 |      CVE-2023-49465       |    AOOB    |      libde265       |    7065a53    |   motion.cc (derive_spatial_luma_vector_prediction)    |   2204   |   334    | 8/0/0(✖/✖)  |  0/0/3(✖/✖)  | 0/614/0(✖/✖)  | 10/0/0(✖/✖)  | 0/7/0(✖/✖)      | ✖          |     |
| 137 |      CVE-2023-49467       |    AOOB    |      libde265       |    7065a53    |     motion.cc (derive_combined_bipredictive\_...)      |   2204   |    65    | 8/0/0(✖/✖)  |  0/0/3(✖/✖)  | 0/140/0(✓/✖)  | 10/0/0(✖/✖)  | 0/7/0(✖/✖)      | ✖          |     |
| 138 |      CVE-2020-18831       |    AOOB    |        exiv2        |    109d5df    |             pngimage.cpp (printStructure)              |   747    |   178    | 0/2/0(✖/✖)  |  0/0/0(✖/✖)  |       ✖       |  4/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/98/0(✓/✖)  |  2/0/0(✖/✖)  | 0/4/0(✖/✖)      | ✖          |     |
| 139 |      CVE-2021-32142       |    AOOB    |       LibRaw        |    1dbed6b    | libraw_datastream.cpp (LibRaw_buffer_datastream::gets) |   1045   |    25    | 1/0/0(✖/✖)  |  0/0/0(✖/✖)  |       ✖       |      ✖       | 1/4/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/26/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 140 |      CVE-2023-28753       |    AOOB    |      netconsd       |    94f035b    |             libncrx.c (ncrx_queue_payload)             |   813    |    84    | 0/9/22(✖/✖) |  0/0/0(✖/✖)  | 6/482/0(✓/✖)  |  3/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  1/25/0(✓/✖)  |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 141 |      CVE-2023-31470       |    AOOB    |      smartdns       |    e38d5ea    |              dns.c (\_dns_encode_domain)               |   2650   |    51    | 0/19/0(✖/✖) |  1/0/0(✖/✖)  | 0/203/0(✖/✖)  |  0/0/0(✖/✖)  | 10/0/0(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/73/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 142 |      CVE-2023-46256       |    AOOB    |    PX4-Autopilot    |    3c129ae    |             parser.cpp (lightware_parser)              |   155    |    95    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  | 0/128/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/22/0(✓/✖)  |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 143 |      CVE-2023-38632       |    AOOB    |  async-sockets-cpp  |    d66588d    |                tcpsocket.hpp (Receive)                 |   129    |    22    | 0/0/0(✖/✖)  |  0/1/2(✖/✖)  |  0/59/0(✖/✖)  |  6/0/0(✖/✖)  | 0/1/0(✖/✖)      | ✖          |     |
| 144 |      CVE-2023-46932       |    AOOB    |        gpac         |    f181717    |            avilib.c (avi_parse_input_file)             |   3168   |   889    | 0/9/6(✖/✖)  | 11/4/15(✖/✖) | 0/3340/0(✓/✖) | 36/0/0(✖/✖)  | 0/13/4(✖/✖)     | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/25/0(✖/✖)  |  2/0/0(✖/✖)  | 0/0/0(✖/✖)      | 2/0/0(✓/✓) |     |
| 145 |      CVE-2023-29421       |    AOOB    |        bzip3        |    8d433c4    |              libbz3.c (bz3_decode_block)               |   907    |   115    | 0/3/0(✖/✖)  |  0/0/0(✖/✖)  | 0/499/0(✖/✖)  |  8/0/0(✖/✖)  | 0/9/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/10/0(✓/✖)  |  1/0/0(✖/✖)  | 0/1/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 146 |      CVE-2023-29584       |    AOOB    |        mp4v2        |    cfc394d    |           mp4.cpp (MP4GetVideoProfileLevel)            |   4703   |    44    | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/80/0(✖/✖)  |  3/0/0(✖/✖)  | 0/9/2(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  1/7/0(✓/✓)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 147 |      CVE-2023-31567       |    AOOB    |       podofo        |    90ccd75    |       PdfEncrypt.cpp (function: PdfEncryptAESV3)       |   2011   |    16    | 0/26/3(✖/✖) |  0/7/0(✖/✖)  |       ✖       | 24/0/0(✖/✖)  | 0/0/4(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/0/0(✖/✖)   |  1/0/0(✖/✖)  | 0/0/0(✖/✖)      | ✖          |     |
| 148 |      CVE-2023-31976       |    AOOB    |       libming       |    04aee52    |             makeswf.c (makeswf_preprocess)             |   311    |    25    | 0/3/0(✖/✖)  |  0/0/0(✖/✖)  |  0/7/0(✖/✖)   |  0/0/0(✖/✖)  | 0/2/1(✓/✓)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/0/0(✖/✖)  |  0/0/0(✖/✖)  |  0/5/0(✖/✖)   |  0/0/0(✖/✖)  | 0/0/0(✖/✖)      | 0/0/0(✖/✖) |     |
| 149 |      CVE-2023-36272       |    AOOB    |      libredwg       |    77a8562    |                bits.c (bit_utf8_to_TU)                 |   3639   |    78    | 0/12/0(✖/✖) | 10/0/4(✖/✖)  | 0/103/0(✓/✖)  |  7/0/0(✓/✓)  | 0/5/0(✖/✖)      | ✖          |     |
|     |         Extracted         |            |                     |               |                           -                            |    -     |          | 0/1/0(✖/✖)  |  0/0/0(✖/✖)  |  0/37/0(✓/✓)  |  2/0/0(✓/✓)  | 0/0/0(✖/✖)      | 1/0/0(✓/✓) |     |
| 150 |      CVE-2023-36274       |    AOOB    |      libredwg       |    77a8562    |                 bits.c (bit_write_TF)                  |   3639   |    26    | 0/12/0(✖/✖) | 10/0/4(✖/✖)  | 0/280/0(✓/✖)  |  7/0/0(✖/✖)  | 0/5/0(✖/✖)      | ✖          |     |

No cross Cross Translation Unit (CTU) analysis was performed because not all static code analyzers support it.

Notes:

- 8, 84, 117, 128\*
  - Config
- 11, 22, 86, 135\*
  - CTU
- 17\*
  - strange false positive of clang on simple case
- 46\*
  - in order to analyze using ikos function had to be a little bit changed. Function was changed from method to a function and all references to 'this' were removed.
- 48\*
  - modifications to haeder file were made to make it possible to analyze it. Vulnerable method that changed to not use any windows api constructs as well as was extracted to not be between #ifdef \_WIN directives
- 69, 143\*
  - analyzed were tcp-client.cpp and udp-client.cpp and only telemetry from .hpp files were recorded
- 69\*
  - static code analyzer notifications were counter from file bin_xnu_kernelcache.c as well as from r_endian.h where the out of bound access actually happens
- 70\*
  - while loop where is vulnerability takes 2812 code rows WOW.
- 77\*
  - analyzed was not header file itself but rather one of the examples (samples/file_open_sample.c) that directly called vulnerable function. Only error notifications from tinydir.h file were taken into account when composing the table
- 102,101\*
  - I know the line where vulnerability happens but because it happens at the end of a complex logic it is hard to reproduce the error.
- 103\*
  - Function strided_copy was tested in isolation mainly because header files can not be directly analyzed by some static code analyzers
- 104\*
  - ikos analyzed main.cpp that references the header file with implementations (imageinfo.hpp) but only errors/warnings/notes from header file were recorded.
    Other analyzers analyzed imageinfo.hpp file directly.
    Also strange observation when infer analyzes hpp file directly it finds only 1 error but when analyzing main.cpp file 3 errors are found and 2 additional errors are completly valid.
- 115(exract)\*
  - it is fashinating how no one can detect such a basic problem. Same goes to frr.c file
- 116\*
  - analyzed was entry point eg. main function (one file project)
- 122(extract)\*
  - Extremly confusing infer error on extracted version. Infer also threw confusion errors on other occasions but this is the pinnacle of confusion
- 128\*
  - this vulnerability requires CTU because function with flaw in its logic does not access pointer memory and only passes pointer with incorrect length to another function located in a different file...
- 133\*
  - analyzed was main entry point function json_value_parse rather then \_\_parse_json_members that contains the vulnerable logic. This was done because actual dereference of a out of bound pointer happens in json_value_parse
    function and loginc in \_\_parse_json_members only makes this pointer out of bound.
- 134\*
  - an entry point file was created with contents that would trigger vulnerability that is provided in [this](https://securitylab.github.com/advisories/GHSL-2023-145_GHSL-2023-151_stb_image_h/) article under issue 4
- 149\*
  - ikos reports impossible warning like 'if (len > 0) len--' such statement can not cause unsigned integer overflow.
