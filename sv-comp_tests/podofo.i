
namespace std
{
  typedef unsigned int size_t;
  typedef int ptrdiff_t;
  typedef decltype(nullptr) nullptr_t;
}
namespace std
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
namespace __gnu_cxx
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
typedef unsigned int size_t;

extern "C" {
typedef float _Float32;
typedef double _Float64;
typedef double _Float32x;
typedef long double _Float64x;
typedef struct
  {
    int quot;
    int rem;
  } div_t;
typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;
__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
extern size_t __ctype_get_mb_cur_max (void) noexcept (true) ;
extern double atof (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern int atoi (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern long int atol (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
__extension__ extern long long int atoll (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern _Float32 strtof32 (const char *__restrict __nptr,
     char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern _Float64 strtof64 (const char *__restrict __nptr,
     char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern _Float32x strtof32x (const char *__restrict __nptr,
       char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern _Float64x strtof64x (const char *__restrict __nptr,
       char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern int strfromd (char *__dest, size_t __size, const char *__format,
       double __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
extern int strfromf (char *__dest, size_t __size, const char *__format,
       float __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
extern int strfroml (char *__dest, size_t __size, const char *__format,
       long double __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
extern int strfromf32 (char *__dest, size_t __size, const char * __format,
         _Float32 __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
extern int strfromf64 (char *__dest, size_t __size, const char * __format,
         _Float64 __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
extern int strfromf32x (char *__dest, size_t __size, const char * __format,
   _Float32x __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
extern int strfromf64x (char *__dest, size_t __size, const char * __format,
   _Float64x __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
struct __locale_struct
{
  struct __locale_data *__locales[13];
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;
  const char *__names[13];
};
typedef struct __locale_struct *__locale_t;

typedef __locale_t locale_t;

extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     locale_t __loc) noexcept (true) __attribute__ ((__nonnull__ (1, 4)));
extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 4)));
__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 4)));
__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 4)));
extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern _Float32 strtof32_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern _Float64 strtof64_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern _Float32x strtof32x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern _Float64x strtof64x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
extern char *l64a (long int __n) noexcept (true) ;
extern long int a64l (const char *__s)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern "C" {
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
__extension__ typedef signed long long int __int64_t;
__extension__ typedef unsigned long long int __uint64_t;
typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;
__extension__ typedef long long int __quad_t;
__extension__ typedef unsigned long long int __u_quad_t;
__extension__ typedef long long int __intmax_t;
__extension__ typedef unsigned long long int __uintmax_t;
__extension__ typedef __uint64_t __dev_t;
__extension__ typedef unsigned int __uid_t;
__extension__ typedef unsigned int __gid_t;
__extension__ typedef unsigned long int __ino_t;
__extension__ typedef __uint64_t __ino64_t;
__extension__ typedef unsigned int __mode_t;
__extension__ typedef unsigned int __nlink_t;
__extension__ typedef long int __off_t;
__extension__ typedef __int64_t __off64_t;
__extension__ typedef int __pid_t;
__extension__ typedef struct { int __val[2]; } __fsid_t;
__extension__ typedef long int __clock_t;
__extension__ typedef unsigned long int __rlim_t;
__extension__ typedef __uint64_t __rlim64_t;
__extension__ typedef unsigned int __id_t;
__extension__ typedef long int __time_t;
__extension__ typedef unsigned int __useconds_t;
__extension__ typedef long int __suseconds_t;
__extension__ typedef __int64_t __suseconds64_t;
__extension__ typedef int __daddr_t;
__extension__ typedef int __key_t;
__extension__ typedef int __clockid_t;
__extension__ typedef void * __timer_t;
__extension__ typedef long int __blksize_t;
__extension__ typedef long int __blkcnt_t;
__extension__ typedef __int64_t __blkcnt64_t;
__extension__ typedef unsigned long int __fsblkcnt_t;
__extension__ typedef __uint64_t __fsblkcnt64_t;
__extension__ typedef unsigned long int __fsfilcnt_t;
__extension__ typedef __uint64_t __fsfilcnt64_t;
__extension__ typedef int __fsword_t;
__extension__ typedef int __ssize_t;
__extension__ typedef long int __syscall_slong_t;
__extension__ typedef unsigned long int __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef char *__caddr_t;
__extension__ typedef int __intptr_t;
__extension__ typedef unsigned int __socklen_t;
typedef int __sig_atomic_t;
__extension__ typedef __int64_t __time64_t;
typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __ino64_t ino64_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __off_t off_t;
typedef __off64_t off64_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __ssize_t ssize_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;

typedef __clockid_t clockid_t;
typedef __time_t time_t;
typedef __timer_t timer_t;
typedef __useconds_t useconds_t;
typedef __suseconds_t suseconds_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;
typedef int register_t __attribute__ ((__mode__ (__word__)));
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{
  return ((__uint16_t) ((((__bsx) >> 8) & 0xff) | (((__bsx) & 0xff) << 8)));
}
static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{
  return ((((__bsx) & 0xff000000u) >> 24) | (((__bsx) & 0x00ff0000u) >> 8) | (((__bsx) & 0x0000ff00u) << 8) | (((__bsx) & 0x000000ffu) << 24));
}
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return ((((__bsx) & 0xff00000000000000ull) >> 56) | (((__bsx) & 0x00ff000000000000ull) >> 40) | (((__bsx) & 0x0000ff0000000000ull) >> 24) | (((__bsx) & 0x000000ff00000000ull) >> 8) | (((__bsx) & 0x00000000ff000000ull) << 8) | (((__bsx) & 0x0000000000ff0000ull) << 24) | (((__bsx) & 0x000000000000ff00ull) << 40) | (((__bsx) & 0x00000000000000ffull) << 56));
}
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}
static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}
static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
typedef __sigset_t sigset_t;
struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};

struct timespec
{
  __time_t tv_sec;
  __syscall_slong_t tv_nsec;
};
typedef long int __fd_mask;
typedef struct
  {
    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
  } fd_set;
typedef __fd_mask fd_mask;
extern "C" {
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
}
typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;

typedef union
{
  __extension__ unsigned long long int __value64;
  struct
  {
    unsigned int __low;
    unsigned int __high;
  } __value32;
} __atomic_wide_counter;
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;
  int __kind;
  unsigned int __nusers;
  __extension__ union
  {
    struct
    {
      short __espins;
      short __eelision;
    } __elision_data;
    __pthread_slist_t __list;
  };
};
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;
  unsigned char __flags;
  unsigned char __shared;
  signed char __rwelision;
  unsigned char __pad2;
  int __cur_writer;
};
struct __pthread_cond_s
{
  __atomic_wide_counter __wseq;
  __atomic_wide_counter __g1_start;
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
typedef unsigned int __tss_t;
typedef unsigned long int __thrd_t;
typedef struct
{
  int __data ;
} __once_flag;
typedef unsigned long int pthread_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
union pthread_attr_t
{
  char __size[36];
  long int __align;
};
typedef union pthread_attr_t pthread_attr_t;
typedef union
{
  struct __pthread_mutex_s __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;
typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;
typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[32];
  long int __align;
} pthread_rwlock_t;
typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
  char __size[20];
  long int __align;
} pthread_barrier_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
}
extern long int random (void) noexcept (true);
extern void srandom (unsigned int __seed) noexcept (true);
extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) noexcept (true) __attribute__ ((__nonnull__ (2)));
extern char *setstate (char *__statebuf) noexcept (true) __attribute__ ((__nonnull__ (1)));
struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };
extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     noexcept (true) __attribute__ ((__nonnull__ (2)));
extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     noexcept (true) __attribute__ ((__nonnull__ (2, 4)));
extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int rand (void) noexcept (true);
extern void srand (unsigned int __seed) noexcept (true);
extern int rand_r (unsigned int *__seed) noexcept (true);
extern double drand48 (void) noexcept (true);
extern double erand48 (unsigned short int __xsubi[3]) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern long int lrand48 (void) noexcept (true);
extern long int nrand48 (unsigned short int __xsubi[3])
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern long int mrand48 (void) noexcept (true);
extern long int jrand48 (unsigned short int __xsubi[3])
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern void srand48 (long int __seedval) noexcept (true);
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) noexcept (true) __attribute__ ((__nonnull__ (1)));
struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;
  };
extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     noexcept (true) __attribute__ ((__nonnull__ (2)));
extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern void *malloc (size_t __size) noexcept (true) __attribute__ ((__malloc__))
                                         ;
extern void *calloc (size_t __nmemb, size_t __size)
     noexcept (true) __attribute__ ((__malloc__)) ;
extern void *realloc (void *__ptr, size_t __size)
     noexcept (true) __attribute__ ((__warn_unused_result__)) ;
extern void free (void *__ptr) noexcept (true);
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     noexcept (true) __attribute__ ((__warn_unused_result__))
                       ;
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     noexcept (true) ;

extern "C" {
extern void *alloca (size_t __size) noexcept (true);
}
extern void *valloc (size_t __size) noexcept (true) __attribute__ ((__malloc__))
                                         ;
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     noexcept (true) __attribute__ ((__nonnull__ (1))) ;
extern void *aligned_alloc (size_t __alignment, size_t __size)
     noexcept (true) __attribute__ ((__malloc__)) __attribute__ ((__alloc_align__ (1)))
                                         ;
extern void abort (void) noexcept (true) __attribute__ ((__noreturn__));
extern int atexit (void (*__func) (void)) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern "C++" int at_quick_exit (void (*__func) (void))
     noexcept (true) __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern void exit (int __status) noexcept (true) __attribute__ ((__noreturn__));
extern void quick_exit (int __status) noexcept (true) __attribute__ ((__noreturn__));
extern void _Exit (int __status) noexcept (true) __attribute__ ((__noreturn__));
extern char *getenv (const char *__name) noexcept (true) __attribute__ ((__nonnull__ (1))) ;
extern char *secure_getenv (const char *__name)
     noexcept (true) __attribute__ ((__nonnull__ (1))) ;
extern int putenv (char *__string) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern int setenv (const char *__name, const char *__value, int __replace)
     noexcept (true) __attribute__ ((__nonnull__ (2)));
extern int unsetenv (const char *__name) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern int clearenv (void) noexcept (true);
extern char *mktemp (char *__template) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
extern char *mkdtemp (char *__template) noexcept (true) __attribute__ ((__nonnull__ (1))) ;
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
extern int system (const char *__command) ;
extern char *canonicalize_file_name (const char *__name)
     noexcept (true) __attribute__ ((__nonnull__ (1))) __attribute__ ((__malloc__))
                              ;
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) noexcept (true) ;
typedef int (*__compar_fn_t) (const void *, const void *);
typedef __compar_fn_t comparison_fn_t;
typedef int (*__compar_d_fn_t) (const void *, const void *, void *);
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;
extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));
extern int abs (int __x) noexcept (true) __attribute__ ((__const__)) ;
extern long int labs (long int __x) noexcept (true) __attribute__ ((__const__)) ;
__extension__ extern long long int llabs (long long int __x)
     noexcept (true) __attribute__ ((__const__)) ;
extern div_t div (int __numer, int __denom)
     noexcept (true) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     noexcept (true) __attribute__ ((__const__)) ;
__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     noexcept (true) __attribute__ ((__const__)) ;
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *gcvt (double __value, int __ndigit, char *__buf)
     noexcept (true) __attribute__ ((__nonnull__ (3))) ;
extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     noexcept (true) __attribute__ ((__nonnull__ (3))) ;
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int mblen (const char *__s, size_t __n) noexcept (true);
extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) noexcept (true);
extern int wctomb (char *__s, wchar_t __wchar) noexcept (true);
extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) noexcept (true)
                                      ;
extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     noexcept (true)
                                    ;
extern int rpmatch (const char *__response) noexcept (true) __attribute__ ((__nonnull__ (1))) ;
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2, 3))) ;
extern int posix_openpt (int __oflag) ;
extern int grantpt (int __fd) noexcept (true);
extern int unlockpt (int __fd) noexcept (true);
extern char *ptsname (int __fd) noexcept (true) ;
extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     noexcept (true) __attribute__ ((__nonnull__ (2))) ;
extern int getpt (void);
extern int getloadavg (double __loadavg[], int __nelem)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
}

extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{
  using ::abs;
  inline long
  abs(long __i) { return __builtin_labs(__i); }
  inline long long
  abs(long long __x) { return __builtin_llabs (__x); }
  inline constexpr double
  abs(double __x)
  { return __builtin_fabs(__x); }
  inline constexpr float
  abs(float __x)
  { return __builtin_fabsf(__x); }
  inline constexpr long double
  abs(long double __x)
  { return __builtin_fabsl(__x); }
  inline constexpr
  __float128
  abs(__float128 __x)
  { return __x < 0 ? -__x : __x; }
}
}
extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{
  using ::div_t;
  using ::ldiv_t;
  using ::abort;
  using ::aligned_alloc;
  using ::atexit;
  using ::at_quick_exit;
  using ::atof;
  using ::atoi;
  using ::atol;
  using ::bsearch;
  using ::calloc;
  using ::div;
  using ::exit;
  using ::free;
  using ::getenv;
  using ::labs;
  using ::ldiv;
  using ::malloc;
  using ::mblen;
  using ::mbstowcs;
  using ::mbtowc;
  using ::qsort;
  using ::quick_exit;
  using ::rand;
  using ::realloc;
  using ::srand;
  using ::strtod;
  using ::strtol;
  using ::strtoul;
  using ::system;
  using ::wcstombs;
  using ::wctomb;
  inline ldiv_t
  div(long __i, long __j) { return ldiv(__i, __j); }
}
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
  using ::lldiv_t;
  using ::_Exit;
  using ::llabs;
  inline lldiv_t
  div(long long __n, long long __d)
  { lldiv_t __q; __q.quot = __n / __d; __q.rem = __n % __d; return __q; }
  using ::lldiv;
  using ::atoll;
  using ::strtoll;
  using ::strtoull;
  using ::strtof;
  using ::strtold;
}
namespace std
{
  using ::__gnu_cxx::lldiv_t;
  using ::__gnu_cxx::_Exit;
  using ::__gnu_cxx::llabs;
  using ::__gnu_cxx::div;
  using ::__gnu_cxx::lldiv;
  using ::__gnu_cxx::atoll;
  using ::__gnu_cxx::strtof;
  using ::__gnu_cxx::strtoll;
  using ::__gnu_cxx::strtoull;
  using ::__gnu_cxx::strtold;
}
}

using std::abort;
using std::atexit;
using std::exit;
  using std::at_quick_exit;
  using std::quick_exit;
using std::div_t;
using std::ldiv_t;
using std::abs;
using std::atof;
using std::atoi;
using std::atol;
using std::bsearch;
using std::calloc;
using std::div;
using std::free;
using std::getenv;
using std::labs;
using std::ldiv;
using std::malloc;
using std::mblen;
using std::mbstowcs;
using std::mbtowc;
using std::qsort;
using std::rand;
using std::realloc;
using std::srand;
using std::strtod;
using std::strtol;
using std::strtoul;
using std::system;
using std::wcstombs;
using std::wctomb;

extern "C" {
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmove (void *__dest, const void *__src, size_t __n)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
    noexcept (true) __attribute__ ((__nonnull__ (1, 2))) ;
extern void *memset (void *__s, int __c, size_t __n) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int __memcmpeq (const void *__s1, const void *__s2, size_t __n)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      noexcept (true) __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const void *memchr (const void *__s, int __c, size_t __n)
      noexcept (true) __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
}
extern "C++" void *rawmemchr (void *__s, int __c)
     noexcept (true) __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *rawmemchr (const void *__s, int __c)
     noexcept (true) __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      noexcept (true) __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)))
                                           ;
extern "C++" const void *memrchr (const void *__s, int __c, size_t __n)
      noexcept (true) __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)))
                                           ;
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int strcmp (const char *__s1, const char *__s2)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcoll (const char *__s1, const char *__s2)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
    noexcept (true) __attribute__ ((__nonnull__ (2))) ;
extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) noexcept (true) __attribute__ ((__nonnull__ (2, 4)))
                                           ;
extern char *strdup (const char *__s)
     noexcept (true) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strndup (const char *__string, size_t __n)
     noexcept (true) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern "C++"
{
extern char *strchr (char *__s, int __c)
     noexcept (true) __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strchr (const char *__s, int __c)
     noexcept (true) __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
}
extern "C++"
{
extern char *strrchr (char *__s, int __c)
     noexcept (true) __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strrchr (const char *__s, int __c)
     noexcept (true) __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
}
extern "C++" char *strchrnul (char *__s, int __c)
     noexcept (true) __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const char *strchrnul (const char *__s, int __c)
     noexcept (true) __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strcspn (const char *__s, const char *__reject)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strspn (const char *__s, const char *__accept)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++"
{
extern char *strpbrk (char *__s, const char *__accept)
     noexcept (true) __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strpbrk (const char *__s, const char *__accept)
     noexcept (true) __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
}
extern "C++"
{
extern char *strstr (char *__haystack, const char *__needle)
     noexcept (true) __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strstr (const char *__haystack, const char *__needle)
     noexcept (true) __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
}
extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     noexcept (true) __attribute__ ((__nonnull__ (2)));
extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     noexcept (true) __attribute__ ((__nonnull__ (2, 3)));
extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     noexcept (true) __attribute__ ((__nonnull__ (2, 3)));
extern "C++" char *strcasestr (char *__haystack, const char *__needle)
     noexcept (true) __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" const char *strcasestr (const char *__haystack,
         const char *__needle)
     noexcept (true) __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)))
                                         ;
extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strlen (const char *__s)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strnlen (const char *__string, size_t __maxlen)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strerror (int __errnum) noexcept (true);
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     noexcept (true) __attribute__ ((__nonnull__ (2))) ;
extern const char *strerrordesc_np (int __err) noexcept (true);
extern const char *strerrorname_np (int __err) noexcept (true);
extern char *strerror_l (int __errnum, locale_t __l) noexcept (true);
extern "C" {
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bcopy (const void *__src, void *__dest, size_t __n)
  noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern void bzero (void *__s, size_t __n) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern char *index (const char *__s, int __c)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *rindex (const char *__s, int __c)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern int ffs (int __i) noexcept (true) __attribute__ ((__const__));
extern int ffsl (long int __l) noexcept (true) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     noexcept (true) __attribute__ ((__const__));
extern int strcasecmp (const char *__s1, const char *__s2)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));
}
extern void explicit_bzero (void *__s, size_t __n) noexcept (true) __attribute__ ((__nonnull__ (1)))
                                                  ;
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsignal (int __sig) noexcept (true);
extern const char *sigabbrev_np (int __sig) noexcept (true);
extern const char *sigdescr_np (int __sig) noexcept (true);
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int strverscmp (const char *__s1, const char *__s2)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strfry (char *__string) noexcept (true) __attribute__ ((__nonnull__ (1)));
extern void *memfrob (void *__s, size_t __n) noexcept (true) __attribute__ ((__nonnull__ (1)))
                                          ;
extern "C++" char *basename (char *__filename)
     noexcept (true) __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" const char *basename (const char *__filename)
     noexcept (true) __asm ("basename") __attribute__ ((__nonnull__ (1)));
}



namespace std __attribute__ ((__visibility__ ("default")))
{
  void
  __throw_bad_exception(void) __attribute__((__noreturn__));
  void
  __throw_bad_alloc(void) __attribute__((__noreturn__));
  void
  __throw_bad_array_new_length(void) __attribute__((__noreturn__));
  void
  __throw_bad_cast(void) __attribute__((__noreturn__));
  void
  __throw_bad_typeid(void) __attribute__((__noreturn__));
  void
  __throw_logic_error(const char*) __attribute__((__noreturn__));
  void
  __throw_domain_error(const char*) __attribute__((__noreturn__));
  void
  __throw_invalid_argument(const char*) __attribute__((__noreturn__));
  void
  __throw_length_error(const char*) __attribute__((__noreturn__));
  void
  __throw_out_of_range(const char*) __attribute__((__noreturn__));
  void
  __throw_out_of_range_fmt(const char*, ...) __attribute__((__noreturn__))
    __attribute__((__format__(__gnu_printf__, 1, 2)));
  void
  __throw_runtime_error(const char*) __attribute__((__noreturn__));
  void
  __throw_range_error(const char*) __attribute__((__noreturn__));
  void
  __throw_overflow_error(const char*) __attribute__((__noreturn__));
  void
  __throw_underflow_error(const char*) __attribute__((__noreturn__));
  void
  __throw_ios_failure(const char*) __attribute__((__noreturn__));
  void
  __throw_ios_failure(const char*, int) __attribute__((__noreturn__));
  void
  __throw_system_error(int) __attribute__((__noreturn__));
  void
  __throw_future_error(int) __attribute__((__noreturn__));
  void
  __throw_bad_function_call() __attribute__((__noreturn__));
}
extern "C++" {
namespace std __attribute__ ((__visibility__ ("default")))
{
  struct __true_type { };
  struct __false_type { };
  template<bool>
    struct __truth_type
    { typedef __false_type __type; };
  template<>
    struct __truth_type<true>
    { typedef __true_type __type; };
  template<class _Sp, class _Tp>
    struct __traitor
    {
      enum { __value = bool(_Sp::__value) || bool(_Tp::__value) };
      typedef typename __truth_type<__value>::__type __type;
    };
  template<typename, typename>
    struct __are_same
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<typename _Tp>
    struct __are_same<_Tp, _Tp>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Tp>
    struct __is_void
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<>
    struct __is_void<void>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Tp>
    struct __is_integer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<>
    struct __is_integer<bool>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<char16_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<char32_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<unsigned short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<unsigned int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<unsigned long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_integer<unsigned long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Tp>
    struct __is_floating
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<>
    struct __is_floating<float>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_floating<double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_floating<long double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Tp>
    struct __is_pointer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<typename _Tp>
    struct __is_pointer<_Tp*>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Tp>
    struct __is_arithmetic
    : public __traitor<__is_integer<_Tp>, __is_floating<_Tp> >
    { };
  template<typename _Tp>
    struct __is_scalar
    : public __traitor<__is_arithmetic<_Tp>, __is_pointer<_Tp> >
    { };
  template<typename _Tp>
    struct __is_char
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<>
    struct __is_char<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_char<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Tp>
    struct __is_byte
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<>
    struct __is_byte<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_byte<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<>
    struct __is_byte<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  enum class byte : unsigned char;
  template<>
    struct __is_byte<byte>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename> struct iterator_traits;
  template<typename _Tp>
    struct __is_nonvolatile_trivially_copyable
    {
      enum { __value = __is_trivially_copyable(_Tp) };
    };
  template<typename _Tp>
    struct __is_nonvolatile_trivially_copyable<volatile _Tp>
    {
      enum { __value = 0 };
    };
  template<typename _OutputIter, typename _InputIter>
    struct __memcpyable
    {
      enum { __value = 0 };
    };
  template<typename _Tp>
    struct __memcpyable<_Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };
  template<typename _Tp>
    struct __memcpyable<_Tp*, const _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };
  template<typename _Iter1, typename _Iter2>
    struct __memcmpable
    {
      enum { __value = 0 };
    };
  template<typename _Tp>
    struct __memcmpable<_Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };
  template<typename _Tp>
    struct __memcmpable<const _Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };
  template<typename _Tp>
    struct __memcmpable<_Tp*, const _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };
  template<typename _Tp, bool _TreatAsBytes =
 __is_byte<_Tp>::__value
    >
    struct __is_memcmp_ordered
    {
      static const bool __value = _Tp(-1) > _Tp(1);
    };
  template<typename _Tp>
    struct __is_memcmp_ordered<_Tp, false>
    {
      static const bool __value = false;
    };
  template<typename _Tp, typename _Up, bool = sizeof(_Tp) == sizeof(_Up)>
    struct __is_memcmp_ordered_with
    {
      static const bool __value = __is_memcmp_ordered<_Tp>::__value
 && __is_memcmp_ordered<_Up>::__value;
    };
  template<typename _Tp, typename _Up>
    struct __is_memcmp_ordered_with<_Tp, _Up, false>
    {
      static const bool __value = false;
    };
  template<>
    struct __is_memcmp_ordered_with<std::byte, std::byte, true>
    { static constexpr bool __value = true; };
  template<typename _Tp, bool _SameSize>
    struct __is_memcmp_ordered_with<_Tp, std::byte, _SameSize>
    { static constexpr bool __value = false; };
  template<typename _Up, bool _SameSize>
    struct __is_memcmp_ordered_with<std::byte, _Up, _SameSize>
    { static constexpr bool __value = false; };
  template<typename _Tp>
    struct __is_move_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
  template<typename _Iterator>
    inline _Iterator
    __miter_base(_Iterator __it)
    { return __it; }
}
}
extern "C++" {
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
  template<bool, typename>
    struct __enable_if
    { };
  template<typename _Tp>
    struct __enable_if<true, _Tp>
    { typedef _Tp __type; };
  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct __conditional_type
    { typedef _Iftrue __type; };
  template<typename _Iftrue, typename _Iffalse>
    struct __conditional_type<false, _Iftrue, _Iffalse>
    { typedef _Iffalse __type; };
  template<typename _Tp>
    struct __add_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;
    public:
      typedef typename __if_type::__type __type;
    };
  template<>
    struct __add_unsigned<char>
    { typedef unsigned char __type; };
  template<>
    struct __add_unsigned<signed char>
    { typedef unsigned char __type; };
  template<>
    struct __add_unsigned<short>
    { typedef unsigned short __type; };
  template<>
    struct __add_unsigned<int>
    { typedef unsigned int __type; };
  template<>
    struct __add_unsigned<long>
    { typedef unsigned long __type; };
  template<>
    struct __add_unsigned<long long>
    { typedef unsigned long long __type; };
  template<>
    struct __add_unsigned<bool>;
  template<>
    struct __add_unsigned<wchar_t>;
  template<typename _Tp>
    struct __remove_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;
    public:
      typedef typename __if_type::__type __type;
    };
  template<>
    struct __remove_unsigned<char>
    { typedef signed char __type; };
  template<>
    struct __remove_unsigned<unsigned char>
    { typedef signed char __type; };
  template<>
    struct __remove_unsigned<unsigned short>
    { typedef short __type; };
  template<>
    struct __remove_unsigned<unsigned int>
    { typedef int __type; };
  template<>
    struct __remove_unsigned<unsigned long>
    { typedef long __type; };
  template<>
    struct __remove_unsigned<unsigned long long>
    { typedef long long __type; };
  template<>
    struct __remove_unsigned<bool>;
  template<>
    struct __remove_unsigned<wchar_t>;
  template<typename _Type>
    inline bool
    __is_null_pointer(_Type* __ptr)
    { return __ptr == 0; }
  template<typename _Type>
    inline bool
    __is_null_pointer(_Type)
    { return false; }
  inline bool
  __is_null_pointer(std::nullptr_t)
  { return true; }
  template<typename _Tp, bool = std::__is_integer<_Tp>::__value>
    struct __promote
    { typedef double __type; };
  template<typename _Tp>
    struct __promote<_Tp, false>
    { };
  template<>
    struct __promote<long double>
    { typedef long double __type; };
  template<>
    struct __promote<double>
    { typedef double __type; };
  template<>
    struct __promote<float>
    { typedef float __type; };
  template<typename... _Tp>
    using __promoted_t = decltype((typename __promote<_Tp>::__type(0) + ...));
  template<typename _Tp, typename _Up,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type>
    struct __promote_2
    {
      typedef __typeof__(_Tp2() + _Up2()) __type;
    };
  template<typename _Tp, typename _Up, typename _Vp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type>
    struct __promote_3
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2()) __type;
    };
  template<typename _Tp, typename _Up, typename _Vp, typename _Wp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type,
           typename _Wp2 = typename __promote<_Wp>::__type>
    struct __promote_4
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2() + _Wp2()) __type;
    };
}
}
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp>
    struct __is_integer_nonstrict
    : public std::__is_integer<_Tp>
    {
      using std::__is_integer<_Tp>::__value;
      enum { __width = __value ? sizeof(_Tp) * 8 : 0 };
    };
  template<typename _Value>
    struct __numeric_traits_integer
    {
      static_assert(__is_integer_nonstrict<_Value>::__value,
      "invalid specialization");
      static const bool __is_signed = (_Value)(-1) < 0;
      static const int __digits
 = __is_integer_nonstrict<_Value>::__width - __is_signed;
      static const _Value __max = __is_signed
 ? (((((_Value)1 << (__digits - 1)) - 1) << 1) + 1)
 : ~(_Value)0;
      static const _Value __min = __is_signed ? -__max - 1 : (_Value)0;
    };
  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__min;
  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__max;
  template<typename _Value>
    const bool __numeric_traits_integer<_Value>::__is_signed;
  template<typename _Value>
    const int __numeric_traits_integer<_Value>::__digits;
  template<typename _Tp>
    using __int_traits = __numeric_traits_integer<_Tp>;
  template<typename _Value>
    struct __numeric_traits_floating
    {
      static const int __max_digits10 = (2 + (std::__are_same<_Value, float>::__value ? 24 : std::__are_same<_Value, double>::__value ? 53 : 64) * 643L / 2136);
      static const bool __is_signed = true;
      static const int __digits10 = (std::__are_same<_Value, float>::__value ? 6 : std::__are_same<_Value, double>::__value ? 15 : 18);
      static const int __max_exponent10 = (std::__are_same<_Value, float>::__value ? 38 : std::__are_same<_Value, double>::__value ? 308 : 4932);
    };
  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_digits10;
  template<typename _Value>
    const bool __numeric_traits_floating<_Value>::__is_signed;
  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__digits10;
  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_exponent10;
  template<typename _Value>
    struct __numeric_traits
    : public __numeric_traits_integer<_Value>
    { };
  template<>
    struct __numeric_traits<float>
    : public __numeric_traits_floating<float>
    { };
  template<>
    struct __numeric_traits<double>
    : public __numeric_traits_floating<double>
    { };
  template<>
    struct __numeric_traits<long double>
    : public __numeric_traits_floating<long double>
    { };
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp>
    inline constexpr _Tp*
    __addressof(_Tp& __r) noexcept
    { return __builtin_addressof(__r); }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename... _Elements>
    class tuple;
  template<typename _Tp>
    class reference_wrapper;
  template<typename _Tp, _Tp __v>
    struct integral_constant
    {
      static constexpr _Tp value = __v;
      typedef _Tp value_type;
      typedef integral_constant<_Tp, __v> type;
      constexpr operator value_type() const noexcept { return value; }
      constexpr value_type operator()() const noexcept { return value; }
    };
  template<typename _Tp, _Tp __v>
    constexpr _Tp integral_constant<_Tp, __v>::value;
  using true_type = integral_constant<bool, true>;
  using false_type = integral_constant<bool, false>;
  template<bool __v>
    using __bool_constant = integral_constant<bool, __v>;
  template<bool __v>
    using bool_constant = integral_constant<bool, __v>;
  template<bool, typename, typename>
    struct conditional;
  template <typename _Type>
    struct __type_identity
    { using type = _Type; };
  template<typename _Tp>
    using __type_identity_t = typename __type_identity<_Tp>::type;
  template<typename...>
    struct __or_;
  template<>
    struct __or_<>
    : public false_type
    { };
  template<typename _B1>
    struct __or_<_B1>
    : public _B1
    { };
  template<typename _B1, typename _B2>
    struct __or_<_B1, _B2>
    : public conditional<_B1::value, _B1, _B2>::type
    { };
  template<typename _B1, typename _B2, typename _B3, typename... _Bn>
    struct __or_<_B1, _B2, _B3, _Bn...>
    : public conditional<_B1::value, _B1, __or_<_B2, _B3, _Bn...>>::type
    { };
  template<typename...>
    struct __and_;
  template<>
    struct __and_<>
    : public true_type
    { };
  template<typename _B1>
    struct __and_<_B1>
    : public _B1
    { };
  template<typename _B1, typename _B2>
    struct __and_<_B1, _B2>
    : public conditional<_B1::value, _B2, _B1>::type
    { };
  template<typename _B1, typename _B2, typename _B3, typename... _Bn>
    struct __and_<_B1, _B2, _B3, _Bn...>
    : public conditional<_B1::value, __and_<_B2, _B3, _Bn...>, _B1>::type
    { };
  template<typename _Pp>
    struct __not_
    : public __bool_constant<!bool(_Pp::value)>
    { };
  template<typename... _Bn>
    inline constexpr bool __or_v = __or_<_Bn...>::value;
  template<typename... _Bn>
    inline constexpr bool __and_v = __and_<_Bn...>::value;
  template<typename... _Bn>
    struct conjunction
    : __and_<_Bn...>
    { };
  template<typename... _Bn>
    struct disjunction
    : __or_<_Bn...>
    { };
  template<typename _Pp>
    struct negation
    : __not_<_Pp>
    { };
  template<typename... _Bn>
    inline constexpr bool conjunction_v = conjunction<_Bn...>::value;
  template<typename... _Bn>
    inline constexpr bool disjunction_v = disjunction<_Bn...>::value;
  template<typename _Pp>
    inline constexpr bool negation_v = negation<_Pp>::value;
  template<typename>
    struct is_reference;
  template<typename>
    struct is_function;
  template<typename>
    struct is_void;
  template<typename>
    struct remove_cv;
  template<typename>
    struct is_const;
  template<typename>
    struct __is_array_unknown_bounds;
  template <typename _Tp, size_t = sizeof(_Tp)>
    constexpr true_type __is_complete_or_unbounded(__type_identity<_Tp>)
    { return {}; }
  template <typename _TypeIdentity,
      typename _NestedType = typename _TypeIdentity::type>
    constexpr typename __or_<
      is_reference<_NestedType>,
      is_function<_NestedType>,
      is_void<_NestedType>,
      __is_array_unknown_bounds<_NestedType>
    >::type __is_complete_or_unbounded(_TypeIdentity)
    { return {}; }
  template<typename _Tp>
    struct __success_type
    { typedef _Tp type; };
  struct __failure_type
  { };
  template<typename _Tp>
    using __remove_cv_t = typename remove_cv<_Tp>::type;
  template<typename>
    struct __is_void_helper
    : public false_type { };
  template<>
    struct __is_void_helper<void>
    : public true_type { };
  template<typename _Tp>
    struct is_void
    : public __is_void_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename>
    struct __is_integral_helper
    : public false_type { };
  template<>
    struct __is_integral_helper<bool>
    : public true_type { };
  template<>
    struct __is_integral_helper<char>
    : public true_type { };
  template<>
    struct __is_integral_helper<signed char>
    : public true_type { };
  template<>
    struct __is_integral_helper<unsigned char>
    : public true_type { };
  template<>
    struct __is_integral_helper<wchar_t>
    : public true_type { };
  template<>
    struct __is_integral_helper<char16_t>
    : public true_type { };
  template<>
    struct __is_integral_helper<char32_t>
    : public true_type { };
  template<>
    struct __is_integral_helper<short>
    : public true_type { };
  template<>
    struct __is_integral_helper<unsigned short>
    : public true_type { };
  template<>
    struct __is_integral_helper<int>
    : public true_type { };
  template<>
    struct __is_integral_helper<unsigned int>
    : public true_type { };
  template<>
    struct __is_integral_helper<long>
    : public true_type { };
  template<>
    struct __is_integral_helper<unsigned long>
    : public true_type { };
  template<>
    struct __is_integral_helper<long long>
    : public true_type { };
  template<>
    struct __is_integral_helper<unsigned long long>
    : public true_type { };
  template<typename _Tp>
    struct is_integral
    : public __is_integral_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename>
    struct __is_floating_point_helper
    : public false_type { };
  template<>
    struct __is_floating_point_helper<float>
    : public true_type { };
  template<>
    struct __is_floating_point_helper<double>
    : public true_type { };
  template<>
    struct __is_floating_point_helper<long double>
    : public true_type { };
  template<>
    struct __is_floating_point_helper<__float128>
    : public true_type { };
  template<typename _Tp>
    struct is_floating_point
    : public __is_floating_point_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename>
    struct is_array
    : public false_type { };
  template<typename _Tp, std::size_t _Size>
    struct is_array<_Tp[_Size]>
    : public true_type { };
  template<typename _Tp>
    struct is_array<_Tp[]>
    : public true_type { };
  template<typename>
    struct __is_pointer_helper
    : public false_type { };
  template<typename _Tp>
    struct __is_pointer_helper<_Tp*>
    : public true_type { };
  template<typename _Tp>
    struct is_pointer
    : public __is_pointer_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename>
    struct is_lvalue_reference
    : public false_type { };
  template<typename _Tp>
    struct is_lvalue_reference<_Tp&>
    : public true_type { };
  template<typename>
    struct is_rvalue_reference
    : public false_type { };
  template<typename _Tp>
    struct is_rvalue_reference<_Tp&&>
    : public true_type { };
  template<typename>
    struct __is_member_object_pointer_helper
    : public false_type { };
  template<typename _Tp, typename _Cp>
    struct __is_member_object_pointer_helper<_Tp _Cp::*>
    : public __not_<is_function<_Tp>>::type { };
  template<typename _Tp>
    struct is_member_object_pointer
    : public __is_member_object_pointer_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename>
    struct __is_member_function_pointer_helper
    : public false_type { };
  template<typename _Tp, typename _Cp>
    struct __is_member_function_pointer_helper<_Tp _Cp::*>
    : public is_function<_Tp>::type { };
  template<typename _Tp>
    struct is_member_function_pointer
    : public __is_member_function_pointer_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename _Tp>
    struct is_enum
    : public integral_constant<bool, __is_enum(_Tp)>
    { };
  template<typename _Tp>
    struct is_union
    : public integral_constant<bool, __is_union(_Tp)>
    { };
  template<typename _Tp>
    struct is_class
    : public integral_constant<bool, __is_class(_Tp)>
    { };
  template<typename _Tp>
    struct is_function
    : public __bool_constant<!is_const<const _Tp>::value> { };
  template<typename _Tp>
    struct is_function<_Tp&>
    : public false_type { };
  template<typename _Tp>
    struct is_function<_Tp&&>
    : public false_type { };
  template<typename>
    struct __is_null_pointer_helper
    : public false_type { };
  template<>
    struct __is_null_pointer_helper<std::nullptr_t>
    : public true_type { };
  template<typename _Tp>
    struct is_null_pointer
    : public __is_null_pointer_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename _Tp>
    struct __is_nullptr_t
    : public is_null_pointer<_Tp>
    { } __attribute__ ((__deprecated__ ("use '" "std::is_null_pointer" "' instead")));
  template<typename _Tp>
    struct is_reference
    : public __or_<is_lvalue_reference<_Tp>,
                   is_rvalue_reference<_Tp>>::type
    { };
  template<typename _Tp>
    struct is_arithmetic
    : public __or_<is_integral<_Tp>, is_floating_point<_Tp>>::type
    { };
  template<typename _Tp>
    struct is_fundamental
    : public __or_<is_arithmetic<_Tp>, is_void<_Tp>,
     is_null_pointer<_Tp>>::type
    { };
  template<typename _Tp>
    struct is_object
    : public __not_<__or_<is_function<_Tp>, is_reference<_Tp>,
                          is_void<_Tp>>>::type
    { };
  template<typename>
    struct is_member_pointer;
  template<typename _Tp>
    struct is_scalar
    : public __or_<is_arithmetic<_Tp>, is_enum<_Tp>, is_pointer<_Tp>,
                   is_member_pointer<_Tp>, is_null_pointer<_Tp>>::type
    { };
  template<typename _Tp>
    struct is_compound
    : public __not_<is_fundamental<_Tp>>::type { };
  template<typename _Tp>
    struct __is_member_pointer_helper
    : public false_type { };
  template<typename _Tp, typename _Cp>
    struct __is_member_pointer_helper<_Tp _Cp::*>
    : public true_type { };
  template<typename _Tp>
    struct is_member_pointer
    : public __is_member_pointer_helper<__remove_cv_t<_Tp>>::type
    { };
  template<typename, typename>
    struct is_same;
  template<typename _Tp, typename... _Types>
    using __is_one_of = __or_<is_same<_Tp, _Types>...>;
  template<typename _Tp>
    using __is_signed_integer = __is_one_of<__remove_cv_t<_Tp>,
   signed char, signed short, signed int, signed long,
   signed long long
   >;
  template<typename _Tp>
    using __is_unsigned_integer = __is_one_of<__remove_cv_t<_Tp>,
   unsigned char, unsigned short, unsigned int, unsigned long,
   unsigned long long
   >;
  template<typename _Tp>
    using __is_standard_integer
      = __or_<__is_signed_integer<_Tp>, __is_unsigned_integer<_Tp>>;
  template<typename...> using __void_t = void;
  template<typename _Tp, typename = void>
    struct __is_referenceable
    : public false_type
    { };
  template<typename _Tp>
    struct __is_referenceable<_Tp, __void_t<_Tp&>>
    : public true_type
    { };
  template<typename>
    struct is_const
    : public false_type { };
  template<typename _Tp>
    struct is_const<_Tp const>
    : public true_type { };
  template<typename>
    struct is_volatile
    : public false_type { };
  template<typename _Tp>
    struct is_volatile<_Tp volatile>
    : public true_type { };
  template<typename _Tp>
    struct is_trivial
    : public integral_constant<bool, __is_trivial(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_trivially_copyable
    : public integral_constant<bool, __is_trivially_copyable(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_standard_layout
    : public integral_constant<bool, __is_standard_layout(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct
    is_pod
    : public integral_constant<bool, __is_pod(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct
    [[__deprecated__]]
    is_literal_type
    : public integral_constant<bool, __is_literal_type(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_empty
    : public integral_constant<bool, __is_empty(_Tp)>
    { };
  template<typename _Tp>
    struct is_polymorphic
    : public integral_constant<bool, __is_polymorphic(_Tp)>
    { };
  template<typename _Tp>
    struct is_final
    : public integral_constant<bool, __is_final(_Tp)>
    { };
  template<typename _Tp>
    struct is_abstract
    : public integral_constant<bool, __is_abstract(_Tp)>
    { };
  template<typename _Tp,
    bool = is_arithmetic<_Tp>::value>
    struct __is_signed_helper
    : public false_type { };
  template<typename _Tp>
    struct __is_signed_helper<_Tp, true>
    : public integral_constant<bool, _Tp(-1) < _Tp(0)>
    { };
  template<typename _Tp>
    struct is_signed
    : public __is_signed_helper<_Tp>::type
    { };
  template<typename _Tp>
    struct is_unsigned
    : public __and_<is_arithmetic<_Tp>, __not_<is_signed<_Tp>>>
    { };
  template<typename _Tp, typename _Up = _Tp&&>
    _Up
    __declval(int);
  template<typename _Tp>
    _Tp
    __declval(long);
  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0));
  template<typename, unsigned = 0>
    struct extent;
  template<typename>
    struct remove_all_extents;
  template<typename _Tp>
    struct __is_array_known_bounds
    : public integral_constant<bool, (extent<_Tp>::value > 0)>
    { };
  template<typename _Tp>
    struct __is_array_unknown_bounds
    : public __and_<is_array<_Tp>, __not_<extent<_Tp>>>
    { };
  struct __do_is_destructible_impl
  {
    template<typename _Tp, typename = decltype(declval<_Tp&>().~_Tp())>
      static true_type __test(int);
    template<typename>
      static false_type __test(...);
  };
  template<typename _Tp>
    struct __is_destructible_impl
    : public __do_is_destructible_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };
  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_destructible_safe;
  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, false>
    : public __is_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };
  template<typename _Tp>
    struct __is_destructible_safe<_Tp, true, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, true>
    : public true_type { };
  template<typename _Tp>
    struct is_destructible
    : public __is_destructible_safe<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  struct __do_is_nt_destructible_impl
  {
    template<typename _Tp>
      static __bool_constant<noexcept(declval<_Tp&>().~_Tp())>
      __test(int);
    template<typename>
      static false_type __test(...);
  };
  template<typename _Tp>
    struct __is_nt_destructible_impl
    : public __do_is_nt_destructible_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };
  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_nt_destructible_safe;
  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, false>
    : public __is_nt_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };
  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, true, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, true>
    : public true_type { };
  template<typename _Tp>
    struct is_nothrow_destructible
    : public __is_nt_destructible_safe<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename... _Args>
    struct __is_constructible_impl
    : public __bool_constant<__is_constructible(_Tp, _Args...)>
    { };
  template<typename _Tp, typename... _Args>
    struct is_constructible
      : public __is_constructible_impl<_Tp, _Args...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_default_constructible
    : public __is_constructible_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_copy_constructible_impl;
  template<typename _Tp>
    struct __is_copy_constructible_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_copy_constructible_impl<_Tp, true>
    : public __is_constructible_impl<_Tp, const _Tp&>
    { };
  template<typename _Tp>
    struct is_copy_constructible
    : public __is_copy_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_move_constructible_impl;
  template<typename _Tp>
    struct __is_move_constructible_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_move_constructible_impl<_Tp, true>
    : public __is_constructible_impl<_Tp, _Tp&&>
    { };
  template<typename _Tp>
    struct is_move_constructible
    : public __is_move_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename... _Args>
    using __is_nothrow_constructible_impl
      = __bool_constant<__is_nothrow_constructible(_Tp, _Args...)>;
  template<typename _Tp, typename... _Args>
    struct is_nothrow_constructible
    : public __is_nothrow_constructible_impl<_Tp, _Args...>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_nothrow_default_constructible
    : public __bool_constant<__is_nothrow_constructible(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nothrow_copy_constructible_impl;
  template<typename _Tp>
    struct __is_nothrow_copy_constructible_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_nothrow_copy_constructible_impl<_Tp, true>
    : public __is_nothrow_constructible_impl<_Tp, const _Tp&>
    { };
  template<typename _Tp>
    struct is_nothrow_copy_constructible
    : public __is_nothrow_copy_constructible_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nothrow_move_constructible_impl;
  template<typename _Tp>
    struct __is_nothrow_move_constructible_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_nothrow_move_constructible_impl<_Tp, true>
    : public __is_nothrow_constructible_impl<_Tp, _Tp&&>
    { };
  template<typename _Tp>
    struct is_nothrow_move_constructible
    : public __is_nothrow_move_constructible_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename _Up>
    struct is_assignable
    : public __bool_constant<__is_assignable(_Tp, _Up)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_copy_assignable_impl;
  template<typename _Tp>
    struct __is_copy_assignable_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_copy_assignable_impl<_Tp, true>
    : public __bool_constant<__is_assignable(_Tp&, const _Tp&)>
    { };
  template<typename _Tp>
    struct is_copy_assignable
    : public __is_copy_assignable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_move_assignable_impl;
  template<typename _Tp>
    struct __is_move_assignable_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_move_assignable_impl<_Tp, true>
    : public __bool_constant<__is_assignable(_Tp&, _Tp&&)>
    { };
  template<typename _Tp>
    struct is_move_assignable
    : public __is_move_assignable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename _Up>
    using __is_nothrow_assignable_impl
      = __bool_constant<__is_nothrow_assignable(_Tp, _Up)>;
  template<typename _Tp, typename _Up>
    struct is_nothrow_assignable
    : public __is_nothrow_assignable_impl<_Tp, _Up>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nt_copy_assignable_impl;
  template<typename _Tp>
    struct __is_nt_copy_assignable_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_nt_copy_assignable_impl<_Tp, true>
    : public __is_nothrow_assignable_impl<_Tp&, const _Tp&>
    { };
  template<typename _Tp>
    struct is_nothrow_copy_assignable
    : public __is_nt_copy_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nt_move_assignable_impl;
  template<typename _Tp>
    struct __is_nt_move_assignable_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_nt_move_assignable_impl<_Tp, true>
    : public __is_nothrow_assignable_impl<_Tp&, _Tp&&>
    { };
  template<typename _Tp>
    struct is_nothrow_move_assignable
    : public __is_nt_move_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename... _Args>
    struct is_trivially_constructible
    : public __bool_constant<__is_trivially_constructible(_Tp, _Args...)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_trivially_default_constructible
    : public __bool_constant<__is_trivially_constructible(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  struct __do_is_implicitly_default_constructible_impl
  {
    template <typename _Tp>
    static void __helper(const _Tp&);
    template <typename _Tp>
    static true_type __test(const _Tp&,
                            decltype(__helper<const _Tp&>({}))* = 0);
    static false_type __test(...);
  };
  template<typename _Tp>
    struct __is_implicitly_default_constructible_impl
    : public __do_is_implicitly_default_constructible_impl
    {
      typedef decltype(__test(declval<_Tp>())) type;
    };
  template<typename _Tp>
    struct __is_implicitly_default_constructible_safe
    : public __is_implicitly_default_constructible_impl<_Tp>::type
    { };
  template <typename _Tp>
    struct __is_implicitly_default_constructible
    : public __and_<__is_constructible_impl<_Tp>,
      __is_implicitly_default_constructible_safe<_Tp>>
    { };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_copy_constructible_impl;
  template<typename _Tp>
    struct __is_trivially_copy_constructible_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_trivially_copy_constructible_impl<_Tp, true>
    : public __and_<__is_copy_constructible_impl<_Tp>,
      integral_constant<bool,
   __is_trivially_constructible(_Tp, const _Tp&)>>
    { };
  template<typename _Tp>
    struct is_trivially_copy_constructible
    : public __is_trivially_copy_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_move_constructible_impl;
  template<typename _Tp>
    struct __is_trivially_move_constructible_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_trivially_move_constructible_impl<_Tp, true>
    : public __and_<__is_move_constructible_impl<_Tp>,
      integral_constant<bool,
   __is_trivially_constructible(_Tp, _Tp&&)>>
    { };
  template<typename _Tp>
    struct is_trivially_move_constructible
    : public __is_trivially_move_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename _Up>
    struct is_trivially_assignable
    : public __bool_constant<__is_trivially_assignable(_Tp, _Up)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_copy_assignable_impl;
  template<typename _Tp>
    struct __is_trivially_copy_assignable_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_trivially_copy_assignable_impl<_Tp, true>
    : public __bool_constant<__is_trivially_assignable(_Tp&, const _Tp&)>
    { };
  template<typename _Tp>
    struct is_trivially_copy_assignable
    : public __is_trivially_copy_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_move_assignable_impl;
  template<typename _Tp>
    struct __is_trivially_move_assignable_impl<_Tp, false>
    : public false_type { };
  template<typename _Tp>
    struct __is_trivially_move_assignable_impl<_Tp, true>
    : public __bool_constant<__is_trivially_assignable(_Tp&, _Tp&&)>
    { };
  template<typename _Tp>
    struct is_trivially_move_assignable
    : public __is_trivially_move_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_trivially_destructible
    : public __and_<__is_destructible_safe<_Tp>,
      __bool_constant<__has_trivial_destructor(_Tp)>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct has_virtual_destructor
    : public integral_constant<bool, __has_virtual_destructor(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct alignment_of
    : public integral_constant<std::size_t, alignof(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename>
    struct rank
    : public integral_constant<std::size_t, 0> { };
  template<typename _Tp, std::size_t _Size>
    struct rank<_Tp[_Size]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };
  template<typename _Tp>
    struct rank<_Tp[]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };
  template<typename, unsigned _Uint>
    struct extent
    : public integral_constant<std::size_t, 0> { };
  template<typename _Tp, unsigned _Uint, std::size_t _Size>
    struct extent<_Tp[_Size], _Uint>
    : public integral_constant<std::size_t,
          _Uint == 0 ? _Size : extent<_Tp,
          _Uint - 1>::value>
    { };
  template<typename _Tp, unsigned _Uint>
    struct extent<_Tp[], _Uint>
    : public integral_constant<std::size_t,
          _Uint == 0 ? 0 : extent<_Tp,
             _Uint - 1>::value>
    { };
  template<typename _Tp, typename _Up>
    struct is_same
    : public integral_constant<bool, __is_same(_Tp, _Up)>
    { };
  template<typename _Base, typename _Derived>
    struct is_base_of
    : public integral_constant<bool, __is_base_of(_Base, _Derived)>
    { };
  template<typename _From, typename _To,
           bool = __or_<is_void<_From>, is_function<_To>,
                        is_array<_To>>::value>
    struct __is_convertible_helper
    {
      typedef typename is_void<_To>::type type;
    };
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
  template<typename _From, typename _To>
    class __is_convertible_helper<_From, _To, false>
    {
      template<typename _To1>
 static void __test_aux(_To1) noexcept;
      template<typename _From1, typename _To1,
        typename = decltype(__test_aux<_To1>(std::declval<_From1>()))>
 static true_type
 __test(int);
      template<typename, typename>
 static false_type
 __test(...);
    public:
      typedef decltype(__test<_From, _To>(0)) type;
    };
#pragma GCC diagnostic pop
  template<typename _From, typename _To>
    struct is_convertible
    : public __is_convertible_helper<_From, _To>::type
    { };
  template<typename _ToElementType, typename _FromElementType>
    using __is_array_convertible
      = is_convertible<_FromElementType(*)[], _ToElementType(*)[]>;
  template<typename _From, typename _To,
           bool = __or_<is_void<_From>, is_function<_To>,
                        is_array<_To>>::value>
    struct __is_nt_convertible_helper
    : is_void<_To>
    { };
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
  template<typename _From, typename _To>
    class __is_nt_convertible_helper<_From, _To, false>
    {
      template<typename _To1>
 static void __test_aux(_To1) noexcept;
      template<typename _From1, typename _To1>
 static
 __bool_constant<noexcept(__test_aux<_To1>(std::declval<_From1>()))>
 __test(int);
      template<typename, typename>
 static false_type
 __test(...);
    public:
      using type = decltype(__test<_From, _To>(0));
    };
#pragma GCC diagnostic pop
  template<typename _Tp>
    struct remove_const
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_const<_Tp const>
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_volatile
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_volatile<_Tp volatile>
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_cv
    { using type = _Tp; };
  template<typename _Tp>
    struct remove_cv<const _Tp>
    { using type = _Tp; };
  template<typename _Tp>
    struct remove_cv<volatile _Tp>
    { using type = _Tp; };
  template<typename _Tp>
    struct remove_cv<const volatile _Tp>
    { using type = _Tp; };
  template<typename _Tp>
    struct add_const
    { typedef _Tp const type; };
  template<typename _Tp>
    struct add_volatile
    { typedef _Tp volatile type; };
  template<typename _Tp>
    struct add_cv
    {
      typedef typename
      add_const<typename add_volatile<_Tp>::type>::type type;
    };
  template<typename _Tp>
    using remove_const_t = typename remove_const<_Tp>::type;
  template<typename _Tp>
    using remove_volatile_t = typename remove_volatile<_Tp>::type;
  template<typename _Tp>
    using remove_cv_t = typename remove_cv<_Tp>::type;
  template<typename _Tp>
    using add_const_t = typename add_const<_Tp>::type;
  template<typename _Tp>
    using add_volatile_t = typename add_volatile<_Tp>::type;
  template<typename _Tp>
    using add_cv_t = typename add_cv<_Tp>::type;
  template<typename _Tp>
    struct remove_reference
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_reference<_Tp&>
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_reference<_Tp&&>
    { typedef _Tp type; };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __add_lvalue_reference_helper
    { typedef _Tp type; };
  template<typename _Tp>
    struct __add_lvalue_reference_helper<_Tp, true>
    { typedef _Tp& type; };
  template<typename _Tp>
    struct add_lvalue_reference
    : public __add_lvalue_reference_helper<_Tp>
    { };
  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __add_rvalue_reference_helper
    { typedef _Tp type; };
  template<typename _Tp>
    struct __add_rvalue_reference_helper<_Tp, true>
    { typedef _Tp&& type; };
  template<typename _Tp>
    struct add_rvalue_reference
    : public __add_rvalue_reference_helper<_Tp>
    { };
  template<typename _Tp>
    using remove_reference_t = typename remove_reference<_Tp>::type;
  template<typename _Tp>
    using add_lvalue_reference_t = typename add_lvalue_reference<_Tp>::type;
  template<typename _Tp>
    using add_rvalue_reference_t = typename add_rvalue_reference<_Tp>::type;
  template<typename _Unqualified, bool _IsConst, bool _IsVol>
    struct __cv_selector;
  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, false>
    { typedef _Unqualified __type; };
  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, true>
    { typedef volatile _Unqualified __type; };
  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, false>
    { typedef const _Unqualified __type; };
  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, true>
    { typedef const volatile _Unqualified __type; };
  template<typename _Qualified, typename _Unqualified,
    bool _IsConst = is_const<_Qualified>::value,
    bool _IsVol = is_volatile<_Qualified>::value>
    class __match_cv_qualifiers
    {
      typedef __cv_selector<_Unqualified, _IsConst, _IsVol> __match;
    public:
      typedef typename __match::__type __type;
    };
  template<typename _Tp>
    struct __make_unsigned
    { typedef _Tp __type; };
  template<>
    struct __make_unsigned<char>
    { typedef unsigned char __type; };
  template<>
    struct __make_unsigned<signed char>
    { typedef unsigned char __type; };
  template<>
    struct __make_unsigned<short>
    { typedef unsigned short __type; };
  template<>
    struct __make_unsigned<int>
    { typedef unsigned int __type; };
  template<>
    struct __make_unsigned<long>
    { typedef unsigned long __type; };
  template<>
    struct __make_unsigned<long long>
    { typedef unsigned long long __type; };
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = is_enum<_Tp>::value>
    class __make_unsigned_selector;
  template<typename _Tp>
    class __make_unsigned_selector<_Tp, true, false>
    {
      using __unsigned_type
 = typename __make_unsigned<__remove_cv_t<_Tp>>::__type;
    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };
  class __make_unsigned_selector_base
  {
  protected:
    template<typename...> struct _List { };
    template<typename _Tp, typename... _Up>
      struct _List<_Tp, _Up...> : _List<_Up...>
      { static constexpr size_t __size = sizeof(_Tp); };
    template<size_t _Sz, typename _Tp, bool = (_Sz <= _Tp::__size)>
      struct __select;
    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, true>
      { using __type = _Uint; };
    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, false>
      : __select<_Sz, _List<_UInts...>>
      { };
  };
  template<typename _Tp>
    class __make_unsigned_selector<_Tp, false, true>
    : __make_unsigned_selector_base
    {
      using _UInts = _List<unsigned char, unsigned short, unsigned int,
      unsigned long, unsigned long long>;
      using __unsigned_type = typename __select<sizeof(_Tp), _UInts>::__type;
    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };
  template<>
    struct __make_unsigned<wchar_t>
    {
      using __type
 = typename __make_unsigned_selector<wchar_t, false, true>::__type;
    };
  template<>
    struct __make_unsigned<char16_t>
    {
      using __type
 = typename __make_unsigned_selector<char16_t, false, true>::__type;
    };
  template<>
    struct __make_unsigned<char32_t>
    {
      using __type
 = typename __make_unsigned_selector<char32_t, false, true>::__type;
    };
  template<typename _Tp>
    struct make_unsigned
    { typedef typename __make_unsigned_selector<_Tp>::__type type; };
  template<>
    struct make_unsigned<bool>;
  template<typename _Tp>
    struct __make_signed
    { typedef _Tp __type; };
  template<>
    struct __make_signed<char>
    { typedef signed char __type; };
  template<>
    struct __make_signed<unsigned char>
    { typedef signed char __type; };
  template<>
    struct __make_signed<unsigned short>
    { typedef signed short __type; };
  template<>
    struct __make_signed<unsigned int>
    { typedef signed int __type; };
  template<>
    struct __make_signed<unsigned long>
    { typedef signed long __type; };
  template<>
    struct __make_signed<unsigned long long>
    { typedef signed long long __type; };
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = is_enum<_Tp>::value>
    class __make_signed_selector;
  template<typename _Tp>
    class __make_signed_selector<_Tp, true, false>
    {
      using __signed_type
 = typename __make_signed<__remove_cv_t<_Tp>>::__type;
    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __signed_type>::__type;
    };
  template<typename _Tp>
    class __make_signed_selector<_Tp, false, true>
    {
      typedef typename __make_unsigned_selector<_Tp>::__type __unsigned_type;
    public:
      typedef typename __make_signed_selector<__unsigned_type>::__type __type;
    };
  template<>
    struct __make_signed<wchar_t>
    {
      using __type
 = typename __make_signed_selector<wchar_t, false, true>::__type;
    };
  template<>
    struct __make_signed<char16_t>
    {
      using __type
 = typename __make_signed_selector<char16_t, false, true>::__type;
    };
  template<>
    struct __make_signed<char32_t>
    {
      using __type
 = typename __make_signed_selector<char32_t, false, true>::__type;
    };
  template<typename _Tp>
    struct make_signed
    { typedef typename __make_signed_selector<_Tp>::__type type; };
  template<>
    struct make_signed<bool>;
  template<typename _Tp>
    using make_signed_t = typename make_signed<_Tp>::type;
  template<typename _Tp>
    using make_unsigned_t = typename make_unsigned<_Tp>::type;
  template<typename _Tp>
    struct remove_extent
    { typedef _Tp type; };
  template<typename _Tp, std::size_t _Size>
    struct remove_extent<_Tp[_Size]>
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_extent<_Tp[]>
    { typedef _Tp type; };
  template<typename _Tp>
    struct remove_all_extents
    { typedef _Tp type; };
  template<typename _Tp, std::size_t _Size>
    struct remove_all_extents<_Tp[_Size]>
    { typedef typename remove_all_extents<_Tp>::type type; };
  template<typename _Tp>
    struct remove_all_extents<_Tp[]>
    { typedef typename remove_all_extents<_Tp>::type type; };
  template<typename _Tp>
    using remove_extent_t = typename remove_extent<_Tp>::type;
  template<typename _Tp>
    using remove_all_extents_t = typename remove_all_extents<_Tp>::type;
  template<typename _Tp, typename>
    struct __remove_pointer_helper
    { typedef _Tp type; };
  template<typename _Tp, typename _Up>
    struct __remove_pointer_helper<_Tp, _Up*>
    { typedef _Up type; };
  template<typename _Tp>
    struct remove_pointer
    : public __remove_pointer_helper<_Tp, __remove_cv_t<_Tp>>
    { };
  template<typename _Tp, bool = __or_<__is_referenceable<_Tp>,
          is_void<_Tp>>::value>
    struct __add_pointer_helper
    { typedef _Tp type; };
  template<typename _Tp>
    struct __add_pointer_helper<_Tp, true>
    { typedef typename remove_reference<_Tp>::type* type; };
  template<typename _Tp>
    struct add_pointer
    : public __add_pointer_helper<_Tp>
    { };
  template<typename _Tp>
    using remove_pointer_t = typename remove_pointer<_Tp>::type;
  template<typename _Tp>
    using add_pointer_t = typename add_pointer<_Tp>::type;
  template<std::size_t _Len>
    struct __aligned_storage_msa
    {
      union __type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__)) { } __align;
      };
    };
  template<std::size_t _Len, std::size_t _Align =
    __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    struct aligned_storage
    {
      union type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__((_Align)))) { } __align;
      };
    };
  template <typename... _Types>
    struct __strictest_alignment
    {
      static const size_t _S_alignment = 0;
      static const size_t _S_size = 0;
    };
  template <typename _Tp, typename... _Types>
    struct __strictest_alignment<_Tp, _Types...>
    {
      static const size_t _S_alignment =
        alignof(_Tp) > __strictest_alignment<_Types...>::_S_alignment
 ? alignof(_Tp) : __strictest_alignment<_Types...>::_S_alignment;
      static const size_t _S_size =
        sizeof(_Tp) > __strictest_alignment<_Types...>::_S_size
 ? sizeof(_Tp) : __strictest_alignment<_Types...>::_S_size;
    };
  template <size_t _Len, typename... _Types>
    struct aligned_union
    {
    private:
      static_assert(sizeof...(_Types) != 0, "At least one type is required");
      using __strictest = __strictest_alignment<_Types...>;
      static const size_t _S_len = _Len > __strictest::_S_size
 ? _Len : __strictest::_S_size;
    public:
      static const size_t alignment_value = __strictest::_S_alignment;
      typedef typename aligned_storage<_S_len, alignment_value>::type type;
    };
  template <size_t _Len, typename... _Types>
    const size_t aligned_union<_Len, _Types...>::alignment_value;
  template<typename _Up,
    bool _IsArray = is_array<_Up>::value,
    bool _IsFunction = is_function<_Up>::value>
    struct __decay_selector;
  template<typename _Up>
    struct __decay_selector<_Up, false, false>
    { typedef __remove_cv_t<_Up> __type; };
  template<typename _Up>
    struct __decay_selector<_Up, true, false>
    { typedef typename remove_extent<_Up>::type* __type; };
  template<typename _Up>
    struct __decay_selector<_Up, false, true>
    { typedef typename add_pointer<_Up>::type __type; };
  template<typename _Tp>
    class decay
    {
      typedef typename remove_reference<_Tp>::type __remove_type;
    public:
      typedef typename __decay_selector<__remove_type>::__type type;
    };
  template<typename _Tp>
    struct __strip_reference_wrapper
    {
      typedef _Tp __type;
    };
  template<typename _Tp>
    struct __strip_reference_wrapper<reference_wrapper<_Tp> >
    {
      typedef _Tp& __type;
    };
  template<typename _Tp>
    using __decay_t = typename decay<_Tp>::type;
  template<typename _Tp>
    using __decay_and_strip = __strip_reference_wrapper<__decay_t<_Tp>>;
  template<bool, typename _Tp = void>
    struct enable_if
    { };
  template<typename _Tp>
    struct enable_if<true, _Tp>
    { typedef _Tp type; };
  template<bool _Cond, typename _Tp = void>
    using __enable_if_t = typename enable_if<_Cond, _Tp>::type;
  template<typename... _Cond>
    using _Require = __enable_if_t<__and_<_Cond...>::value>;
  template<typename _Tp>
    using __remove_cvref_t
     = typename remove_cv<typename remove_reference<_Tp>::type>::type;
  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct conditional
    { typedef _Iftrue type; };
  template<typename _Iftrue, typename _Iffalse>
    struct conditional<false, _Iftrue, _Iffalse>
    { typedef _Iffalse type; };
  template<typename... _Tp>
    struct common_type;
  struct __do_common_type_impl
  {
    template<typename _Tp, typename _Up>
      using __cond_t
 = decltype(true ? std::declval<_Tp>() : std::declval<_Up>());
    template<typename _Tp, typename _Up>
      static __success_type<__decay_t<__cond_t<_Tp, _Up>>>
      _S_test(int);
    template<typename, typename>
      static __failure_type
      _S_test_2(...);
    template<typename _Tp, typename _Up>
      static decltype(_S_test_2<_Tp, _Up>(0))
      _S_test(...);
  };
  template<>
    struct common_type<>
    { };
  template<typename _Tp0>
    struct common_type<_Tp0>
    : public common_type<_Tp0, _Tp0>
    { };
  template<typename _Tp1, typename _Tp2,
    typename _Dp1 = __decay_t<_Tp1>, typename _Dp2 = __decay_t<_Tp2>>
    struct __common_type_impl
    {
      using type = common_type<_Dp1, _Dp2>;
    };
  template<typename _Tp1, typename _Tp2>
    struct __common_type_impl<_Tp1, _Tp2, _Tp1, _Tp2>
    : private __do_common_type_impl
    {
      using type = decltype(_S_test<_Tp1, _Tp2>(0));
    };
  template<typename _Tp1, typename _Tp2>
    struct common_type<_Tp1, _Tp2>
    : public __common_type_impl<_Tp1, _Tp2>::type
    { };
  template<typename...>
    struct __common_type_pack
    { };
  template<typename, typename, typename = void>
    struct __common_type_fold;
  template<typename _Tp1, typename _Tp2, typename... _Rp>
    struct common_type<_Tp1, _Tp2, _Rp...>
    : public __common_type_fold<common_type<_Tp1, _Tp2>,
    __common_type_pack<_Rp...>>
    { };
  template<typename _CTp, typename... _Rp>
    struct __common_type_fold<_CTp, __common_type_pack<_Rp...>,
         __void_t<typename _CTp::type>>
    : public common_type<typename _CTp::type, _Rp...>
    { };
  template<typename _CTp, typename _Rp>
    struct __common_type_fold<_CTp, _Rp, void>
    { };
  template<typename _Tp, bool = is_enum<_Tp>::value>
    struct __underlying_type_impl
    {
      using type = __underlying_type(_Tp);
    };
  template<typename _Tp>
    struct __underlying_type_impl<_Tp, false>
    { };
  template<typename _Tp>
    struct underlying_type
    : public __underlying_type_impl<_Tp>
    { };
  template<typename _Tp>
    struct __declval_protector
    {
      static const bool __stop = false;
    };
  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0))
    {
      static_assert(__declval_protector<_Tp>::__stop,
      "declval() must not be used!");
      return __declval<_Tp>(0);
    }
  template<typename _Signature>
    struct result_of;
  struct __invoke_memfun_ref { };
  struct __invoke_memfun_deref { };
  struct __invoke_memobj_ref { };
  struct __invoke_memobj_deref { };
  struct __invoke_other { };
  template<typename _Tp, typename _Tag>
    struct __result_of_success : __success_type<_Tp>
    { using __invoke_type = _Tag; };
  struct __result_of_memfun_ref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      (std::declval<_Tp1>().*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_ref> _S_test(int);
    template<typename...>
      static __failure_type _S_test(...);
  };
  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_ref
    : private __result_of_memfun_ref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg, _Args...>(0)) type;
    };
  struct __result_of_memfun_deref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      ((*std::declval<_Tp1>()).*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_deref> _S_test(int);
    template<typename...>
      static __failure_type _S_test(...);
  };
  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_deref
    : private __result_of_memfun_deref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg, _Args...>(0)) type;
    };
  struct __result_of_memobj_ref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      std::declval<_Tp1>().*std::declval<_Fp>()
      ), __invoke_memobj_ref> _S_test(int);
    template<typename, typename>
      static __failure_type _S_test(...);
  };
  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_ref
    : private __result_of_memobj_ref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg>(0)) type;
    };
  struct __result_of_memobj_deref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      (*std::declval<_Tp1>()).*std::declval<_Fp>()
      ), __invoke_memobj_deref> _S_test(int);
    template<typename, typename>
      static __failure_type _S_test(...);
  };
  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_deref
    : private __result_of_memobj_deref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg>(0)) type;
    };
  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj;
  template<typename _Res, typename _Class, typename _Arg>
    struct __result_of_memobj<_Res _Class::*, _Arg>
    {
      typedef __remove_cvref_t<_Arg> _Argval;
      typedef _Res _Class::* _MemPtr;
      typedef typename conditional<__or_<is_same<_Argval, _Class>,
        is_base_of<_Class, _Argval>>::value,
        __result_of_memobj_ref<_MemPtr, _Arg>,
        __result_of_memobj_deref<_MemPtr, _Arg>
      >::type::type type;
    };
  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun;
  template<typename _Res, typename _Class, typename _Arg, typename... _Args>
    struct __result_of_memfun<_Res _Class::*, _Arg, _Args...>
    {
      typedef typename remove_reference<_Arg>::type _Argval;
      typedef _Res _Class::* _MemPtr;
      typedef typename conditional<is_base_of<_Class, _Argval>::value,
        __result_of_memfun_ref<_MemPtr, _Arg, _Args...>,
        __result_of_memfun_deref<_MemPtr, _Arg, _Args...>
      >::type::type type;
    };
  template<typename _Tp, typename _Up = __remove_cvref_t<_Tp>>
    struct __inv_unwrap
    {
      using type = _Tp;
    };
  template<typename _Tp, typename _Up>
    struct __inv_unwrap<_Tp, reference_wrapper<_Up>>
    {
      using type = _Up&;
    };
  template<bool, bool, typename _Functor, typename... _ArgTypes>
    struct __result_of_impl
    {
      typedef __failure_type type;
    };
  template<typename _MemPtr, typename _Arg>
    struct __result_of_impl<true, false, _MemPtr, _Arg>
    : public __result_of_memobj<__decay_t<_MemPtr>,
    typename __inv_unwrap<_Arg>::type>
    { };
  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_impl<false, true, _MemPtr, _Arg, _Args...>
    : public __result_of_memfun<__decay_t<_MemPtr>,
    typename __inv_unwrap<_Arg>::type, _Args...>
    { };
  struct __result_of_other_impl
  {
    template<typename _Fn, typename... _Args>
      static __result_of_success<decltype(
      std::declval<_Fn>()(std::declval<_Args>()...)
      ), __invoke_other> _S_test(int);
    template<typename...>
      static __failure_type _S_test(...);
  };
  template<typename _Functor, typename... _ArgTypes>
    struct __result_of_impl<false, false, _Functor, _ArgTypes...>
    : private __result_of_other_impl
    {
      typedef decltype(_S_test<_Functor, _ArgTypes...>(0)) type;
    };
  template<typename _Functor, typename... _ArgTypes>
    struct __invoke_result
    : public __result_of_impl<
        is_member_object_pointer<
          typename remove_reference<_Functor>::type
        >::value,
        is_member_function_pointer<
          typename remove_reference<_Functor>::type
        >::value,
 _Functor, _ArgTypes...
      >::type
    { };
  template<typename _Functor, typename... _ArgTypes>
    struct result_of<_Functor(_ArgTypes...)>
    : public __invoke_result<_Functor, _ArgTypes...>
    { };
  template<size_t _Len, size_t _Align =
     __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    using aligned_storage_t = typename aligned_storage<_Len, _Align>::type;
  template <size_t _Len, typename... _Types>
    using aligned_union_t = typename aligned_union<_Len, _Types...>::type;
  template<typename _Tp>
    using decay_t = typename decay<_Tp>::type;
  template<bool _Cond, typename _Tp = void>
    using enable_if_t = typename enable_if<_Cond, _Tp>::type;
  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    using conditional_t = typename conditional<_Cond, _Iftrue, _Iffalse>::type;
  template<typename... _Tp>
    using common_type_t = typename common_type<_Tp...>::type;
  template<typename _Tp>
    using underlying_type_t = typename underlying_type<_Tp>::type;
  template<typename _Tp>
    using result_of_t = typename result_of<_Tp>::type;
  template<typename...> using void_t = void;
  template<typename _Default, typename _AlwaysVoid,
    template<typename...> class _Op, typename... _Args>
    struct __detector
    {
      using value_t = false_type;
      using type = _Default;
    };
  template<typename _Default, template<typename...> class _Op,
     typename... _Args>
    struct __detector<_Default, __void_t<_Op<_Args...>>, _Op, _Args...>
    {
      using value_t = true_type;
      using type = _Op<_Args...>;
    };
  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or = __detector<_Default, void, _Op, _Args...>;
  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or_t
      = typename __detected_or<_Default, _Op, _Args...>::type;
  template <typename _Tp>
    struct __is_swappable;
  template <typename _Tp>
    struct __is_nothrow_swappable;
  template<typename>
    struct __is_tuple_like_impl : false_type
    { };
  template<typename... _Tps>
    struct __is_tuple_like_impl<tuple<_Tps...>> : true_type
    { };
  template<typename _Tp>
    struct __is_tuple_like
    : public __is_tuple_like_impl<__remove_cvref_t<_Tp>>::type
    { };
  template<typename _Tp>
    inline
    _Require<__not_<__is_tuple_like<_Tp>>,
      is_move_constructible<_Tp>,
      is_move_assignable<_Tp>>
    swap(_Tp&, _Tp&)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>,
             is_nothrow_move_assignable<_Tp>>::value);
  template<typename _Tp, size_t _Nm>
    inline
    __enable_if_t<__is_swappable<_Tp>::value>
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value);
  namespace __swappable_details {
    using std::swap;
    struct __do_is_swappable_impl
    {
      template<typename _Tp, typename
               = decltype(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))>
        static true_type __test(int);
      template<typename>
        static false_type __test(...);
    };
    struct __do_is_nothrow_swappable_impl
    {
      template<typename _Tp>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))
        > __test(int);
      template<typename>
        static false_type __test(...);
    };
  }
  template<typename _Tp>
    struct __is_swappable_impl
    : public __swappable_details::__do_is_swappable_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };
  template<typename _Tp>
    struct __is_nothrow_swappable_impl
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };
  template<typename _Tp>
    struct __is_swappable
    : public __is_swappable_impl<_Tp>::type
    { };
  template<typename _Tp>
    struct __is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    { };
  template<typename _Tp>
    struct is_swappable
    : public __is_swappable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    struct is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    inline constexpr bool is_swappable_v =
      is_swappable<_Tp>::value;
  template<typename _Tp>
    inline constexpr bool is_nothrow_swappable_v =
      is_nothrow_swappable<_Tp>::value;
  namespace __swappable_with_details {
    using std::swap;
    struct __do_is_swappable_with_impl
    {
      template<typename _Tp, typename _Up, typename
               = decltype(swap(std::declval<_Tp>(), std::declval<_Up>())),
               typename
               = decltype(swap(std::declval<_Up>(), std::declval<_Tp>()))>
        static true_type __test(int);
      template<typename, typename>
        static false_type __test(...);
    };
    struct __do_is_nothrow_swappable_with_impl
    {
      template<typename _Tp, typename _Up>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp>(), std::declval<_Up>()))
          &&
          noexcept(swap(std::declval<_Up>(), std::declval<_Tp>()))
        > __test(int);
      template<typename, typename>
        static false_type __test(...);
    };
  }
  template<typename _Tp, typename _Up>
    struct __is_swappable_with_impl
    : public __swappable_with_details::__do_is_swappable_with_impl
    {
      typedef decltype(__test<_Tp, _Up>(0)) type;
    };
  template<typename _Tp>
    struct __is_swappable_with_impl<_Tp&, _Tp&>
    : public __swappable_details::__do_is_swappable_impl
    {
      typedef decltype(__test<_Tp&>(0)) type;
    };
  template<typename _Tp, typename _Up>
    struct __is_nothrow_swappable_with_impl
    : public __swappable_with_details::__do_is_nothrow_swappable_with_impl
    {
      typedef decltype(__test<_Tp, _Up>(0)) type;
    };
  template<typename _Tp>
    struct __is_nothrow_swappable_with_impl<_Tp&, _Tp&>
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      typedef decltype(__test<_Tp&>(0)) type;
    };
  template<typename _Tp, typename _Up>
    struct is_swappable_with
    : public __is_swappable_with_impl<_Tp, _Up>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "first template argument must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Up>{}),
 "second template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename _Up>
    struct is_nothrow_swappable_with
    : public __is_nothrow_swappable_with_impl<_Tp, _Up>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "first template argument must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Up>{}),
 "second template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp, typename _Up>
    inline constexpr bool is_swappable_with_v =
      is_swappable_with<_Tp, _Up>::value;
  template<typename _Tp, typename _Up>
    inline constexpr bool is_nothrow_swappable_with_v =
      is_nothrow_swappable_with<_Tp, _Up>::value;
  template<typename _Result, typename _Ret,
    bool = is_void<_Ret>::value, typename = void>
    struct __is_invocable_impl
    : false_type
    {
      using __nothrow_type = false_type;
    };
  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                true,
          __void_t<typename _Result::type>>
    : true_type
    {
      using __nothrow_type = true_type;
    };
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                false,
          __void_t<typename _Result::type>>
    {
    private:
      static typename _Result::type _S_get() noexcept;
      template<typename _Tp>
 static void _S_conv(_Tp) noexcept;
      template<typename _Tp, bool _Check_Noex = false,
        typename = decltype(_S_conv<_Tp>(_S_get())),
        bool _Noex = noexcept(_S_conv<_Tp>(_S_get()))>
 static __bool_constant<_Check_Noex ? _Noex : true>
 _S_test(int);
      template<typename _Tp, bool = false>
 static false_type
 _S_test(...);
    public:
      using type = decltype(_S_test<_Ret>(1));
      using __nothrow_type = decltype(_S_test<_Ret, true>(1));
    };
#pragma GCC diagnostic pop
  template<typename _Fn, typename... _ArgTypes>
    struct __is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    { };
  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept((std::declval<_Up>().*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }
  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_deref)
    {
      return noexcept(((*std::declval<_Tp>()).*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }
  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept(std::declval<_Up>().*std::declval<_Fn>());
    }
  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_deref)
    {
      return noexcept((*std::declval<_Tp>()).*std::declval<_Fn>());
    }
  template<typename _Fn, typename... _Args>
    constexpr bool __call_is_nt(__invoke_other)
    {
      return noexcept(std::declval<_Fn>()(std::declval<_Args>()...));
    }
  template<typename _Result, typename _Fn, typename... _Args>
    struct __call_is_nothrow
    : __bool_constant<
 std::__call_is_nt<_Fn, _Args...>(typename _Result::__invoke_type{})
      >
    { };
  template<typename _Fn, typename... _Args>
    using __call_is_nothrow_
      = __call_is_nothrow<__invoke_result<_Fn, _Args...>, _Fn, _Args...>;
  template<typename _Fn, typename... _Args>
    struct __is_nothrow_invocable
    : __and_<__is_invocable<_Fn, _Args...>,
             __call_is_nothrow_<_Fn, _Args...>>::type
    { };
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
  struct __nonesuchbase {};
  struct __nonesuch : private __nonesuchbase {
    ~__nonesuch() = delete;
    __nonesuch(__nonesuch const&) = delete;
    void operator=(__nonesuch const&) = delete;
  };
#pragma GCC diagnostic pop
  template<typename _Functor, typename... _ArgTypes>
    struct invoke_result
    : public __invoke_result<_Functor, _ArgTypes...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Functor>{}),
 "_Functor must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
    };
  template<typename _Fn, typename... _Args>
    using invoke_result_t = typename invoke_result<_Fn, _Args...>::type;
  template<typename _Fn, typename... _ArgTypes>
    struct is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
    };
  template<typename _Ret, typename _Fn, typename... _ArgTypes>
    struct is_invocable_r
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, _Ret>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Ret>{}),
 "_Ret must be a complete class or an unbounded array");
    };
  template<typename _Fn, typename... _ArgTypes>
    struct is_nothrow_invocable
    : __and_<__is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>,
      __call_is_nothrow_<_Fn, _ArgTypes...>>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
    };
  template<typename _Result, typename _Ret>
    using __is_nt_invocable_impl
      = typename __is_invocable_impl<_Result, _Ret>::__nothrow_type;
  template<typename _Ret, typename _Fn, typename... _ArgTypes>
    struct is_nothrow_invocable_r
    : __and_<__is_nt_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, _Ret>,
             __call_is_nothrow_<_Fn, _ArgTypes...>>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Ret>{}),
 "_Ret must be a complete class or an unbounded array");
    };
template <typename _Tp>
  inline constexpr bool is_void_v = is_void<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_null_pointer_v = is_null_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_integral_v = is_integral<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_floating_point_v = is_floating_point<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_array_v = is_array<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_pointer_v = is_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_lvalue_reference_v =
    is_lvalue_reference<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_rvalue_reference_v =
    is_rvalue_reference<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_member_object_pointer_v =
    is_member_object_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_member_function_pointer_v =
    is_member_function_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_enum_v = is_enum<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_union_v = is_union<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_class_v = is_class<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_function_v = is_function<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_reference_v = is_reference<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_arithmetic_v = is_arithmetic<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_fundamental_v = is_fundamental<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_object_v = is_object<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_scalar_v = is_scalar<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_compound_v = is_compound<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_member_pointer_v = is_member_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_const_v = is_const<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_volatile_v = is_volatile<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivial_v = is_trivial<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_copyable_v =
    is_trivially_copyable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_standard_layout_v = is_standard_layout<_Tp>::value;
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
template <typename _Tp>
  inline constexpr bool is_pod_v = is_pod<_Tp>::value;
template <typename _Tp>
  [[__deprecated__]]
  inline constexpr bool is_literal_type_v = is_literal_type<_Tp>::value;
#pragma GCC diagnostic pop
 template <typename _Tp>
  inline constexpr bool is_empty_v = is_empty<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_polymorphic_v = is_polymorphic<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_abstract_v = is_abstract<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_final_v = is_final<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_signed_v = is_signed<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_unsigned_v = is_unsigned<_Tp>::value;
template <typename _Tp, typename... _Args>
  inline constexpr bool is_constructible_v =
    is_constructible<_Tp, _Args...>::value;
template <typename _Tp>
  inline constexpr bool is_default_constructible_v =
    is_default_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_copy_constructible_v =
    is_copy_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_move_constructible_v =
    is_move_constructible<_Tp>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_assignable_v = is_assignable<_Tp, _Up>::value;
template <typename _Tp>
  inline constexpr bool is_copy_assignable_v = is_copy_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_move_assignable_v = is_move_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_destructible_v = is_destructible<_Tp>::value;
template <typename _Tp, typename... _Args>
  inline constexpr bool is_trivially_constructible_v =
    is_trivially_constructible<_Tp, _Args...>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_default_constructible_v =
    is_trivially_default_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_copy_constructible_v =
    is_trivially_copy_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_move_constructible_v =
    is_trivially_move_constructible<_Tp>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_trivially_assignable_v =
    is_trivially_assignable<_Tp, _Up>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_copy_assignable_v =
    is_trivially_copy_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_move_assignable_v =
    is_trivially_move_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_destructible_v =
    is_trivially_destructible<_Tp>::value;
template <typename _Tp, typename... _Args>
  inline constexpr bool is_nothrow_constructible_v =
    is_nothrow_constructible<_Tp, _Args...>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_default_constructible_v =
    is_nothrow_default_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_copy_constructible_v =
    is_nothrow_copy_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_move_constructible_v =
    is_nothrow_move_constructible<_Tp>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_nothrow_assignable_v =
    is_nothrow_assignable<_Tp, _Up>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_copy_assignable_v =
    is_nothrow_copy_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_move_assignable_v =
    is_nothrow_move_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_destructible_v =
    is_nothrow_destructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool has_virtual_destructor_v =
    has_virtual_destructor<_Tp>::value;
template <typename _Tp>
  inline constexpr size_t alignment_of_v = alignment_of<_Tp>::value;
template <typename _Tp>
  inline constexpr size_t rank_v = rank<_Tp>::value;
template <typename _Tp, unsigned _Idx = 0>
  inline constexpr size_t extent_v = extent<_Tp, _Idx>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_same_v = __is_same(_Tp, _Up);
template <typename _Base, typename _Derived>
  inline constexpr bool is_base_of_v = is_base_of<_Base, _Derived>::value;
template <typename _From, typename _To>
  inline constexpr bool is_convertible_v = is_convertible<_From, _To>::value;
template<typename _Fn, typename... _Args>
  inline constexpr bool is_invocable_v = is_invocable<_Fn, _Args...>::value;
template<typename _Fn, typename... _Args>
  inline constexpr bool is_nothrow_invocable_v
    = is_nothrow_invocable<_Fn, _Args...>::value;
template<typename _Ret, typename _Fn, typename... _Args>
  inline constexpr bool is_invocable_r_v
    = is_invocable_r<_Ret, _Fn, _Args...>::value;
template<typename _Ret, typename _Fn, typename... _Args>
  inline constexpr bool is_nothrow_invocable_r_v
    = is_nothrow_invocable_r<_Ret, _Fn, _Args...>::value;
  template<typename _Tp>
    struct has_unique_object_representations
    : bool_constant<__has_unique_object_representations(
      remove_cv_t<remove_all_extents_t<_Tp>>
      )>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };
  template<typename _Tp>
    inline constexpr bool has_unique_object_representations_v
      = has_unique_object_representations<_Tp>::value;
  template<typename _Tp>
    struct is_aggregate
    : bool_constant<__is_aggregate(remove_cv_t<_Tp>)>
    { };
  template<typename _Tp>
    inline constexpr bool is_aggregate_v = is_aggregate<_Tp>::value;
}

namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type& __t) noexcept
    { return static_cast<_Tp&&>(__t); }
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type&& __t) noexcept
    {
      static_assert(!std::is_lvalue_reference<_Tp>::value,
   "std::forward must not be used to convert an rvalue to an lvalue");
      return static_cast<_Tp&&>(__t);
    }
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr typename std::remove_reference<_Tp>::type&&
    move(_Tp&& __t) noexcept
    { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }
  template<typename _Tp>
    struct __move_if_noexcept_cond
    : public __and_<__not_<is_nothrow_move_constructible<_Tp>>,
                    is_copy_constructible<_Tp>>::type { };
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr typename
    conditional<__move_if_noexcept_cond<_Tp>::value, const _Tp&, _Tp&&>::type
    move_if_noexcept(_Tp& __x) noexcept
    { return std::move(__x); }
  template<typename _Tp>
    [[__nodiscard__]]
    inline constexpr _Tp*
    addressof(_Tp& __r) noexcept
    { return std::__addressof(__r); }
  template<typename _Tp>
    const _Tp* addressof(const _Tp&&) = delete;
  template <typename _Tp, typename _Up = _Tp>
    inline _Tp
    __exchange(_Tp& __obj, _Up&& __new_val)
    {
      _Tp __old_val = std::move(__obj);
      __obj = std::forward<_Up>(__new_val);
      return __old_val;
    }
  template<typename _Tp>
    inline
    typename enable_if<__and_<__not_<__is_tuple_like<_Tp>>,
         is_move_constructible<_Tp>,
         is_move_assignable<_Tp>>::value>::type
    swap(_Tp& __a, _Tp& __b)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>, is_nothrow_move_assignable<_Tp>>::value)
    {
      _Tp __tmp = std::move(__a);
      __a = std::move(__b);
      __b = std::move(__tmp);
    }
  template<typename _Tp, size_t _Nm>
    inline
    typename enable_if<__is_swappable<_Tp>::value>::type
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value)
    {
      for (size_t __n = 0; __n < _Nm; ++__n)
 swap(__a[__n], __b[__n]);
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  struct piecewise_construct_t { explicit piecewise_construct_t() = default; };
  inline constexpr piecewise_construct_t piecewise_construct =
    piecewise_construct_t();
  template<typename...>
    class tuple;
  template<size_t...>
    struct _Index_tuple;
  template <bool, typename _T1, typename _T2>
    struct _PCC
    {
      template <typename _U1, typename _U2>
      static constexpr bool _ConstructiblePair()
      {
 return __and_<is_constructible<_T1, const _U1&>,
        is_constructible<_T2, const _U2&>>::value;
      }
      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyConvertiblePair()
      {
 return __and_<is_convertible<const _U1&, _T1>,
        is_convertible<const _U2&, _T2>>::value;
      }
      template <typename _U1, typename _U2>
      static constexpr bool _MoveConstructiblePair()
      {
 return __and_<is_constructible<_T1, _U1&&>,
        is_constructible<_T2, _U2&&>>::value;
      }
      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyMoveConvertiblePair()
      {
 return __and_<is_convertible<_U1&&, _T1>,
        is_convertible<_U2&&, _T2>>::value;
      }
      template <bool __implicit, typename _U1, typename _U2>
      static constexpr bool _CopyMovePair()
      {
 using __do_converts = __and_<is_convertible<const _U1&, _T1>,
      is_convertible<_U2&&, _T2>>;
 using __converts = typename conditional<__implicit,
           __do_converts,
           __not_<__do_converts>>::type;
 return __and_<is_constructible<_T1, const _U1&>,
        is_constructible<_T2, _U2&&>,
        __converts
        >::value;
      }
      template <bool __implicit, typename _U1, typename _U2>
      static constexpr bool _MoveCopyPair()
      {
 using __do_converts = __and_<is_convertible<_U1&&, _T1>,
      is_convertible<const _U2&, _T2>>;
 using __converts = typename conditional<__implicit,
           __do_converts,
           __not_<__do_converts>>::type;
 return __and_<is_constructible<_T1, _U1&&>,
        is_constructible<_T2, const _U2&&>,
        __converts
        >::value;
      }
  };
  template <typename _T1, typename _T2>
    struct _PCC<false, _T1, _T2>
    {
      template <typename _U1, typename _U2>
      static constexpr bool _ConstructiblePair()
      {
 return false;
      }
      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyConvertiblePair()
      {
 return false;
      }
      template <typename _U1, typename _U2>
      static constexpr bool _MoveConstructiblePair()
      {
 return false;
      }
      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyMoveConvertiblePair()
      {
 return false;
      }
  };
  template<typename _U1, typename _U2> class __pair_base
  {
    template<typename _T1, typename _T2> friend struct pair;
    __pair_base() = default;
    ~__pair_base() = default;
    __pair_base(const __pair_base&) = default;
    __pair_base& operator=(const __pair_base&) = delete;
  };
  template<typename _T1, typename _T2>
    struct pair
    : private __pair_base<_T1, _T2>
    {
      typedef _T1 first_type;
      typedef _T2 second_type;
      _T1 first;
      _T2 second;
      template <typename _U1 = _T1,
                typename _U2 = _T2,
                typename enable_if<__and_<
                                     __is_implicitly_default_constructible<_U1>,
                                     __is_implicitly_default_constructible<_U2>>
                                   ::value, bool>::type = true>
      constexpr pair()
      : first(), second() { }
      template <typename _U1 = _T1,
                typename _U2 = _T2,
                typename enable_if<__and_<
                       is_default_constructible<_U1>,
                       is_default_constructible<_U2>,
                       __not_<
                         __and_<__is_implicitly_default_constructible<_U1>,
                                __is_implicitly_default_constructible<_U2>>>>
                                   ::value, bool>::type = false>
      explicit constexpr pair()
      : first(), second() { }
      using _PCCP = _PCC<true, _T1, _T2>;
      template<typename _U1 = _T1, typename _U2=_T2, typename
        enable_if<_PCCP::template
      _ConstructiblePair<_U1, _U2>()
                  && _PCCP::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
      constexpr pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }
       template<typename _U1 = _T1, typename _U2=_T2, typename
  enable_if<_PCCP::template
       _ConstructiblePair<_U1, _U2>()
                   && !_PCCP::template
       _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
      explicit constexpr pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }
      template <typename _U1, typename _U2>
        using _PCCFP = _PCC<!is_same<_T1, _U1>::value
       || !is_same<_T2, _U2>::value,
       _T1, _T2>;
      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _ConstructiblePair<_U1, _U2>()
                  && _PCCFP<_U1, _U2>::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
     bool>::type=true>
        constexpr pair(const pair<_U1, _U2>& __p)
        : first(__p.first), second(__p.second) { }
      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _ConstructiblePair<_U1, _U2>()
    && !_PCCFP<_U1, _U2>::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(const pair<_U1, _U2>& __p)
 : first(__p.first), second(__p.second) { }
      constexpr pair(const pair&) = default;
      constexpr pair(pair&&) = default;
      template<typename _U1, typename
        enable_if<_PCCP::template
      _MoveCopyPair<true, _U1, _T2>(),
                         bool>::type=true>
       constexpr pair(_U1&& __x, const _T2& __y)
       : first(std::forward<_U1>(__x)), second(__y) { }
      template<typename _U1, typename
        enable_if<_PCCP::template
      _MoveCopyPair<false, _U1, _T2>(),
                         bool>::type=false>
       explicit constexpr pair(_U1&& __x, const _T2& __y)
       : first(std::forward<_U1>(__x)), second(__y) { }
      template<typename _U2, typename
        enable_if<_PCCP::template
      _CopyMovePair<true, _T1, _U2>(),
                         bool>::type=true>
       constexpr pair(const _T1& __x, _U2&& __y)
       : first(__x), second(std::forward<_U2>(__y)) { }
      template<typename _U2, typename
        enable_if<_PCCP::template
      _CopyMovePair<false, _T1, _U2>(),
                         bool>::type=false>
       explicit pair(const _T1& __x, _U2&& __y)
       : first(__x), second(std::forward<_U2>(__y)) { }
      template<typename _U1, typename _U2, typename
        enable_if<_PCCP::template
      _MoveConstructiblePair<_U1, _U2>()
     && _PCCP::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
 constexpr pair(_U1&& __x, _U2&& __y)
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y)) { }
      template<typename _U1, typename _U2, typename
        enable_if<_PCCP::template
      _MoveConstructiblePair<_U1, _U2>()
     && !_PCCP::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(_U1&& __x, _U2&& __y)
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y)) { }
      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _MoveConstructiblePair<_U1, _U2>()
     && _PCCFP<_U1, _U2>::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
 constexpr pair(pair<_U1, _U2>&& __p)
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second)) { }
      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _MoveConstructiblePair<_U1, _U2>()
     && !_PCCFP<_U1, _U2>::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(pair<_U1, _U2>&& __p)
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second)) { }
      template<typename... _Args1, typename... _Args2>
        pair(piecewise_construct_t, tuple<_Args1...>, tuple<_Args2...>);
                           pair&
      operator=(typename conditional<
  __and_<is_copy_assignable<_T1>,
         is_copy_assignable<_T2>>::value,
  const pair&, const __nonesuch&>::type __p)
      {
 first = __p.first;
 second = __p.second;
 return *this;
      }
                           pair&
      operator=(typename conditional<
  __and_<is_move_assignable<_T1>,
         is_move_assignable<_T2>>::value,
  pair&&, __nonesuch&&>::type __p)
      noexcept(__and_<is_nothrow_move_assignable<_T1>,
        is_nothrow_move_assignable<_T2>>::value)
      {
 first = std::forward<first_type>(__p.first);
 second = std::forward<second_type>(__p.second);
 return *this;
      }
      template<typename _U1, typename _U2>
 typename enable_if<__and_<is_assignable<_T1&, const _U1&>,
      is_assignable<_T2&, const _U2&>>::value,
      pair&>::type
 operator=(const pair<_U1, _U2>& __p)
 {
   first = __p.first;
   second = __p.second;
   return *this;
 }
      template<typename _U1, typename _U2>
 typename enable_if<__and_<is_assignable<_T1&, _U1&&>,
      is_assignable<_T2&, _U2&&>>::value,
      pair&>::type
 operator=(pair<_U1, _U2>&& __p)
 {
   first = std::forward<_U1>(__p.first);
   second = std::forward<_U2>(__p.second);
   return *this;
 }
                           void
      swap(pair& __p)
      noexcept(__and_<__is_nothrow_swappable<_T1>,
                      __is_nothrow_swappable<_T2>>::value)
      {
 using std::swap;
 swap(first, __p.first);
 swap(second, __p.second);
      }
    private:
      template<typename... _Args1, size_t... _Indexes1,
        typename... _Args2, size_t... _Indexes2>
        pair(tuple<_Args1...>&, tuple<_Args2...>&,
      _Index_tuple<_Indexes1...>, _Index_tuple<_Indexes2...>);
    };
  template<typename _T1, typename _T2> pair(_T1, _T2) -> pair<_T1, _T2>;
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator==(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first == __y.first && __x.second == __y.second; }
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator<(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first < __y.first
      || (!(__y.first < __x.first) && __x.second < __y.second); }
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator!=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x == __y); }
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator>(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __y < __x; }
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator<=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__y < __x); }
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator>=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x < __y); }
  template<typename _T1, typename _T2>
                         inline
    typename enable_if<__and_<__is_swappable<_T1>,
                              __is_swappable<_T2>>::value>::type
    swap(pair<_T1, _T2>& __x, pair<_T1, _T2>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
  template<typename _T1, typename _T2>
    typename enable_if<!__and_<__is_swappable<_T1>,
          __is_swappable<_T2>>::value>::type
    swap(pair<_T1, _T2>&, pair<_T1, _T2>&) = delete;
  template<typename _T1, typename _T2>
    constexpr pair<typename __decay_and_strip<_T1>::__type,
                   typename __decay_and_strip<_T2>::__type>
    make_pair(_T1&& __x, _T2&& __y)
    {
      typedef typename __decay_and_strip<_T1>::__type __ds_type1;
      typedef typename __decay_and_strip<_T2>::__type __ds_type2;
      typedef pair<__ds_type1, __ds_type2> __pair_type;
      return __pair_type(std::forward<_T1>(__x), std::forward<_T2>(__y));
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  struct input_iterator_tag { };
  struct output_iterator_tag { };
  struct forward_iterator_tag : public input_iterator_tag { };
  struct bidirectional_iterator_tag : public forward_iterator_tag { };
  struct random_access_iterator_tag : public bidirectional_iterator_tag { };
  template<typename _Category, typename _Tp, typename _Distance = ptrdiff_t,
           typename _Pointer = _Tp*, typename _Reference = _Tp&>
    struct iterator
    {
      typedef _Category iterator_category;
      typedef _Tp value_type;
      typedef _Distance difference_type;
      typedef _Pointer pointer;
      typedef _Reference reference;
    };
  template<typename _Iterator>
    struct iterator_traits;
  template<typename _Iterator, typename = __void_t<>>
    struct __iterator_traits { };
  template<typename _Iterator>
    struct __iterator_traits<_Iterator,
        __void_t<typename _Iterator::iterator_category,
          typename _Iterator::value_type,
          typename _Iterator::difference_type,
          typename _Iterator::pointer,
          typename _Iterator::reference>>
    {
      typedef typename _Iterator::iterator_category iterator_category;
      typedef typename _Iterator::value_type value_type;
      typedef typename _Iterator::difference_type difference_type;
      typedef typename _Iterator::pointer pointer;
      typedef typename _Iterator::reference reference;
    };
  template<typename _Iterator>
    struct iterator_traits
    : public __iterator_traits<_Iterator> { };
  template<typename _Tp>
    struct iterator_traits<_Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef _Tp& reference;
    };
  template<typename _Tp>
    struct iterator_traits<const _Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef const _Tp* pointer;
      typedef const _Tp& reference;
    };
  template<typename _Iter>
    inline constexpr
    typename iterator_traits<_Iter>::iterator_category
    __iterator_category(const _Iter&)
    { return typename iterator_traits<_Iter>::iterator_category(); }
  template<typename _Iter>
    using __iterator_category_t
      = typename iterator_traits<_Iter>::iterator_category;
  template<typename _InIter>
    using _RequireInputIter =
      __enable_if_t<is_convertible<__iterator_category_t<_InIter>,
       input_iterator_tag>::value>;
  template<typename _It,
    typename _Cat = __iterator_category_t<_It>>
    struct __is_random_access_iter
      : is_base_of<random_access_iterator_tag, _Cat>
    {
      typedef is_base_of<random_access_iterator_tag, _Cat> _Base;
      enum { __value = _Base::value };
    };
}


namespace std __attribute__ ((__visibility__ ("default")))
{
  template <typename> struct _List_iterator;
  template <typename> struct _List_const_iterator;
  template<typename _InputIterator>
    inline constexpr
    typename iterator_traits<_InputIterator>::difference_type
    __distance(_InputIterator __first, _InputIterator __last,
               input_iterator_tag)
    {
      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      while (__first != __last)
 {
   ++__first;
   ++__n;
 }
      return __n;
    }
  template<typename _RandomAccessIterator>
    inline constexpr
    typename iterator_traits<_RandomAccessIterator>::difference_type
    __distance(_RandomAccessIterator __first, _RandomAccessIterator __last,
               random_access_iterator_tag)
    {
      return __last - __first;
    }
  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_iterator<_Tp>,
        std::_List_iterator<_Tp>,
        input_iterator_tag);
  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_const_iterator<_Tp>,
        std::_List_const_iterator<_Tp>,
        input_iterator_tag);
  template<typename _InputIterator>
    inline constexpr
    typename iterator_traits<_InputIterator>::difference_type
    distance(_InputIterator __first, _InputIterator __last)
    {
      return std::__distance(__first, __last,
        std::__iterator_category(__first));
    }
  template<typename _InputIterator, typename _Distance>
    inline constexpr void
    __advance(_InputIterator& __i, _Distance __n, input_iterator_tag)
    {
      do { if (__builtin_is_constant_evaluated() && !bool(__n >= 0)) __builtin_unreachable(); } while (false);
      while (__n--)
 ++__i;
    }
  template<typename _BidirectionalIterator, typename _Distance>
    inline constexpr void
    __advance(_BidirectionalIterator& __i, _Distance __n,
       bidirectional_iterator_tag)
    {
      if (__n > 0)
        while (__n--)
   ++__i;
      else
        while (__n++)
   --__i;
    }
  template<typename _RandomAccessIterator, typename _Distance>
    inline constexpr void
    __advance(_RandomAccessIterator& __i, _Distance __n,
              random_access_iterator_tag)
    {
      if (__builtin_constant_p(__n) && __n == 1)
 ++__i;
      else if (__builtin_constant_p(__n) && __n == -1)
 --__i;
      else
 __i += __n;
    }
  template<typename _InputIterator, typename _Distance>
    inline constexpr void
    advance(_InputIterator& __i, _Distance __n)
    {
      typename iterator_traits<_InputIterator>::difference_type __d = __n;
      std::__advance(__i, __d, std::__iterator_category(__i));
    }
  template<typename _InputIterator>
    inline constexpr _InputIterator
    next(_InputIterator __x, typename
  iterator_traits<_InputIterator>::difference_type __n = 1)
    {
      std::advance(__x, __n);
      return __x;
    }
  template<typename _BidirectionalIterator>
    inline constexpr _BidirectionalIterator
    prev(_BidirectionalIterator __x, typename
  iterator_traits<_BidirectionalIterator>::difference_type __n = 1)
    {
      std::advance(__x, -__n);
      return __x;
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  class __undefined;
  template<typename _Tp, typename _Up>
    struct __replace_first_arg
    { };
  template<template<typename, typename...> class _Template, typename _Up,
           typename _Tp, typename... _Types>
    struct __replace_first_arg<_Template<_Tp, _Types...>, _Up>
    { using type = _Template<_Up, _Types...>; };
  template<typename _Tp, typename _Up>
    using __replace_first_arg_t = typename __replace_first_arg<_Tp, _Up>::type;
  template<typename _Tp>
    using __make_not_void
      = typename conditional<is_void<_Tp>::value, __undefined, _Tp>::type;
  template<typename _Ptr>
    struct __ptr_traits_elem_1
    { };
  template<template<typename, typename...> class _SomePointer, typename _Tp,
    typename... _Args>
    struct __ptr_traits_elem_1<_SomePointer<_Tp, _Args...>>
    {
      using element_type = _Tp;
      using pointer = _SomePointer<_Tp, _Args...>;
      static pointer
      pointer_to(__make_not_void<element_type>& __e)
      { return pointer::pointer_to(__e); }
    };
  template<typename _Ptr, typename = void>
    struct __ptr_traits_elem : __ptr_traits_elem_1<_Ptr>
    { };
  template<typename _Ptr>
    struct __ptr_traits_elem<_Ptr, __void_t<typename _Ptr::element_type>>
    {
      using element_type = typename _Ptr::element_type;
      static _Ptr
      pointer_to(__make_not_void<element_type>& __e)
      { return _Ptr::pointer_to(__e); }
    };
  template<typename _Ptr>
    struct pointer_traits : __ptr_traits_elem<_Ptr>
    {
    private:
      template<typename _Tp>
 using __difference_type = typename _Tp::difference_type;
      template<typename _Tp, typename _Up, typename = void>
 struct __rebind : __replace_first_arg<_Tp, _Up> { };
      template<typename _Tp, typename _Up>
 struct __rebind<_Tp, _Up, __void_t<typename _Tp::template rebind<_Up>>>
 { using type = typename _Tp::template rebind<_Up>; };
    public:
      using pointer = _Ptr;
      using difference_type
 = __detected_or_t<ptrdiff_t, __difference_type, _Ptr>;
      template<typename _Up>
        using rebind = typename __rebind<_Ptr, _Up>::type;
    };
  template<typename _Tp>
    struct pointer_traits<_Tp*>
    {
      typedef _Tp* pointer;
      typedef _Tp element_type;
      typedef ptrdiff_t difference_type;
      template<typename _Up>
        using rebind = _Up*;
      static pointer
      pointer_to(__make_not_void<element_type>& __r) noexcept
      { return std::addressof(__r); }
    };
  template<typename _Ptr, typename _Tp>
    using __ptr_rebind = typename pointer_traits<_Ptr>::template rebind<_Tp>;
  template<typename _Tp>
    constexpr _Tp*
    __to_address(_Tp* __ptr) noexcept
    {
      static_assert(!std::is_function<_Tp>::value, "not a function pointer");
      return __ptr;
    }
  template<typename _Ptr>
    constexpr typename std::pointer_traits<_Ptr>::element_type*
    __to_address(const _Ptr& __ptr)
    { return std::__to_address(__ptr.operator->()); }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Iterator>
    class reverse_iterator
    : public iterator<typename iterator_traits<_Iterator>::iterator_category,
        typename iterator_traits<_Iterator>::value_type,
        typename iterator_traits<_Iterator>::difference_type,
        typename iterator_traits<_Iterator>::pointer,
                      typename iterator_traits<_Iterator>::reference>
    {
      template<typename _Iter>
 friend class reverse_iterator;
    protected:
      _Iterator current;
      typedef iterator_traits<_Iterator> __traits_type;
    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::pointer pointer;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      constexpr
      reverse_iterator() : current() { }
      explicit constexpr
      reverse_iterator(iterator_type __x) : current(__x) { }
      constexpr
      reverse_iterator(const reverse_iterator& __x)
      : current(__x.current) { }
      reverse_iterator& operator=(const reverse_iterator&) = default;
      template<typename _Iter>
 constexpr
        reverse_iterator(const reverse_iterator<_Iter>& __x)
 : current(__x.current) { }
      template<typename _Iter>
 constexpr
 reverse_iterator&
 operator=(const reverse_iterator<_Iter>& __x)
 {
   current = __x.current;
   return *this;
 }
      constexpr iterator_type
      base() const
      { return current; }
      constexpr reference
      operator*() const
      {
 _Iterator __tmp = current;
 return *--__tmp;
      }
      constexpr pointer
      operator->() const
      {
 _Iterator __tmp = current;
 --__tmp;
 return _S_to_pointer(__tmp);
      }
      constexpr reverse_iterator&
      operator++()
      {
 --current;
 return *this;
      }
      constexpr reverse_iterator
      operator++(int)
      {
 reverse_iterator __tmp = *this;
 --current;
 return __tmp;
      }
      constexpr reverse_iterator&
      operator--()
      {
 ++current;
 return *this;
      }
      constexpr reverse_iterator
      operator--(int)
      {
 reverse_iterator __tmp = *this;
 ++current;
 return __tmp;
      }
      constexpr reverse_iterator
      operator+(difference_type __n) const
      { return reverse_iterator(current - __n); }
      constexpr reverse_iterator&
      operator+=(difference_type __n)
      {
 current -= __n;
 return *this;
      }
      constexpr reverse_iterator
      operator-(difference_type __n) const
      { return reverse_iterator(current + __n); }
      constexpr reverse_iterator&
      operator-=(difference_type __n)
      {
 current += __n;
 return *this;
      }
      constexpr reference
      operator[](difference_type __n) const
      { return *(*this + __n); }
    private:
      template<typename _Tp>
 static constexpr _Tp*
 _S_to_pointer(_Tp* __p)
        { return __p; }
      template<typename _Tp>
 static constexpr pointer
 _S_to_pointer(_Tp __t)
        { return __t.operator->(); }
    };
  template<typename _Iterator>
    inline constexpr bool
    operator==(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }
  template<typename _Iterator>
    inline constexpr bool
    operator<(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() < __x.base(); }
  template<typename _Iterator>
    inline constexpr bool
    operator!=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x == __y); }
  template<typename _Iterator>
    inline constexpr bool
    operator>(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y < __x; }
  template<typename _Iterator>
    inline constexpr bool
    operator<=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__y < __x); }
  template<typename _Iterator>
    inline constexpr bool
    operator>=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x < __y); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator==(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __x.base() > __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator!=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() != __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __x.base() < __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() >= __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() <= __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr auto
    operator-(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    -> decltype(__y.base() - __x.base())
    { return __y.base() - __x.base(); }
  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    operator+(typename reverse_iterator<_Iterator>::difference_type __n,
       const reverse_iterator<_Iterator>& __x)
    { return reverse_iterator<_Iterator>(__x.base() - __n); }
  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    __make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }
  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }
  template<typename _Iterator>
    auto
    __niter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__niter_base(__it.base())))
    { return __make_reverse_iterator(__niter_base(__it.base())); }
  template<typename _Iterator>
    struct __is_move_iterator<reverse_iterator<_Iterator> >
      : __is_move_iterator<_Iterator>
    { };
  template<typename _Iterator>
    auto
    __miter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__miter_base(__it.base())))
    { return __make_reverse_iterator(__miter_base(__it.base())); }
  template<typename _Container>
    class back_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;
    public:
      typedef _Container container_type;
      explicit
      back_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
      back_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_back(__value);
 return *this;
      }
      back_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_back(std::move(__value));
 return *this;
      }
      back_insert_iterator&
      operator*()
      { return *this; }
      back_insert_iterator&
      operator++()
      { return *this; }
      back_insert_iterator
      operator++(int)
      { return *this; }
    };
  template<typename _Container>
    inline back_insert_iterator<_Container>
    back_inserter(_Container& __x)
    { return back_insert_iterator<_Container>(__x); }
  template<typename _Container>
    class front_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;
    public:
      typedef _Container container_type;
      explicit
      front_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
      front_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_front(__value);
 return *this;
      }
      front_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_front(std::move(__value));
 return *this;
      }
      front_insert_iterator&
      operator*()
      { return *this; }
      front_insert_iterator&
      operator++()
      { return *this; }
      front_insert_iterator
      operator++(int)
      { return *this; }
    };
  template<typename _Container>
    inline front_insert_iterator<_Container>
    front_inserter(_Container& __x)
    { return front_insert_iterator<_Container>(__x); }
  template<typename _Container>
    class insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
      typedef typename _Container::iterator _Iter;
    protected:
      _Container* container;
      _Iter iter;
    public:
      typedef _Container container_type;
      insert_iterator(_Container& __x, _Iter __i)
      : container(std::__addressof(__x)), iter(__i) {}
      insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 iter = container->insert(iter, __value);
 ++iter;
 return *this;
      }
      insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 iter = container->insert(iter, std::move(__value));
 ++iter;
 return *this;
      }
      insert_iterator&
      operator*()
      { return *this; }
      insert_iterator&
      operator++()
      { return *this; }
      insert_iterator&
      operator++(int)
      { return *this; }
    };
  template<typename _Container>
    inline insert_iterator<_Container>
    inserter(_Container& __x, typename _Container::iterator __i)
    { return insert_iterator<_Container>(__x, __i); }
}
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
  template<typename _Iterator, typename _Container>
    class __normal_iterator
    {
    protected:
      _Iterator _M_current;
      typedef std::iterator_traits<_Iterator> __traits_type;
    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      typedef typename __traits_type::pointer pointer;
      constexpr __normal_iterator() noexcept
      : _M_current(_Iterator()) { }
      explicit
      __normal_iterator(const _Iterator& __i) noexcept
      : _M_current(__i) { }
      template<typename _Iter>
        __normal_iterator(const __normal_iterator<_Iter,
     typename __enable_if<
              (std::__are_same<_Iter, typename _Container::pointer>::__value),
        _Container>::__type>& __i) noexcept
        : _M_current(__i.base()) { }
      reference
      operator*() const noexcept
      { return *_M_current; }
      pointer
      operator->() const noexcept
      { return _M_current; }
      __normal_iterator&
      operator++() noexcept
      {
 ++_M_current;
 return *this;
      }
      __normal_iterator
      operator++(int) noexcept
      { return __normal_iterator(_M_current++); }
      __normal_iterator&
      operator--() noexcept
      {
 --_M_current;
 return *this;
      }
      __normal_iterator
      operator--(int) noexcept
      { return __normal_iterator(_M_current--); }
      reference
      operator[](difference_type __n) const noexcept
      { return _M_current[__n]; }
      __normal_iterator&
      operator+=(difference_type __n) noexcept
      { _M_current += __n; return *this; }
      __normal_iterator
      operator+(difference_type __n) const noexcept
      { return __normal_iterator(_M_current + __n); }
      __normal_iterator&
      operator-=(difference_type __n) noexcept
      { _M_current -= __n; return *this; }
      __normal_iterator
      operator-(difference_type __n) const noexcept
      { return __normal_iterator(_M_current - __n); }
      const _Iterator&
      base() const noexcept
      { return _M_current; }
    };
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator==(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() == __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline bool
    operator==(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() == __rhs.base(); }
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() != __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() != __rhs.base(); }
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() < __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline bool
    operator<(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() < __rhs.base(); }
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() > __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline bool
    operator>(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() > __rhs.base(); }
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() <= __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() <= __rhs.base(); }
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() >= __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() >= __rhs.base(); }
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline auto
    operator-(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs) noexcept
    -> decltype(__lhs.base() - __rhs.base())
    { return __lhs.base() - __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() - __rhs.base(); }
  template<typename _Iterator, typename _Container>
    inline __normal_iterator<_Iterator, _Container>
    operator+(typename __normal_iterator<_Iterator, _Container>::difference_type
       __n, const __normal_iterator<_Iterator, _Container>& __i)
    noexcept
    { return __normal_iterator<_Iterator, _Container>(__i.base() + __n); }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Iterator, typename _Container>
    _Iterator
    __niter_base(__gnu_cxx::__normal_iterator<_Iterator, _Container> __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it.base(); }
  namespace __detail
  {
  }
  template<typename _Iterator>
    class move_iterator
    {
      _Iterator _M_current;
      using __traits_type = iterator_traits<_Iterator>;
      using __base_ref = typename __traits_type::reference;
      template<typename _Iter2>
 friend class move_iterator;
    public:
      using iterator_type = _Iterator;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef _Iterator pointer;
      typedef typename conditional<is_reference<__base_ref>::value,
    typename remove_reference<__base_ref>::type&&,
    __base_ref>::type reference;
      constexpr
      move_iterator()
      : _M_current() { }
      explicit constexpr
      move_iterator(iterator_type __i)
      : _M_current(std::move(__i)) { }
      template<typename _Iter>
 constexpr
 move_iterator(const move_iterator<_Iter>& __i)
 : _M_current(__i._M_current) { }
      template<typename _Iter>
 constexpr
 move_iterator& operator=(const move_iterator<_Iter>& __i)
 {
   _M_current = __i._M_current;
   return *this;
 }
      constexpr iterator_type
      base() const
      { return _M_current; }
      constexpr reference
      operator*() const
      { return static_cast<reference>(*_M_current); }
      constexpr pointer
      operator->() const
      { return _M_current; }
      constexpr move_iterator&
      operator++()
      {
 ++_M_current;
 return *this;
      }
      constexpr move_iterator
      operator++(int)
      {
 move_iterator __tmp = *this;
 ++_M_current;
 return __tmp;
      }
      constexpr move_iterator&
      operator--()
      {
 --_M_current;
 return *this;
      }
      constexpr move_iterator
      operator--(int)
      {
 move_iterator __tmp = *this;
 --_M_current;
 return __tmp;
      }
      constexpr move_iterator
      operator+(difference_type __n) const
      { return move_iterator(_M_current + __n); }
      constexpr move_iterator&
      operator+=(difference_type __n)
      {
 _M_current += __n;
 return *this;
      }
      constexpr move_iterator
      operator-(difference_type __n) const
      { return move_iterator(_M_current - __n); }
      constexpr move_iterator&
      operator-=(difference_type __n)
      {
 _M_current -= __n;
 return *this;
      }
      constexpr reference
      operator[](difference_type __n) const
      { return std::move(_M_current[__n]); }
    };
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator==(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator!=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__x == __y); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    { return __x.base() < __y.base(); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__y < __x); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    { return __y < __x; }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__x < __y); }
  template<typename _Iterator>
    inline constexpr bool
    operator==(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }
  template<typename _Iterator>
    inline constexpr bool
    operator!=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__x == __y); }
  template<typename _Iterator>
    inline constexpr bool
    operator<(const move_iterator<_Iterator>& __x,
       const move_iterator<_Iterator>& __y)
    { return __x.base() < __y.base(); }
  template<typename _Iterator>
    inline constexpr bool
    operator<=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__y < __x); }
  template<typename _Iterator>
    inline constexpr bool
    operator>(const move_iterator<_Iterator>& __x,
       const move_iterator<_Iterator>& __y)
    { return __y < __x; }
  template<typename _Iterator>
    inline constexpr bool
    operator>=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__x < __y); }
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr auto
    operator-(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    -> decltype(__x.base() - __y.base())
    { return __x.base() - __y.base(); }
  template<typename _Iterator>
    inline constexpr move_iterator<_Iterator>
    operator+(typename move_iterator<_Iterator>::difference_type __n,
       const move_iterator<_Iterator>& __x)
    { return __x + __n; }
  template<typename _Iterator>
    inline constexpr move_iterator<_Iterator>
    make_move_iterator(_Iterator __i)
    { return move_iterator<_Iterator>(std::move(__i)); }
  template<typename _Iterator, typename _ReturnType
    = typename conditional<__move_if_noexcept_cond
      <typename iterator_traits<_Iterator>::value_type>::value,
                _Iterator, move_iterator<_Iterator>>::type>
    inline constexpr _ReturnType
    __make_move_if_noexcept_iterator(_Iterator __i)
    { return _ReturnType(__i); }
  template<typename _Tp, typename _ReturnType
    = typename conditional<__move_if_noexcept_cond<_Tp>::value,
      const _Tp*, move_iterator<_Tp*>>::type>
    inline constexpr _ReturnType
    __make_move_if_noexcept_iterator(_Tp* __i)
    { return _ReturnType(__i); }
  template<typename _Iterator>
    auto
    __niter_base(move_iterator<_Iterator> __it)
    -> decltype(make_move_iterator(__niter_base(__it.base())))
    { return make_move_iterator(__niter_base(__it.base())); }
  template<typename _Iterator>
    struct __is_move_iterator<move_iterator<_Iterator> >
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
  template<typename _Iterator>
    auto
    __miter_base(move_iterator<_Iterator> __it)
    -> decltype(__miter_base(__it.base()))
    { return __miter_base(__it.base()); }
  template<typename _InputIterator>
    using __iter_key_t = remove_const_t<
    typename iterator_traits<_InputIterator>::value_type::first_type>;
  template<typename _InputIterator>
    using __iter_val_t =
    typename iterator_traits<_InputIterator>::value_type::second_type;
  template<typename _T1, typename _T2>
    struct pair;
  template<typename _InputIterator>
    using __iter_to_alloc_t =
    pair<add_const_t<__iter_key_t<_InputIterator>>,
  __iter_val_t<_InputIterator>>;
}

namespace std
{
  namespace __debug { }
}
namespace __gnu_debug
{
  using namespace std::__debug;
  template<typename _Ite, typename _Seq, typename _Cat>
    struct _Safe_iterator;
}

namespace __gnu_cxx
{
namespace __ops
{
  struct _Iter_less_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      constexpr
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 < *__it2; }
  };
  constexpr
  inline _Iter_less_iter
  __iter_less_iter()
  { return _Iter_less_iter(); }
  struct _Iter_less_val
  {
    constexpr _Iter_less_val() = default;
    explicit
    _Iter_less_val(_Iter_less_iter) { }
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it < __val; }
  };
  inline _Iter_less_val
  __iter_less_val()
  { return _Iter_less_val(); }
  inline _Iter_less_val
  __iter_comp_val(_Iter_less_iter)
  { return _Iter_less_val(); }
  struct _Val_less_iter
  {
    constexpr _Val_less_iter() = default;
    explicit
    _Val_less_iter(_Iter_less_iter) { }
    template<typename _Value, typename _Iterator>
      bool
      operator()(_Value& __val, _Iterator __it) const
      { return __val < *__it; }
  };
  inline _Val_less_iter
  __val_less_iter()
  { return _Val_less_iter(); }
  inline _Val_less_iter
  __val_comp_iter(_Iter_less_iter)
  { return _Val_less_iter(); }
  struct _Iter_equal_to_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 == *__it2; }
  };
  inline _Iter_equal_to_iter
  __iter_equal_to_iter()
  { return _Iter_equal_to_iter(); }
  struct _Iter_equal_to_val
  {
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it == __val; }
  };
  inline _Iter_equal_to_val
  __iter_equal_to_val()
  { return _Iter_equal_to_val(); }
  inline _Iter_equal_to_val
  __iter_comp_val(_Iter_equal_to_iter)
  { return _Iter_equal_to_val(); }
  template<typename _Compare>
    struct _Iter_comp_iter
    {
      _Compare _M_comp;
      explicit constexpr
      _Iter_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }
      template<typename _Iterator1, typename _Iterator2>
        constexpr
        bool
        operator()(_Iterator1 __it1, _Iterator2 __it2)
        { return bool(_M_comp(*__it1, *__it2)); }
    };
  template<typename _Compare>
    constexpr
    inline _Iter_comp_iter<_Compare>
    __iter_comp_iter(_Compare __comp)
    { return _Iter_comp_iter<_Compare>(std::move(__comp)); }
  template<typename _Compare>
    struct _Iter_comp_val
    {
      _Compare _M_comp;
      explicit
      _Iter_comp_val(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }
      explicit
      _Iter_comp_val(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }
      explicit
      _Iter_comp_val(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }
      template<typename _Iterator, typename _Value>
 bool
 operator()(_Iterator __it, _Value& __val)
 { return bool(_M_comp(*__it, __val)); }
    };
  template<typename _Compare>
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Compare __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }
  template<typename _Compare>
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Iter_comp_iter<_Compare> __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }
  template<typename _Compare>
    struct _Val_comp_iter
    {
      _Compare _M_comp;
      explicit
      _Val_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }
      explicit
      _Val_comp_iter(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }
      explicit
      _Val_comp_iter(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }
      template<typename _Value, typename _Iterator>
 bool
 operator()(_Value& __val, _Iterator __it)
 { return bool(_M_comp(__val, *__it)); }
    };
  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Compare __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }
  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Iter_comp_iter<_Compare> __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }
  template<typename _Value>
    struct _Iter_equals_val
    {
      _Value& _M_value;
      explicit
      _Iter_equals_val(_Value& __value)
 : _M_value(__value)
      { }
      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return *__it == _M_value; }
    };
  template<typename _Value>
    inline _Iter_equals_val<_Value>
    __iter_equals_val(_Value& __val)
    { return _Iter_equals_val<_Value>(__val); }
  template<typename _Iterator1>
    struct _Iter_equals_iter
    {
      _Iterator1 _M_it1;
      explicit
      _Iter_equals_iter(_Iterator1 __it1)
 : _M_it1(__it1)
      { }
      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return *__it2 == *_M_it1; }
    };
  template<typename _Iterator>
    inline _Iter_equals_iter<_Iterator>
    __iter_comp_iter(_Iter_equal_to_iter, _Iterator __it)
    { return _Iter_equals_iter<_Iterator>(__it); }
  template<typename _Predicate>
    struct _Iter_pred
    {
      _Predicate _M_pred;
      explicit
      _Iter_pred(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }
      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_pred(*__it)); }
    };
  template<typename _Predicate>
    inline _Iter_pred<_Predicate>
    __pred_iter(_Predicate __pred)
    { return _Iter_pred<_Predicate>(std::move(__pred)); }
  template<typename _Compare, typename _Value>
    struct _Iter_comp_to_val
    {
      _Compare _M_comp;
      _Value& _M_value;
      _Iter_comp_to_val(_Compare __comp, _Value& __value)
 : _M_comp(std::move(__comp)), _M_value(__value)
      { }
      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_comp(*__it, _M_value)); }
    };
  template<typename _Compare, typename _Value>
    _Iter_comp_to_val<_Compare, _Value>
    __iter_comp_val(_Compare __comp, _Value &__val)
    {
      return _Iter_comp_to_val<_Compare, _Value>(std::move(__comp), __val);
    }
  template<typename _Compare, typename _Iterator1>
    struct _Iter_comp_to_iter
    {
      _Compare _M_comp;
      _Iterator1 _M_it1;
      _Iter_comp_to_iter(_Compare __comp, _Iterator1 __it1)
 : _M_comp(std::move(__comp)), _M_it1(__it1)
      { }
      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return bool(_M_comp(*__it2, *_M_it1)); }
    };
  template<typename _Compare, typename _Iterator>
    inline _Iter_comp_to_iter<_Compare, _Iterator>
    __iter_comp_iter(_Iter_comp_iter<_Compare> __comp, _Iterator __it)
    {
      return _Iter_comp_to_iter<_Compare, _Iterator>(
   std::move(__comp._M_comp), __it);
    }
  template<typename _Predicate>
    struct _Iter_negate
    {
      _Predicate _M_pred;
      explicit
      _Iter_negate(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }
      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return !bool(_M_pred(*__it)); }
    };
  template<typename _Predicate>
    inline _Iter_negate<_Predicate>
    __negate(_Iter_pred<_Predicate> __pred)
    { return _Iter_negate<_Predicate>(std::move(__pred._M_pred)); }
}
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp, typename _Up>
    constexpr
    inline int
    __memcmp(const _Tp* __first1, const _Up* __first2, size_t __num)
    {
      static_assert(sizeof(_Tp) == sizeof(_Up), "can be compared with memcmp");
 return __builtin_memcmp(__first1, __first2, sizeof(_Tp) * __num);
    }
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline void
    iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
    {
      swap(*__a, *__b);
    }
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    _ForwardIterator2
    swap_ranges(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
  _ForwardIterator2 __first2)
    {
                                                       ;
      for (; __first1 != __last1; ++__first1, (void)++__first2)
 std::iter_swap(__first1, __first2);
      return __first2;
    }
  template<typename _Tp>
    constexpr
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {
      if (__b < __a)
 return __b;
      return __a;
    }
  template<typename _Tp>
    constexpr
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {
      if (__a < __b)
 return __b;
      return __a;
    }
  template<typename _Tp, typename _Compare>
    constexpr
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {
      if (__comp(__b, __a))
 return __b;
      return __a;
    }
  template<typename _Tp, typename _Compare>
    constexpr
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {
      if (__comp(__a, __b))
 return __b;
      return __a;
    }
  template<typename _Iterator>
    inline _Iterator
    __niter_base(_Iterator __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it; }
  template<typename _Ite, typename _Seq>
    _Ite
    __niter_base(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq,
   std::random_access_iterator_tag>&);
  template<typename _From, typename _To>
    inline _From
    __niter_wrap(_From __from, _To __res)
    { return __from + (__res - std::__niter_base(__from)); }
  template<typename _Iterator>
    inline _Iterator
    __niter_wrap(const _Iterator&, _Iterator __res)
    { return __res; }
  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = *__first;
   return __result;
 }
    };
  template<typename _Category>
    struct __copy_move<true, false, _Category>
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = std::move(*__first);
   return __result;
 }
    };
  template<>
    struct __copy_move<false, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = *__first;
       ++__first;
       ++__result;
     }
   return __result;
 }
    };
  template<>
    struct __copy_move<true, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = std::move(*__first);
       ++__first;
       ++__result;
     }
   return __result;
 }
    };
  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
 static _Tp*
 __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
 {
   using __assignable = conditional<_IsMove,
        is_move_assignable<_Tp>,
        is_copy_assignable<_Tp>>;
   static_assert( __assignable::type::value, "type is not assignable" );
   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
   return __result + _Num;
 }
    };
  template<typename _Tp, typename _Ref, typename _Ptr>
    struct _Deque_iterator;
  struct _Bit_iterator;
  template<typename _CharT>
    struct char_traits;
  template<typename _CharT, typename _Traits>
    class istreambuf_iterator;
  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator;
  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(_CharT*, _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);
  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(const _CharT*, const _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);
  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
     istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);
  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value,
      std::_Deque_iterator<_CharT, _CharT&, _CharT*> >::__type
    __copy_move_a2(
 istreambuf_iterator<_CharT, char_traits<_CharT> >,
 istreambuf_iterator<_CharT, char_traits<_CharT> >,
 std::_Deque_iterator<_CharT, _CharT&, _CharT*>);
  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
    {
      typedef typename iterator_traits<_II>::iterator_category _Category;
      return std::__copy_move<_IsMove, __memcpyable<_OI, _II>::__value,
         _Category>::__copy_m(__first, __last, __result);
    }
  template<bool _IsMove,
    typename _Tp, typename _Ref, typename _Ptr, typename _OI>
    _OI
    __copy_move_a1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
     std::_Deque_iterator<_Tp, _Ref, _Ptr>,
     _OI);
  template<bool _IsMove,
    typename _ITp, typename _IRef, typename _IPtr, typename _OTp>
    std::_Deque_iterator<_OTp, _OTp&, _OTp*>
    __copy_move_a1(std::_Deque_iterator<_ITp, _IRef, _IPtr>,
     std::_Deque_iterator<_ITp, _IRef, _IPtr>,
     std::_Deque_iterator<_OTp, _OTp&, _OTp*>);
  template<bool _IsMove, typename _II, typename _Tp>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value,
      std::_Deque_iterator<_Tp, _Tp&, _Tp*> >::__type
    __copy_move_a1(_II, _II, std::_Deque_iterator<_Tp, _Tp&, _Tp*>);
  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a1(_II __first, _II __last, _OI __result)
    { return std::__copy_move_a2<_IsMove>(__first, __last, __result); }
  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_a1<_IsMove>(std::__niter_base(__first),
          std::__niter_base(__last),
          std::__niter_base(__result)));
    }
  template<bool _IsMove,
    typename _Ite, typename _Seq, typename _Cat, typename _OI>
    _OI
    __copy_move_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
    const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
    _OI);
  template<bool _IsMove,
    typename _II, typename _Ite, typename _Seq, typename _Cat>
    __gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __copy_move_a(_II, _II,
    const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&);
  template<bool _IsMove,
    typename _IIte, typename _ISeq, typename _ICat,
    typename _OIte, typename _OSeq, typename _OCat>
    ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>
    __copy_move_a(const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
    const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
    const ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>&);
  template<typename _InputIterator, typename _Size, typename _OutputIterator>
    _OutputIterator
    __copy_n_a(_InputIterator __first, _Size __n, _OutputIterator __result,
        bool)
    {
      if (__n > 0)
 {
   while (true)
     {
       *__result = *__first;
       ++__result;
       if (--__n > 0)
  ++__first;
       else
  break;
     }
 }
      return __result;
    }
  template<typename _CharT, typename _Size>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value, _CharT*>::__type
    __copy_n_a(istreambuf_iterator<_CharT, char_traits<_CharT> >,
        _Size, _CharT*, bool);
  template<typename _CharT, typename _Size>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value,
      std::_Deque_iterator<_CharT, _CharT&, _CharT*> >::__type
    __copy_n_a(istreambuf_iterator<_CharT, char_traits<_CharT> >, _Size,
        std::_Deque_iterator<_CharT, _CharT&, _CharT*>,
        bool);
  template<typename _II, typename _OI>
    inline _OI
    copy(_II __first, _II __last, _OI __result)
    {
                                                                       ;
      return std::__copy_move_a<__is_move_iterator<_II>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
  template<typename _II, typename _OI>
    inline _OI
    move(_II __first, _II __last, _OI __result)
    {
                                                                       ;
      return std::__copy_move_a<true>(std::__miter_base(__first),
          std::__miter_base(__last), __result);
    }
  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move_backward
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = *--__last;
   return __result;
 }
    };
  template<typename _Category>
    struct __copy_move_backward<true, false, _Category>
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = std::move(*--__last);
   return __result;
 }
    };
  template<>
    struct __copy_move_backward<false, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type
     __n = __last - __first;
   for (; __n > 0; --__n)
     *--__result = *--__last;
   return __result;
 }
    };
  template<>
    struct __copy_move_backward<true, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type
     __n = __last - __first;
   for (; __n > 0; --__n)
     *--__result = std::move(*--__last);
   return __result;
 }
    };
  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
 static _Tp*
 __copy_move_b(const _Tp* __first, const _Tp* __last, _Tp* __result)
 {
   using __assignable = conditional<_IsMove,
        is_move_assignable<_Tp>,
        is_copy_assignable<_Tp>>;
   static_assert( __assignable::type::value, "type is not assignable" );
   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
   return __result - _Num;
 }
    };
  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      typedef typename iterator_traits<_BI1>::iterator_category _Category;
      return std::__copy_move_backward<_IsMove,
           __memcpyable<_BI2, _BI1>::__value,
           _Category>::__copy_move_b(__first,
         __last,
         __result);
    }
  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a1(_BI1 __first, _BI1 __last, _BI2 __result)
    { return std::__copy_move_backward_a2<_IsMove>(__first, __last, __result); }
  template<bool _IsMove,
    typename _Tp, typename _Ref, typename _Ptr, typename _OI>
    _OI
    __copy_move_backward_a1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
       std::_Deque_iterator<_Tp, _Ref, _Ptr>,
       _OI);
  template<bool _IsMove,
    typename _ITp, typename _IRef, typename _IPtr, typename _OTp>
    std::_Deque_iterator<_OTp, _OTp&, _OTp*>
    __copy_move_backward_a1(
   std::_Deque_iterator<_ITp, _IRef, _IPtr>,
   std::_Deque_iterator<_ITp, _IRef, _IPtr>,
   std::_Deque_iterator<_OTp, _OTp&, _OTp*>);
  template<bool _IsMove, typename _II, typename _Tp>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value,
      std::_Deque_iterator<_Tp, _Tp&, _Tp*> >::__type
    __copy_move_backward_a1(_II, _II,
       std::_Deque_iterator<_Tp, _Tp&, _Tp*>);
  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_backward_a(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_backward_a1<_IsMove>
    (std::__niter_base(__first), std::__niter_base(__last),
     std::__niter_base(__result)));
    }
  template<bool _IsMove,
    typename _Ite, typename _Seq, typename _Cat, typename _OI>
    _OI
    __copy_move_backward_a(
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
  _OI);
  template<bool _IsMove,
    typename _II, typename _Ite, typename _Seq, typename _Cat>
    __gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __copy_move_backward_a(_II, _II,
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&);
  template<bool _IsMove,
    typename _IIte, typename _ISeq, typename _ICat,
    typename _OIte, typename _OSeq, typename _OCat>
    ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>
    __copy_move_backward_a(
  const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
  const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
  const ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>&);
  template<typename _BI1, typename _BI2>
    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {
                                                                       ;
      return std::__copy_move_backward_a<__is_move_iterator<_BI1>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
  template<typename _BI1, typename _BI2>
    inline _BI2
    move_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {
                                                                       ;
      return std::__copy_move_backward_a<true>(std::__miter_base(__first),
            std::__miter_base(__last),
            __result);
    }
  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, void>::__type
    __fill_a1(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      for (; __first != __last; ++__first)
 *__first = __value;
    }
  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, void>::__type
    __fill_a1(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __first != __last; ++__first)
 *__first = __tmp;
    }
  template<typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, void>::__type
    __fill_a1(_Tp* __first, _Tp* __last, const _Tp& __c)
    {
      const _Tp __tmp = __c;
      if (const size_t __len = __last - __first)
 __builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
    }
  template<typename _Ite, typename _Cont, typename _Tp>
    inline void
    __fill_a1(::__gnu_cxx::__normal_iterator<_Ite, _Cont> __first,
       ::__gnu_cxx::__normal_iterator<_Ite, _Cont> __last,
       const _Tp& __value)
    { std::__fill_a1(__first.base(), __last.base(), __value); }
  template<typename _Tp, typename _VTp>
    void
    __fill_a1(const std::_Deque_iterator<_Tp, _Tp&, _Tp*>&,
       const std::_Deque_iterator<_Tp, _Tp&, _Tp*>&,
       const _VTp&);
  void
  __fill_a1(std::_Bit_iterator, std::_Bit_iterator,
     const bool&);
  template<typename _FIte, typename _Tp>
    inline void
    __fill_a(_FIte __first, _FIte __last, const _Tp& __value)
    { std::__fill_a1(__first, __last, __value); }
  template<typename _Ite, typename _Seq, typename _Cat, typename _Tp>
    void
    __fill_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
      const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
      const _Tp&);
  template<typename _ForwardIterator, typename _Tp>
    inline void
    fill(_ForwardIterator __first, _ForwardIterator __last, const _Tp& __value)
    {
                                                     ;
      std::__fill_a(__first, __last, __value);
    }
  inline constexpr int
  __size_to_integer(int __n) { return __n; }
  inline constexpr unsigned
  __size_to_integer(unsigned __n) { return __n; }
  inline constexpr long
  __size_to_integer(long __n) { return __n; }
  inline constexpr unsigned long
  __size_to_integer(unsigned long __n) { return __n; }
  inline constexpr long long
  __size_to_integer(long long __n) { return __n; }
  inline constexpr unsigned long long
  __size_to_integer(unsigned long long __n) { return __n; }
  inline constexpr long long
  __size_to_integer(float __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(double __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(long double __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(__float128 __n) { return (long long)__n; }
  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a1(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      for (; __n > 0; --__n, (void) ++__first)
 *__first = __value;
      return __first;
    }
  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a1(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __n > 0; --__n, (void) ++__first)
 *__first = __tmp;
      return __first;
    }
  template<typename _Ite, typename _Seq, typename _Cat, typename _Size,
    typename _Tp>
    ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __fill_n_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>& __first,
        _Size __n, const _Tp& __value,
        std::input_iterator_tag);
  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::output_iterator_tag)
    {
      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");
      return __fill_n_a1(__first, __n, __value);
    }
  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::input_iterator_tag)
    {
      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");
      return __fill_n_a1(__first, __n, __value);
    }
  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::random_access_iterator_tag)
    {
      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");
      if (__n <= 0)
 return __first;
                                                    ;
      std::__fill_a(__first, __first + __n, __value);
      return __first + __n;
    }
  template<typename _OI, typename _Size, typename _Tp>
    inline _OI
    fill_n(_OI __first, _Size __n, const _Tp& __value)
    {
      return std::__fill_n_a(__first, std::__size_to_integer(__n), __value,
          std::__iterator_category(__first));
    }
  template<bool _BoolType>
    struct __equal
    {
      template<typename _II1, typename _II2>
 static bool
 equal(_II1 __first1, _II1 __last1, _II2 __first2)
 {
   for (; __first1 != __last1; ++__first1, (void) ++__first2)
     if (!(*__first1 == *__first2))
       return false;
   return true;
 }
    };
  template<>
    struct __equal<true>
    {
      template<typename _Tp>
 static bool
 equal(const _Tp* __first1, const _Tp* __last1, const _Tp* __first2)
 {
   if (const size_t __len = (__last1 - __first1))
     return !std::__memcmp(__first1, __first2, __len);
   return true;
 }
    };
  template<typename _Tp, typename _Ref, typename _Ptr, typename _II>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value, bool>::__type
    __equal_aux1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
   std::_Deque_iterator<_Tp, _Ref, _Ptr>,
   _II);
  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __equal_aux1(std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
   std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
   std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);
  template<typename _II, typename _Tp, typename _Ref, typename _Ptr>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value, bool>::__type
    __equal_aux1(_II, _II,
  std::_Deque_iterator<_Tp, _Ref, _Ptr>);
  template<typename _II1, typename _II2>
    inline bool
    __equal_aux1(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      const bool __simple = ((__is_integer<_ValueType1>::__value
         || __is_pointer<_ValueType1>::__value)
        && __memcmpable<_II1, _II2>::__value);
      return std::__equal<__simple>::equal(__first1, __last1, __first2);
    }
  template<typename _II1, typename _II2>
    inline bool
    __equal_aux(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      return std::__equal_aux1(std::__niter_base(__first1),
          std::__niter_base(__last1),
          std::__niter_base(__first2));
    }
  template<typename _II1, typename _Seq1, typename _Cat1, typename _II2>
    bool
    __equal_aux(const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  _II2);
  template<typename _II1, typename _II2, typename _Seq2, typename _Cat2>
    bool
    __equal_aux(_II1, _II1,
  const ::__gnu_debug::_Safe_iterator<_II2, _Seq2, _Cat2>&);
  template<typename _II1, typename _Seq1, typename _Cat1,
    typename _II2, typename _Seq2, typename _Cat2>
    bool
    __equal_aux(const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II2, _Seq2, _Cat2>&);
  template<typename, typename>
    struct __lc_rai
    {
      template<typename _II1, typename _II2>
 static _II1
 __newlast1(_II1, _II1 __last1, _II2, _II2)
 { return __last1; }
      template<typename _II>
 static bool
 __cnd2(_II __first, _II __last)
 { return __first != __last; }
    };
  template<>
    struct __lc_rai<random_access_iterator_tag, random_access_iterator_tag>
    {
      template<typename _RAI1, typename _RAI2>
 static _RAI1
 __newlast1(_RAI1 __first1, _RAI1 __last1,
     _RAI2 __first2, _RAI2 __last2)
 {
   const typename iterator_traits<_RAI1>::difference_type
     __diff1 = __last1 - __first1;
   const typename iterator_traits<_RAI2>::difference_type
     __diff2 = __last2 - __first2;
   return __diff2 < __diff1 ? __first1 + __diff2 : __last1;
 }
      template<typename _RAI>
 static bool
 __cnd2(_RAI, _RAI)
 { return true; }
    };
  template<typename _II1, typename _II2, typename _Compare>
    bool
    __lexicographical_compare_impl(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2,
       _Compare __comp)
    {
      typedef typename iterator_traits<_II1>::iterator_category _Category1;
      typedef typename iterator_traits<_II2>::iterator_category _Category2;
      typedef std::__lc_rai<_Category1, _Category2> __rai_type;
      __last1 = __rai_type::__newlast1(__first1, __last1, __first2, __last2);
      for (; __first1 != __last1 && __rai_type::__cnd2(__first2, __last2);
    ++__first1, (void)++__first2)
 {
   if (__comp(__first1, __first2))
     return true;
   if (__comp(__first2, __first1))
     return false;
 }
      return __first1 == __last1 && __first2 != __last2;
    }
  template<bool _BoolType>
    struct __lexicographical_compare
    {
      template<typename _II1, typename _II2>
 static bool
 __lc(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
 {
   using __gnu_cxx::__ops::__iter_less_iter;
   return std::__lexicographical_compare_impl(__first1, __last1,
           __first2, __last2,
           __iter_less_iter());
 }
      template<typename _II1, typename _II2>
 static int
 __3way(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
 {
   while (__first1 != __last1)
     {
       if (__first2 == __last2)
  return +1;
       if (*__first1 < *__first2)
  return -1;
       if (*__first2 < *__first1)
  return +1;
       ++__first1;
       ++__first2;
     }
   return int(__first2 == __last2) - 1;
 }
    };
  template<>
    struct __lexicographical_compare<true>
    {
      template<typename _Tp, typename _Up>
 static bool
 __lc(const _Tp* __first1, const _Tp* __last1,
      const _Up* __first2, const _Up* __last2)
 { return __3way(__first1, __last1, __first2, __last2) < 0; }
      template<typename _Tp, typename _Up>
 static ptrdiff_t
 __3way(const _Tp* __first1, const _Tp* __last1,
        const _Up* __first2, const _Up* __last2)
 {
   const size_t __len1 = __last1 - __first1;
   const size_t __len2 = __last2 - __first2;
   if (const size_t __len = std::min(__len1, __len2))
     if (int __result = std::__memcmp(__first1, __first2, __len))
       return __result;
   return ptrdiff_t(__len1 - __len2);
 }
    };
  template<typename _II1, typename _II2>
    inline bool
    __lexicographical_compare_aux1(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple =
 (__is_memcmp_ordered_with<_ValueType1, _ValueType2>::__value
  && __is_pointer<_II1>::__value
  && __is_pointer<_II2>::__value
  );
      return std::__lexicographical_compare<__simple>::__lc(__first1, __last1,
           __first2, __last2);
    }
  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2>
    bool
    __lexicographical_compare_aux1(
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 _Tp2*, _Tp2*);
  template<typename _Tp1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __lexicographical_compare_aux1(_Tp1*, _Tp1*,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);
  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __lexicographical_compare_aux1(
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);
  template<typename _II1, typename _II2>
    inline bool
    __lexicographical_compare_aux(_II1 __first1, _II1 __last1,
      _II2 __first2, _II2 __last2)
    {
      return std::__lexicographical_compare_aux1(std::__niter_base(__first1),
       std::__niter_base(__last1),
       std::__niter_base(__first2),
       std::__niter_base(__last2));
    }
  template<typename _Iter1, typename _Seq1, typename _Cat1,
    typename _II2>
    bool
    __lexicographical_compare_aux(
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  _II2, _II2);
  template<typename _II1,
    typename _Iter2, typename _Seq2, typename _Cat2>
    bool
    __lexicographical_compare_aux(
  _II1, _II1,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&);
  template<typename _Iter1, typename _Seq1, typename _Cat1,
    typename _Iter2, typename _Seq2, typename _Cat2>
    bool
    __lexicographical_compare_aux(
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&);
  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    _ForwardIterator
    __lower_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;
      _DistanceType __len = std::distance(__first, __last);
      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else
     __len = __half;
 }
      return __first;
    }
  template<typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {
                                                                  ;
      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val());
    }
  inline constexpr int
  __lg(int __n)
  { return (int)sizeof(int) * 8 - 1 - __builtin_clz(__n); }
  inline constexpr unsigned
  __lg(unsigned __n)
  { return (int)sizeof(int) * 8 - 1 - __builtin_clz(__n); }
  inline constexpr long
  __lg(long __n)
  { return (int)sizeof(long) * 8 - 1 - __builtin_clzl(__n); }
  inline constexpr unsigned long
  __lg(unsigned long __n)
  { return (int)sizeof(long) * 8 - 1 - __builtin_clzl(__n); }
  inline constexpr long long
  __lg(long long __n)
  { return (int)sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }
  inline constexpr unsigned long long
  __lg(unsigned long long __n)
  { return (int)sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }
  template<typename _II1, typename _II2>
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2)
    {
                                                                         ;
      return std::__equal_aux(__first1, __last1, __first2);
    }
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _BinaryPredicate __binary_pred)
    {
                                                       ;
      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return true;
    }
  template<typename _II1, typename _II2>
    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2);
 }
      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!(*__first1 == *__first2))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }
  template<typename _II1, typename _II2, typename _BinaryPredicate>
    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2,
      _BinaryPredicate __binary_pred)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2,
           __binary_pred);
 }
      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }
  template<typename _II1, typename _II2>
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {
                                                       ;
                                                       ;
      return std::__equal4(__first1, __last1, __first2, __last2);
    }
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _IIter2 __last2, _BinaryPredicate __binary_pred)
    {
                                                       ;
                                                       ;
      return std::__equal4(__first1, __last1, __first2, __last2,
          __binary_pred);
    }
  template<typename _II1, typename _II2>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {
                                                       ;
                                                       ;
      return std::__lexicographical_compare_aux(__first1, __last1,
      __first2, __last2);
    }
  template<typename _II1, typename _II2, typename _Compare>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2, _Compare __comp)
    {
                                                       ;
                                                       ;
      return std::__lexicographical_compare_impl
 (__first1, __last1, __first2, __last2,
  __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
  template<typename _InputIterator1, typename _InputIterator2>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2)
    {
                                                       ;
      return std::__mismatch(__first1, __last1, __first2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
                                                       ;
      return std::__mismatch(__first1, __last1, __first2,
 __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _InputIterator2 __last2,
        _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __first2 != __last2
      && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
  template<typename _InputIterator1, typename _InputIterator2>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2)
    {
                                                       ;
                                                       ;
      return std::__mismatch(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2,
      _BinaryPredicate __binary_pred)
    {
                                                       ;
                                                       ;
      return std::__mismatch(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }
  template<typename _InputIterator, typename _Predicate>
    inline _InputIterator
    __find_if(_InputIterator __first, _InputIterator __last,
       _Predicate __pred, input_iterator_tag)
    {
      while (__first != __last && !__pred(__first))
 ++__first;
      return __first;
    }
  template<typename _RandomAccessIterator, typename _Predicate>
    _RandomAccessIterator
    __find_if(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Predicate __pred, random_access_iterator_tag)
    {
      typename iterator_traits<_RandomAccessIterator>::difference_type
 __trip_count = (__last - __first) >> 2;
      for (; __trip_count > 0; --__trip_count)
 {
   if (__pred(__first))
     return __first;
   ++__first;
   if (__pred(__first))
     return __first;
   ++__first;
   if (__pred(__first))
     return __first;
   ++__first;
   if (__pred(__first))
     return __first;
   ++__first;
 }
      switch (__last - __first)
 {
 case 3:
   if (__pred(__first))
     return __first;
   ++__first;
 case 2:
   if (__pred(__first))
     return __first;
   ++__first;
 case 1:
   if (__pred(__first))
     return __first;
   ++__first;
 case 0:
 default:
   return __last;
 }
    }
  template<typename _Iterator, typename _Predicate>
    inline _Iterator
    __find_if(_Iterator __first, _Iterator __last, _Predicate __pred)
    {
      return __find_if(__first, __last, __pred,
         std::__iterator_category(__first));
    }
  template<typename _InputIterator, typename _Predicate>
    typename iterator_traits<_InputIterator>::difference_type
    __count_if(_InputIterator __first, _InputIterator __last, _Predicate __pred)
    {
      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      for (; __first != __last; ++__first)
 if (__pred(__first))
   ++__n;
      return __n;
    }
  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    bool
    __is_permutation(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
       _ForwardIterator2 __first2, _BinaryPredicate __pred)
    {
      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!__pred(__first1, __first2))
   break;
      if (__first1 == __last1)
 return true;
      _ForwardIterator2 __last2 = __first2;
      std::advance(__last2, std::distance(__first1, __last1));
      for (_ForwardIterator1 __scan = __first1; __scan != __last1; ++__scan)
 {
   if (__scan != std::__find_if(__first1, __scan,
     __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan)))
     continue;
   auto __matches
     = std::__count_if(__first2, __last2,
   __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan));
   if (0 == __matches ||
       std::__count_if(__scan, __last1,
   __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan))
       != __matches)
     return false;
 }
      return true;
    }
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline bool
    is_permutation(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
     _ForwardIterator2 __first2)
    {
                                                       ;
      return std::__is_permutation(__first1, __last1, __first2,
       __gnu_cxx::__ops::__iter_equal_to_iter());
    }
}

#pragma GCC visibility push(default)
extern "C++" {
namespace std
{
  class exception
  {
  public:
    exception() noexcept { }
    virtual ~exception() noexcept;
    exception(const exception&) = default;
    exception& operator=(const exception&) = default;
    exception(exception&&) = default;
    exception& operator=(exception&&) = default;
    virtual const char*
    what() const noexcept;
  };
}
}
#pragma GCC visibility pop

#pragma GCC visibility push(default)
extern "C++" {
namespace std
{
  class bad_alloc : public exception
  {
  public:
    bad_alloc() throw() { }
    bad_alloc(const bad_alloc&) = default;
    bad_alloc& operator=(const bad_alloc&) = default;
    virtual ~bad_alloc() throw();
    virtual const char* what() const throw();
  };
  class bad_array_new_length : public bad_alloc
  {
  public:
    bad_array_new_length() throw() { }
    virtual ~bad_array_new_length() throw();
    virtual const char* what() const throw();
  };
  enum class align_val_t: size_t {};
  struct nothrow_t
  {
    explicit nothrow_t() = default;
  };
  extern const nothrow_t nothrow;
  typedef void (*new_handler)();
  new_handler set_new_handler(new_handler) throw();
  new_handler get_new_handler() noexcept;
}
[[__nodiscard__]] void* operator new(std::size_t)
  __attribute__((__externally_visible__));
[[__nodiscard__]] void* operator new[](std::size_t)
  __attribute__((__externally_visible__));
void operator delete(void*) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*) noexcept
  __attribute__((__externally_visible__));
void operator delete(void*, std::size_t) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*, std::size_t) noexcept
  __attribute__((__externally_visible__));
[[__nodiscard__]] void* operator new(std::size_t, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
[[__nodiscard__]] void* operator new[](std::size_t, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete(void*, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__));
[[__nodiscard__]] void* operator new(std::size_t, std::align_val_t)
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
[[__nodiscard__]] void* operator new(std::size_t, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete(void*, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
void operator delete(void*, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__));
[[__nodiscard__]] void* operator new[](std::size_t, std::align_val_t)
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
[[__nodiscard__]] void* operator new[](std::size_t, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete[](void*, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
void operator delete[](void*, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__));
void operator delete(void*, std::size_t, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
void operator delete[](void*, std::size_t, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
[[__nodiscard__]] inline void* operator new(std::size_t, void* __p) noexcept
{ return __p; }
[[__nodiscard__]] inline void* operator new[](std::size_t, void* __p) noexcept
{ return __p; }
inline void operator delete (void*, void*) noexcept { }
inline void operator delete[](void*, void*) noexcept { }
}
namespace std
{
  template<typename _Tp>
    [[nodiscard]] constexpr _Tp*
    launder(_Tp* __p) noexcept
    { return __builtin_launder(__p); }
  template<typename _Ret, typename... _Args , bool _NE>
    void launder(_Ret (*)(_Args...) noexcept (_NE)) = delete;
  template<typename _Ret, typename... _Args , bool _NE>
    void launder(_Ret (*)(_Args......) noexcept (_NE)) = delete;
  void launder(void*) = delete;
  void launder(const void*) = delete;
  void launder(volatile void*) = delete;
  void launder(const volatile void*) = delete;
}
#pragma GCC visibility pop
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp>
    class new_allocator
    {
    public:
      typedef _Tp value_type;
      typedef std::size_t size_type;
      typedef std::ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;
      template<typename _Tp1>
 struct rebind
 { typedef new_allocator<_Tp1> other; };
      typedef std::true_type propagate_on_container_move_assignment;
      new_allocator() noexcept { }
      new_allocator(const new_allocator&) noexcept { }
      template<typename _Tp1>
 new_allocator(const new_allocator<_Tp1>&) noexcept { }
      ~new_allocator() noexcept { }
      pointer
      address(reference __x) const noexcept
      { return std::__addressof(__x); }
      const_pointer
      address(const_reference __x) const noexcept
      { return std::__addressof(__x); }
      [[__nodiscard__]] _Tp*
      allocate(size_type __n, const void* = static_cast<const void*>(0))
      {
  static_assert(sizeof(_Tp) != 0, "cannot allocate incomplete types");
 if (__builtin_expect(__n > this->_M_max_size(), false))
   {
     if (__n > (std::size_t(-1) / sizeof(_Tp)))
       std::__throw_bad_array_new_length();
     std::__throw_bad_alloc();
   }
 if (alignof(_Tp) > 8U)
   {
     std::align_val_t __al = std::align_val_t(alignof(_Tp));
     return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp), __al));
   }
 return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
      }
      void
      deallocate(_Tp* __p, size_type __t __attribute__ ((__unused__)))
      {
 if (alignof(_Tp) > 8U)
   {
     ::operator delete(__p,
         __t * sizeof(_Tp),
         std::align_val_t(alignof(_Tp)));
     return;
   }
 ::operator delete(__p
     , __t * sizeof(_Tp)
    );
      }
      size_type
      max_size() const noexcept
      { return _M_max_size(); }
      template<typename _Up, typename... _Args>
 void
 construct(_Up* __p, _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Up, _Args...>::value)
 { ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
      template<typename _Up>
 void
 destroy(_Up* __p)
 noexcept(std::is_nothrow_destructible<_Up>::value)
 { __p->~_Up(); }
      template<typename _Up>
 friend bool
 operator==(const new_allocator&, const new_allocator<_Up>&)
 noexcept
 { return true; }
      template<typename _Up>
 friend bool
 operator!=(const new_allocator&, const new_allocator<_Up>&)
 noexcept
 { return false; }
    private:
      constexpr size_type
      _M_max_size() const noexcept
      {
 return std::size_t(2147483647) / sizeof(_Tp);
      }
    };
}
namespace std
{
  template<typename _Tp>
    using __allocator_base = __gnu_cxx::new_allocator<_Tp>;
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename>
    class allocator;
  template<>
    class allocator<void>;
  template<typename, typename>
    struct uses_allocator;
  template<typename>
    struct allocator_traits;
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<>
    class allocator<void>
    {
    public:
      typedef void value_type;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef void* pointer;
      typedef const void* const_pointer;
      template<typename _Tp1>
 struct rebind
 { typedef allocator<_Tp1> other; };
      using propagate_on_container_move_assignment = true_type;
      using is_always_equal
 = true_type;
    };
  template<typename _Tp>
    class allocator : public __allocator_base<_Tp>
    {
    public:
      typedef _Tp value_type;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;
      template<typename _Tp1>
 struct rebind
 { typedef allocator<_Tp1> other; };
      using propagate_on_container_move_assignment = true_type;
      using is_always_equal
 = true_type;
      allocator() noexcept { }
      allocator(const allocator& __a) noexcept
      : __allocator_base<_Tp>(__a) { }
      allocator& operator=(const allocator&) = default;
      template<typename _Tp1>
 allocator(const allocator<_Tp1>&) noexcept { }
      ~allocator() noexcept { }
      friend bool
      operator==(const allocator&, const allocator&) noexcept
      { return true; }
      friend bool
      operator!=(const allocator&, const allocator&) noexcept
      { return false; }
    };
  template<typename _T1, typename _T2>
    inline bool
    operator==(const allocator<_T1>&, const allocator<_T2>&)
    noexcept
    { return true; }
  template<typename _T1, typename _T2>
    inline bool
    operator!=(const allocator<_T1>&, const allocator<_T2>&)
    noexcept
    { return false; }
  template<typename _Tp>
    class allocator<const _Tp>
    {
    public:
      typedef _Tp value_type;
      template<typename _Up> allocator(const allocator<_Up>&) { }
    };
  template<typename _Tp>
    class allocator<volatile _Tp>
    {
    public:
      typedef _Tp value_type;
      template<typename _Up> allocator(const allocator<_Up>&) { }
    };
  template<typename _Tp>
    class allocator<const volatile _Tp>
    {
    public:
      typedef _Tp value_type;
      template<typename _Up> allocator(const allocator<_Up>&) { }
    };
  extern template class allocator<char>;
  extern template class allocator<wchar_t>;
  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_swap
    { static void _S_do_it(_Alloc&, _Alloc&) noexcept { } };
  template<typename _Alloc>
    struct __alloc_swap<_Alloc, false>
    {
      static void
      _S_do_it(_Alloc& __one, _Alloc& __two) noexcept
      {
 if (__one != __two)
   swap(__one, __two);
      }
    };
  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_neq
    {
      static bool
      _S_do_it(const _Alloc&, const _Alloc&)
      { return false; }
    };
  template<typename _Alloc>
    struct __alloc_neq<_Alloc, false>
    {
      static bool
      _S_do_it(const _Alloc& __one, const _Alloc& __two)
      { return __one != __two; }
    };
  template<typename _Tp, bool
    = __or_<is_copy_constructible<typename _Tp::value_type>,
            is_nothrow_move_constructible<typename _Tp::value_type>>::value>
    struct __shrink_to_fit_aux
    { static bool _S_do_it(_Tp&) noexcept { return false; } };
  template<typename _Tp>
    struct __shrink_to_fit_aux<_Tp, true>
    {
      static bool
      _S_do_it(_Tp& __c) noexcept
      {
 try
   {
     _Tp(__make_move_if_noexcept_iterator(__c.begin()),
  __make_move_if_noexcept_iterator(__c.end()),
  __c.get_allocator()).swap(__c);
     return true;
   }
 catch(...)
   { return false; }
      }
    };
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Arg, typename _Result>
    struct unary_function
    {
      typedef _Arg argument_type;
      typedef _Result result_type;
    };
  template<typename _Arg1, typename _Arg2, typename _Result>
    struct binary_function
    {
      typedef _Arg1 first_argument_type;
      typedef _Arg2 second_argument_type;
      typedef _Result result_type;
    };
  struct __is_transparent;
  template<typename _Tp = void>
    struct plus;
  template<typename _Tp = void>
    struct minus;
  template<typename _Tp = void>
    struct multiplies;
  template<typename _Tp = void>
    struct divides;
  template<typename _Tp = void>
    struct modulus;
  template<typename _Tp = void>
    struct negate;
  template<typename _Tp>
    struct plus : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x + __y; }
    };
  template<typename _Tp>
    struct minus : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x - __y; }
    };
  template<typename _Tp>
    struct multiplies : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x * __y; }
    };
  template<typename _Tp>
    struct divides : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x / __y; }
    };
  template<typename _Tp>
    struct modulus : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x % __y; }
    };
  template<typename _Tp>
    struct negate : public unary_function<_Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x) const
      { return -__x; }
    };
  template<>
    struct plus<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) + std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) + std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct minus<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) - std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) - std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) - std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct multiplies<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) * std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) * std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) * std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct divides<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) / std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) / std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) / std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct modulus<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) % std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) % std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) % std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct negate<void>
    {
      template <typename _Tp>
 constexpr
 auto
 operator()(_Tp&& __t) const
 noexcept(noexcept(-std::forward<_Tp>(__t)))
 -> decltype(-std::forward<_Tp>(__t))
 { return -std::forward<_Tp>(__t); }
      typedef __is_transparent is_transparent;
    };
  template<typename _Tp = void>
    struct equal_to;
  template<typename _Tp = void>
    struct not_equal_to;
  template<typename _Tp = void>
    struct greater;
  template<typename _Tp = void>
    struct less;
  template<typename _Tp = void>
    struct greater_equal;
  template<typename _Tp = void>
    struct less_equal;
  template<typename _Tp>
    struct equal_to : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x == __y; }
    };
  template<typename _Tp>
    struct not_equal_to : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x != __y; }
    };
  template<typename _Tp>
    struct greater : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x > __y; }
    };
  template<typename _Tp>
    struct less : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x < __y; }
    };
  template<typename _Tp>
    struct greater_equal : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x >= __y; }
    };
  template<typename _Tp>
    struct less_equal : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x <= __y; }
    };
  template<typename _Tp>
    struct greater<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
      constexpr bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
 if (__builtin_is_constant_evaluated())
   return __x > __y;
 return (unsigned int)__x > (unsigned int)__y;
      }
    };
  template<typename _Tp>
    struct less<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
      constexpr bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
 if (__builtin_is_constant_evaluated())
   return __x < __y;
 return (unsigned int)__x < (unsigned int)__y;
      }
    };
  template<typename _Tp>
    struct greater_equal<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
      constexpr bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
 if (__builtin_is_constant_evaluated())
   return __x >= __y;
 return (unsigned int)__x >= (unsigned int)__y;
      }
    };
  template<typename _Tp>
    struct less_equal<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
      constexpr bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
 if (__builtin_is_constant_evaluated())
   return __x <= __y;
 return (unsigned int)__x <= (unsigned int)__y;
      }
    };
  template<>
    struct equal_to<void>
    {
      template <typename _Tp, typename _Up>
 constexpr auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) == std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) == std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) == std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct not_equal_to<void>
    {
      template <typename _Tp, typename _Up>
 constexpr auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) != std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) != std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) != std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct greater<void>
    {
      template <typename _Tp, typename _Up>
 constexpr auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) > std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) > std::forward<_Up>(__u))
 {
   return _S_cmp(std::forward<_Tp>(__t), std::forward<_Up>(__u),
   __ptr_cmp<_Tp, _Up>{});
 }
      template<typename _Tp, typename _Up>
 constexpr bool
 operator()(_Tp* __t, _Up* __u) const noexcept
 { return greater<common_type_t<_Tp*, _Up*>>{}(__t, __u); }
      typedef __is_transparent is_transparent;
    private:
      template <typename _Tp, typename _Up>
 static constexpr decltype(auto)
 _S_cmp(_Tp&& __t, _Up&& __u, false_type)
 { return std::forward<_Tp>(__t) > std::forward<_Up>(__u); }
      template <typename _Tp, typename _Up>
 static constexpr bool
 _S_cmp(_Tp&& __t, _Up&& __u, true_type) noexcept
 {
   return greater<const volatile void*>{}(
       static_cast<const volatile void*>(std::forward<_Tp>(__t)),
       static_cast<const volatile void*>(std::forward<_Up>(__u)));
 }
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded2 : true_type { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded2<_Tp, _Up, __void_t<
   decltype(std::declval<_Tp>().operator>(std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded : __not_overloaded2<_Tp, _Up> { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded<_Tp, _Up, __void_t<
   decltype(operator>(std::declval<_Tp>(), std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up>
 using __ptr_cmp = __and_<__not_overloaded<_Tp, _Up>,
       is_convertible<_Tp, const volatile void*>,
       is_convertible<_Up, const volatile void*>>;
    };
  template<>
    struct less<void>
    {
      template <typename _Tp, typename _Up>
 constexpr auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) < std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) < std::forward<_Up>(__u))
 {
   return _S_cmp(std::forward<_Tp>(__t), std::forward<_Up>(__u),
   __ptr_cmp<_Tp, _Up>{});
 }
      template<typename _Tp, typename _Up>
 constexpr bool
 operator()(_Tp* __t, _Up* __u) const noexcept
 { return less<common_type_t<_Tp*, _Up*>>{}(__t, __u); }
      typedef __is_transparent is_transparent;
    private:
      template <typename _Tp, typename _Up>
 static constexpr decltype(auto)
 _S_cmp(_Tp&& __t, _Up&& __u, false_type)
 { return std::forward<_Tp>(__t) < std::forward<_Up>(__u); }
      template <typename _Tp, typename _Up>
 static constexpr bool
 _S_cmp(_Tp&& __t, _Up&& __u, true_type) noexcept
 {
   return less<const volatile void*>{}(
       static_cast<const volatile void*>(std::forward<_Tp>(__t)),
       static_cast<const volatile void*>(std::forward<_Up>(__u)));
 }
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded2 : true_type { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded2<_Tp, _Up, __void_t<
   decltype(std::declval<_Tp>().operator<(std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded : __not_overloaded2<_Tp, _Up> { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded<_Tp, _Up, __void_t<
   decltype(operator<(std::declval<_Tp>(), std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up>
 using __ptr_cmp = __and_<__not_overloaded<_Tp, _Up>,
       is_convertible<_Tp, const volatile void*>,
       is_convertible<_Up, const volatile void*>>;
    };
  template<>
    struct greater_equal<void>
    {
      template <typename _Tp, typename _Up>
 constexpr auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) >= std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) >= std::forward<_Up>(__u))
 {
   return _S_cmp(std::forward<_Tp>(__t), std::forward<_Up>(__u),
   __ptr_cmp<_Tp, _Up>{});
 }
      template<typename _Tp, typename _Up>
 constexpr bool
 operator()(_Tp* __t, _Up* __u) const noexcept
 { return greater_equal<common_type_t<_Tp*, _Up*>>{}(__t, __u); }
      typedef __is_transparent is_transparent;
    private:
      template <typename _Tp, typename _Up>
 static constexpr decltype(auto)
 _S_cmp(_Tp&& __t, _Up&& __u, false_type)
 { return std::forward<_Tp>(__t) >= std::forward<_Up>(__u); }
      template <typename _Tp, typename _Up>
 static constexpr bool
 _S_cmp(_Tp&& __t, _Up&& __u, true_type) noexcept
 {
   return greater_equal<const volatile void*>{}(
       static_cast<const volatile void*>(std::forward<_Tp>(__t)),
       static_cast<const volatile void*>(std::forward<_Up>(__u)));
 }
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded2 : true_type { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded2<_Tp, _Up, __void_t<
   decltype(std::declval<_Tp>().operator>=(std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded : __not_overloaded2<_Tp, _Up> { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded<_Tp, _Up, __void_t<
   decltype(operator>=(std::declval<_Tp>(), std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up>
 using __ptr_cmp = __and_<__not_overloaded<_Tp, _Up>,
       is_convertible<_Tp, const volatile void*>,
       is_convertible<_Up, const volatile void*>>;
    };
  template<>
    struct less_equal<void>
    {
      template <typename _Tp, typename _Up>
 constexpr auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) <= std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) <= std::forward<_Up>(__u))
 {
   return _S_cmp(std::forward<_Tp>(__t), std::forward<_Up>(__u),
   __ptr_cmp<_Tp, _Up>{});
 }
      template<typename _Tp, typename _Up>
 constexpr bool
 operator()(_Tp* __t, _Up* __u) const noexcept
 { return less_equal<common_type_t<_Tp*, _Up*>>{}(__t, __u); }
      typedef __is_transparent is_transparent;
    private:
      template <typename _Tp, typename _Up>
 static constexpr decltype(auto)
 _S_cmp(_Tp&& __t, _Up&& __u, false_type)
 { return std::forward<_Tp>(__t) <= std::forward<_Up>(__u); }
      template <typename _Tp, typename _Up>
 static constexpr bool
 _S_cmp(_Tp&& __t, _Up&& __u, true_type) noexcept
 {
   return less_equal<const volatile void*>{}(
       static_cast<const volatile void*>(std::forward<_Tp>(__t)),
       static_cast<const volatile void*>(std::forward<_Up>(__u)));
 }
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded2 : true_type { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded2<_Tp, _Up, __void_t<
   decltype(std::declval<_Tp>().operator<=(std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up, typename = void>
 struct __not_overloaded : __not_overloaded2<_Tp, _Up> { };
      template<typename _Tp, typename _Up>
 struct __not_overloaded<_Tp, _Up, __void_t<
   decltype(operator<=(std::declval<_Tp>(), std::declval<_Up>()))>>
 : false_type { };
      template<typename _Tp, typename _Up>
 using __ptr_cmp = __and_<__not_overloaded<_Tp, _Up>,
       is_convertible<_Tp, const volatile void*>,
       is_convertible<_Up, const volatile void*>>;
    };
  template<typename _Tp = void>
    struct logical_and;
  template<typename _Tp = void>
    struct logical_or;
  template<typename _Tp = void>
    struct logical_not;
  template<typename _Tp>
    struct logical_and : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x && __y; }
    };
  template<typename _Tp>
    struct logical_or : public binary_function<_Tp, _Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x || __y; }
    };
  template<typename _Tp>
    struct logical_not : public unary_function<_Tp, bool>
    {
      constexpr
      bool
      operator()(const _Tp& __x) const
      { return !__x; }
    };
  template<>
    struct logical_and<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) && std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) && std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) && std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct logical_or<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) || std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) || std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) || std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template<>
    struct logical_not<void>
    {
      template <typename _Tp>
 constexpr
 auto
 operator()(_Tp&& __t) const
 noexcept(noexcept(!std::forward<_Tp>(__t)))
 -> decltype(!std::forward<_Tp>(__t))
 { return !std::forward<_Tp>(__t); }
      typedef __is_transparent is_transparent;
    };
  template<typename _Tp = void>
    struct bit_and;
  template<typename _Tp = void>
    struct bit_or;
  template<typename _Tp = void>
    struct bit_xor;
  template<typename _Tp = void>
    struct bit_not;
  template<typename _Tp>
    struct bit_and : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x & __y; }
    };
  template<typename _Tp>
    struct bit_or : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x | __y; }
    };
  template<typename _Tp>
    struct bit_xor : public binary_function<_Tp, _Tp, _Tp>
    {
      constexpr
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x ^ __y; }
    };
  template<typename _Tp>
    struct bit_not : public unary_function<_Tp, _Tp>
    {
    constexpr
      _Tp
      operator()(const _Tp& __x) const
      { return ~__x; }
    };
  template <>
    struct bit_and<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) & std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) & std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) & std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template <>
    struct bit_or<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) | std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) | std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) | std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template <>
    struct bit_xor<void>
    {
      template <typename _Tp, typename _Up>
 constexpr
 auto
 operator()(_Tp&& __t, _Up&& __u) const
 noexcept(noexcept(std::forward<_Tp>(__t) ^ std::forward<_Up>(__u)))
 -> decltype(std::forward<_Tp>(__t) ^ std::forward<_Up>(__u))
 { return std::forward<_Tp>(__t) ^ std::forward<_Up>(__u); }
      typedef __is_transparent is_transparent;
    };
  template <>
    struct bit_not<void>
    {
      template <typename _Tp>
 constexpr
 auto
 operator()(_Tp&& __t) const
 noexcept(noexcept(~std::forward<_Tp>(__t)))
 -> decltype(~std::forward<_Tp>(__t))
 { return ~std::forward<_Tp>(__t); }
      typedef __is_transparent is_transparent;
    };
  template<typename _Predicate>
    class unary_negate
    : public unary_function<typename _Predicate::argument_type, bool>
    {
    protected:
      _Predicate _M_pred;
    public:
      constexpr
      explicit
      unary_negate(const _Predicate& __x) : _M_pred(__x) { }
      constexpr
      bool
      operator()(const typename _Predicate::argument_type& __x) const
      { return !_M_pred(__x); }
    };
  template<typename _Predicate>
    constexpr
    inline unary_negate<_Predicate>
    not1(const _Predicate& __pred)
    { return unary_negate<_Predicate>(__pred); }
  template<typename _Predicate>
    class binary_negate
    : public binary_function<typename _Predicate::first_argument_type,
        typename _Predicate::second_argument_type, bool>
    {
    protected:
      _Predicate _M_pred;
    public:
      constexpr
      explicit
      binary_negate(const _Predicate& __x) : _M_pred(__x) { }
      constexpr
      bool
      operator()(const typename _Predicate::first_argument_type& __x,
   const typename _Predicate::second_argument_type& __y) const
      { return !_M_pred(__x, __y); }
    };
  template<typename _Predicate>
    constexpr
    inline binary_negate<_Predicate>
    not2(const _Predicate& __pred)
    { return binary_negate<_Predicate>(__pred); }
  template<typename _Arg, typename _Result>
    class pointer_to_unary_function : public unary_function<_Arg, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg);
    public:
      pointer_to_unary_function() { }
      explicit
      pointer_to_unary_function(_Result (*__x)(_Arg))
      : _M_ptr(__x) { }
      _Result
      operator()(_Arg __x) const
      { return _M_ptr(__x); }
    };
  template<typename _Arg, typename _Result>
    inline pointer_to_unary_function<_Arg, _Result>
    ptr_fun(_Result (*__x)(_Arg))
    { return pointer_to_unary_function<_Arg, _Result>(__x); }
  template<typename _Arg1, typename _Arg2, typename _Result>
    class pointer_to_binary_function
    : public binary_function<_Arg1, _Arg2, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg1, _Arg2);
    public:
      pointer_to_binary_function() { }
      explicit
      pointer_to_binary_function(_Result (*__x)(_Arg1, _Arg2))
      : _M_ptr(__x) { }
      _Result
      operator()(_Arg1 __x, _Arg2 __y) const
      { return _M_ptr(__x, __y); }
    };
  template<typename _Arg1, typename _Arg2, typename _Result>
    inline pointer_to_binary_function<_Arg1, _Arg2, _Result>
    ptr_fun(_Result (*__x)(_Arg1, _Arg2))
    { return pointer_to_binary_function<_Arg1, _Arg2, _Result>(__x); }
  template<typename _Tp>
    struct _Identity
    : public unary_function<_Tp, _Tp>
    {
      _Tp&
      operator()(_Tp& __x) const
      { return __x; }
      const _Tp&
      operator()(const _Tp& __x) const
      { return __x; }
    };
  template<typename _Tp> struct _Identity<const _Tp> : _Identity<_Tp> { };
  template<typename _Pair>
    struct _Select1st
    : public unary_function<_Pair, typename _Pair::first_type>
    {
      typename _Pair::first_type&
      operator()(_Pair& __x) const
      { return __x.first; }
      const typename _Pair::first_type&
      operator()(const _Pair& __x) const
      { return __x.first; }
      template<typename _Pair2>
        typename _Pair2::first_type&
        operator()(_Pair2& __x) const
        { return __x.first; }
      template<typename _Pair2>
        const typename _Pair2::first_type&
        operator()(const _Pair2& __x) const
        { return __x.first; }
    };
  template<typename _Pair>
    struct _Select2nd
    : public unary_function<_Pair, typename _Pair::second_type>
    {
      typename _Pair::second_type&
      operator()(_Pair& __x) const
      { return __x.second; }
      const typename _Pair::second_type&
      operator()(const _Pair& __x) const
      { return __x.second; }
    };
  template<typename _Ret, typename _Tp>
    class mem_fun_t : public unary_function<_Tp*, _Ret>
    {
    public:
      explicit
      mem_fun_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }
      _Ret
      operator()(_Tp* __p) const
      { return (__p->*_M_f)(); }
    private:
      _Ret (_Tp::*_M_f)();
    };
  template<typename _Ret, typename _Tp>
    class const_mem_fun_t : public unary_function<const _Tp*, _Ret>
    {
    public:
      explicit
      const_mem_fun_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }
      _Ret
      operator()(const _Tp* __p) const
      { return (__p->*_M_f)(); }
    private:
      _Ret (_Tp::*_M_f)() const;
    };
  template<typename _Ret, typename _Tp>
    class mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      mem_fun_ref_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }
      _Ret
      operator()(_Tp& __r) const
      { return (__r.*_M_f)(); }
    private:
      _Ret (_Tp::*_M_f)();
  };
  template<typename _Ret, typename _Tp>
    class const_mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      const_mem_fun_ref_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }
      _Ret
      operator()(const _Tp& __r) const
      { return (__r.*_M_f)(); }
    private:
      _Ret (_Tp::*_M_f)() const;
    };
  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_t : public binary_function<_Tp*, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }
      _Ret
      operator()(_Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }
    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };
  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_t : public binary_function<const _Tp*, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }
      _Ret
      operator()(const _Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }
    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };
  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }
      _Ret
      operator()(_Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }
    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };
  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }
      _Ret
      operator()(const _Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }
    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };
  template<typename _Ret, typename _Tp>
    inline mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)())
    { return mem_fun_t<_Ret, _Tp>(__f); }
  template<typename _Ret, typename _Tp>
    inline const_mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_t<_Ret, _Tp>(__f); }
  template<typename _Ret, typename _Tp>
    inline mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)())
    { return mem_fun_ref_t<_Ret, _Tp>(__f); }
  template<typename _Ret, typename _Tp>
    inline const_mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_ref_t<_Ret, _Tp>(__f); }
  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_t<_Ret, _Tp, _Arg>(__f); }
  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_t<_Ret, _Tp, _Arg>(__f); }
  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }
  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }
  template<typename _Func, typename _SfinaeType, typename = __void_t<>>
    struct __has_is_transparent
    { };
  template<typename _Func, typename _SfinaeType>
    struct __has_is_transparent<_Func, _SfinaeType,
    __void_t<typename _Func::is_transparent>>
    { typedef void type; };
  template<typename _Func, typename _SfinaeType>
    using __has_is_transparent_t
      = typename __has_is_transparent<_Func, _SfinaeType>::type;
}
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Operation>
    class binder1st
    : public unary_function<typename _Operation::second_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::first_argument_type value;
    public:
      binder1st(const _Operation& __x,
  const typename _Operation::first_argument_type& __y)
      : op(__x), value(__y) { }
      typename _Operation::result_type
      operator()(const typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }
      typename _Operation::result_type
      operator()(typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }
    } __attribute__ ((__deprecated__ ("use '" "std::bind" "' instead")));
  template<typename _Operation, typename _Tp>
    inline binder1st<_Operation>
    bind1st(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::first_argument_type _Arg1_type;
      return binder1st<_Operation>(__fn, _Arg1_type(__x));
    }
  template<typename _Operation>
    class binder2nd
    : public unary_function<typename _Operation::first_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::second_argument_type value;
    public:
      binder2nd(const _Operation& __x,
  const typename _Operation::second_argument_type& __y)
      : op(__x), value(__y) { }
      typename _Operation::result_type
      operator()(const typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }
      typename _Operation::result_type
      operator()(typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }
    } __attribute__ ((__deprecated__ ("use '" "std::bind" "' instead")));
  template<typename _Operation, typename _Tp>
    inline binder2nd<_Operation>
    bind2nd(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::second_argument_type _Arg2_type;
      return binder2nd<_Operation>(__fn, _Arg2_type(__x));
    }
}
#pragma GCC diagnostic pop


namespace std __attribute__ ((__visibility__ ("default")))
{
  template <typename _Tp>
                         inline void
    destroy_at(_Tp* __location)
    {
      if constexpr (201703L > 201703L && is_array_v<_Tp>)
 {
   for (auto& __x : *__location)
     std::destroy_at(std::__addressof(__x));
 }
      else
 __location->~_Tp();
    }
  template<typename _Tp, typename... _Args>
    inline void
    _Construct(_Tp* __p, _Args&&... __args)
    {
      ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
    }
  template<typename _T1>
    inline void
    _Construct_novalue(_T1* __p)
    { ::new((void*)__p) _T1; }
  template<typename _ForwardIterator>
                         void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last);
  template<typename _Tp>
    constexpr inline void
    _Destroy(_Tp* __pointer)
    {
      __pointer->~_Tp();
    }
  template<bool>
    struct _Destroy_aux
    {
      template<typename _ForwardIterator>
 static void
 __destroy(_ForwardIterator __first, _ForwardIterator __last)
 {
   for (; __first != __last; ++__first)
     std::_Destroy(std::__addressof(*__first));
 }
    };
  template<>
    struct _Destroy_aux<true>
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator, _ForwardIterator) { }
    };
  template<typename _ForwardIterator>
                         inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;
      static_assert(is_destructible<_Value_type>::value,
      "value type is destructible");
      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
 __destroy(__first, __last);
    }
  template<bool>
    struct _Destroy_n_aux
    {
      template<typename _ForwardIterator, typename _Size>
 static _ForwardIterator
 __destroy_n(_ForwardIterator __first, _Size __count)
 {
   for (; __count > 0; (void)++__first, --__count)
     std::_Destroy(std::__addressof(*__first));
   return __first;
 }
    };
  template<>
    struct _Destroy_n_aux<true>
    {
      template<typename _ForwardIterator, typename _Size>
        static _ForwardIterator
        __destroy_n(_ForwardIterator __first, _Size __count)
 {
   std::advance(__first, __count);
   return __first;
 }
    };
  template<typename _ForwardIterator, typename _Size>
                         inline _ForwardIterator
    _Destroy_n(_ForwardIterator __first, _Size __count)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;
      static_assert(is_destructible<_Value_type>::value,
      "value type is destructible");
      return std::_Destroy_n_aux<__has_trivial_destructor(_Value_type)>::
 __destroy_n(__first, __count);
    }
  template <typename _ForwardIterator>
                         inline void
    destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      std::_Destroy(__first, __last);
    }
  template <typename _ForwardIterator, typename _Size>
                         inline _ForwardIterator
    destroy_n(_ForwardIterator __first, _Size __count)
    {
      return std::_Destroy_n(__first, __count);
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  struct __allocator_traits_base
  {
    template<typename _Tp, typename _Up, typename = void>
      struct __rebind : __replace_first_arg<_Tp, _Up> { };
    template<typename _Tp, typename _Up>
      struct __rebind<_Tp, _Up,
        __void_t<typename _Tp::template rebind<_Up>::other>>
      { using type = typename _Tp::template rebind<_Up>::other; };
  protected:
    template<typename _Tp>
      using __pointer = typename _Tp::pointer;
    template<typename _Tp>
      using __c_pointer = typename _Tp::const_pointer;
    template<typename _Tp>
      using __v_pointer = typename _Tp::void_pointer;
    template<typename _Tp>
      using __cv_pointer = typename _Tp::const_void_pointer;
    template<typename _Tp>
      using __pocca = typename _Tp::propagate_on_container_copy_assignment;
    template<typename _Tp>
      using __pocma = typename _Tp::propagate_on_container_move_assignment;
    template<typename _Tp>
      using __pocs = typename _Tp::propagate_on_container_swap;
    template<typename _Tp>
      using __equal = typename _Tp::is_always_equal;
  };
  template<typename _Alloc, typename _Up>
    using __alloc_rebind
      = typename __allocator_traits_base::template __rebind<_Alloc, _Up>::type;
  template<typename _Alloc>
    struct allocator_traits : __allocator_traits_base
    {
      typedef _Alloc allocator_type;
      typedef typename _Alloc::value_type value_type;
      using pointer = __detected_or_t<value_type*, __pointer, _Alloc>;
    private:
      template<template<typename> class _Func, typename _Tp, typename = void>
 struct _Ptr
 {
   using type = typename pointer_traits<pointer>::template rebind<_Tp>;
 };
      template<template<typename> class _Func, typename _Tp>
 struct _Ptr<_Func, _Tp, __void_t<_Func<_Alloc>>>
 {
   using type = _Func<_Alloc>;
 };
      template<typename _A2, typename _PtrT, typename = void>
 struct _Diff
 { using type = typename pointer_traits<_PtrT>::difference_type; };
      template<typename _A2, typename _PtrT>
 struct _Diff<_A2, _PtrT, __void_t<typename _A2::difference_type>>
 { using type = typename _A2::difference_type; };
      template<typename _A2, typename _DiffT, typename = void>
 struct _Size : make_unsigned<_DiffT> { };
      template<typename _A2, typename _DiffT>
 struct _Size<_A2, _DiffT, __void_t<typename _A2::size_type>>
 { using type = typename _A2::size_type; };
    public:
      using const_pointer = typename _Ptr<__c_pointer, const value_type>::type;
      using void_pointer = typename _Ptr<__v_pointer, void>::type;
      using const_void_pointer = typename _Ptr<__cv_pointer, const void>::type;
      using difference_type = typename _Diff<_Alloc, pointer>::type;
      using size_type = typename _Size<_Alloc, difference_type>::type;
      using propagate_on_container_copy_assignment
 = __detected_or_t<false_type, __pocca, _Alloc>;
      using propagate_on_container_move_assignment
 = __detected_or_t<false_type, __pocma, _Alloc>;
      using propagate_on_container_swap
 = __detected_or_t<false_type, __pocs, _Alloc>;
      using is_always_equal
 = __detected_or_t<typename is_empty<_Alloc>::type, __equal, _Alloc>;
      template<typename _Tp>
 using rebind_alloc = __alloc_rebind<_Alloc, _Tp>;
      template<typename _Tp>
 using rebind_traits = allocator_traits<rebind_alloc<_Tp>>;
    private:
      template<typename _Alloc2>
 static constexpr auto
 _S_allocate(_Alloc2& __a, size_type __n, const_void_pointer __hint, int)
 -> decltype(__a.allocate(__n, __hint))
 { return __a.allocate(__n, __hint); }
      template<typename _Alloc2>
 static constexpr pointer
 _S_allocate(_Alloc2& __a, size_type __n, const_void_pointer, ...)
 { return __a.allocate(__n); }
      template<typename _Tp, typename... _Args>
 struct __construct_helper
 {
   template<typename _Alloc2,
     typename = decltype(std::declval<_Alloc2*>()->construct(
    std::declval<_Tp*>(), std::declval<_Args>()...))>
     static true_type __test(int);
   template<typename>
     static false_type __test(...);
   using type = decltype(__test<_Alloc>(0));
 };
      template<typename _Tp, typename... _Args>
 using __has_construct
   = typename __construct_helper<_Tp, _Args...>::type;
      template<typename _Tp, typename... _Args>
 static constexpr _Require<__has_construct<_Tp, _Args...>>
 _S_construct(_Alloc& __a, _Tp* __p, _Args&&... __args)
 noexcept(noexcept(__a.construct(__p, std::forward<_Args>(__args)...)))
 { __a.construct(__p, std::forward<_Args>(__args)...); }
      template<typename _Tp, typename... _Args>
 static constexpr
 _Require<__and_<__not_<__has_construct<_Tp, _Args...>>,
          is_constructible<_Tp, _Args...>>>
 _S_construct(_Alloc&, _Tp* __p, _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Tp, _Args...>::value)
 {
   ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
 }
      template<typename _Alloc2, typename _Tp>
 static constexpr auto
 _S_destroy(_Alloc2& __a, _Tp* __p, int)
 noexcept(noexcept(__a.destroy(__p)))
 -> decltype(__a.destroy(__p))
 { __a.destroy(__p); }
      template<typename _Alloc2, typename _Tp>
 static constexpr void
 _S_destroy(_Alloc2&, _Tp* __p, ...)
 noexcept(std::is_nothrow_destructible<_Tp>::value)
 { std::_Destroy(__p); }
      template<typename _Alloc2>
 static constexpr auto
 _S_max_size(_Alloc2& __a, int)
 -> decltype(__a.max_size())
 { return __a.max_size(); }
      template<typename _Alloc2>
 static constexpr size_type
 _S_max_size(_Alloc2&, ...)
 {
   return __gnu_cxx::__numeric_traits<size_type>::__max
     / sizeof(value_type);
 }
      template<typename _Alloc2>
 static constexpr auto
 _S_select(_Alloc2& __a, int)
 -> decltype(__a.select_on_container_copy_construction())
 { return __a.select_on_container_copy_construction(); }
      template<typename _Alloc2>
 static constexpr _Alloc2
 _S_select(_Alloc2& __a, ...)
 { return __a; }
    public:
      [[__nodiscard__]] static pointer
      allocate(_Alloc& __a, size_type __n)
      { return __a.allocate(__n); }
      [[__nodiscard__]] static pointer
      allocate(_Alloc& __a, size_type __n, const_void_pointer __hint)
      { return _S_allocate(__a, __n, __hint, 0); }
      static void
      deallocate(_Alloc& __a, pointer __p, size_type __n)
      { __a.deallocate(__p, __n); }
      template<typename _Tp, typename... _Args>
 static auto
 construct(_Alloc& __a, _Tp* __p, _Args&&... __args)
 noexcept(noexcept(_S_construct(__a, __p,
           std::forward<_Args>(__args)...)))
 -> decltype(_S_construct(__a, __p, std::forward<_Args>(__args)...))
 { _S_construct(__a, __p, std::forward<_Args>(__args)...); }
      template<typename _Tp>
 static void
 destroy(_Alloc& __a, _Tp* __p)
 noexcept(noexcept(_S_destroy(__a, __p, 0)))
 { _S_destroy(__a, __p, 0); }
      static size_type
      max_size(const _Alloc& __a) noexcept
      { return _S_max_size(__a, 0); }
      static _Alloc
      select_on_container_copy_construction(const _Alloc& __rhs)
      { return _S_select(__rhs, 0); }
    };
  template<typename _Tp>
    struct allocator_traits<allocator<_Tp>>
    {
      using allocator_type = allocator<_Tp>;
      using value_type = _Tp;
      using pointer = _Tp*;
      using const_pointer = const _Tp*;
      using void_pointer = void*;
      using const_void_pointer = const void*;
      using difference_type = std::ptrdiff_t;
      using size_type = std::size_t;
      using propagate_on_container_copy_assignment = false_type;
      using propagate_on_container_move_assignment = true_type;
      using propagate_on_container_swap = false_type;
      using is_always_equal = true_type;
      template<typename _Up>
 using rebind_alloc = allocator<_Up>;
      template<typename _Up>
 using rebind_traits = allocator_traits<allocator<_Up>>;
      [[__nodiscard__]] static pointer
      allocate(allocator_type& __a, size_type __n)
      { return __a.allocate(__n); }
      [[__nodiscard__]] static pointer
      allocate(allocator_type& __a, size_type __n, const_void_pointer __hint)
      {
 return __a.allocate(__n, __hint);
      }
      static void
      deallocate(allocator_type& __a, pointer __p, size_type __n)
      { __a.deallocate(__p, __n); }
      template<typename _Up, typename... _Args>
 static void
 construct(allocator_type& __a __attribute__((__unused__)), _Up* __p,
    _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Up, _Args...>::value)
 {
   __a.construct(__p, std::forward<_Args>(__args)...);
 }
      template<typename _Up>
 static void
 destroy(allocator_type& __a __attribute__((__unused__)), _Up* __p)
 noexcept(is_nothrow_destructible<_Up>::value)
 {
   __a.destroy(__p);
 }
      static size_type
      max_size(const allocator_type& __a __attribute__((__unused__))) noexcept
      {
 return __a.max_size();
      }
      static allocator_type
      select_on_container_copy_construction(const allocator_type& __rhs)
      { return __rhs; }
    };
  template<>
    struct allocator_traits<allocator<void>>
    {
      using allocator_type = allocator<void>;
      using value_type = void;
      using pointer = void*;
      using const_pointer = const void*;
      using void_pointer = void*;
      using const_void_pointer = const void*;
      using difference_type = std::ptrdiff_t;
      using size_type = std::size_t;
      using propagate_on_container_copy_assignment = false_type;
      using propagate_on_container_move_assignment = true_type;
      using propagate_on_container_swap = false_type;
      using is_always_equal = true_type;
      template<typename _Up>
 using rebind_alloc = allocator<_Up>;
      template<typename _Up>
 using rebind_traits = allocator_traits<allocator<_Up>>;
      static void*
      allocate(allocator_type&, size_type, const void* = nullptr) = delete;
      static void
      deallocate(allocator_type&, void*, size_type) = delete;
      template<typename _Up, typename... _Args>
 static void
 construct(allocator_type&, _Up* __p, _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Up, _Args...>::value)
 { std::_Construct(__p, std::forward<_Args>(__args)...); }
      template<typename _Up>
 static void
 destroy(allocator_type&, _Up* __p)
 noexcept(is_nothrow_destructible<_Up>::value)
 { std::_Destroy(__p); }
      static size_type
      max_size(const allocator_type&) = delete;
      static allocator_type
      select_on_container_copy_construction(const allocator_type& __rhs)
      { return __rhs; }
    };
  template<typename _Alloc>
    constexpr inline void
    __alloc_on_copy(_Alloc& __one, const _Alloc& __two)
    {
      typedef allocator_traits<_Alloc> __traits;
      typedef typename __traits::propagate_on_container_copy_assignment __pocca;
      if constexpr (__pocca::value)
 __one = __two;
    }
  template<typename _Alloc>
    constexpr _Alloc
    __alloc_on_copy(const _Alloc& __a)
    {
      typedef allocator_traits<_Alloc> __traits;
      return __traits::select_on_container_copy_construction(__a);
    }
  template<typename _Alloc>
    constexpr inline void
    __alloc_on_move(_Alloc& __one, _Alloc& __two)
    {
      typedef allocator_traits<_Alloc> __traits;
      typedef typename __traits::propagate_on_container_move_assignment __pocma;
      if constexpr (__pocma::value)
 __one = std::move(__two);
    }
  template<typename _Alloc>
    constexpr inline void
    __alloc_on_swap(_Alloc& __one, _Alloc& __two)
    {
      typedef allocator_traits<_Alloc> __traits;
      typedef typename __traits::propagate_on_container_swap __pocs;
      if constexpr (__pocs::value)
 {
   using std::swap;
   swap(__one, __two);
 }
    }
  template<typename _Alloc, typename _Tp,
    typename _ValueT = __remove_cvref_t<typename _Alloc::value_type>,
    typename = void>
    struct __is_alloc_insertable_impl
    : false_type
    { };
  template<typename _Alloc, typename _Tp, typename _ValueT>
    struct __is_alloc_insertable_impl<_Alloc, _Tp, _ValueT,
      __void_t<decltype(allocator_traits<_Alloc>::construct(
     std::declval<_Alloc&>(), std::declval<_ValueT*>(),
     std::declval<_Tp>()))>>
    : true_type
    { };
  template<typename _Alloc>
    struct __is_copy_insertable
    : __is_alloc_insertable_impl<_Alloc,
     typename _Alloc::value_type const&>::type
    { };
  template<typename _Tp>
    struct __is_copy_insertable<allocator<_Tp>>
    : is_copy_constructible<_Tp>
    { };
  template<typename _Alloc>
    struct __is_move_insertable
    : __is_alloc_insertable_impl<_Alloc, typename _Alloc::value_type>::type
    { };
  template<typename _Tp>
    struct __is_move_insertable<allocator<_Tp>>
    : is_move_constructible<_Tp>
    { };
  template<typename _Alloc, typename = void>
    struct __is_allocator : false_type { };
  template<typename _Alloc>
    struct __is_allocator<_Alloc,
      __void_t<typename _Alloc::value_type,
        decltype(std::declval<_Alloc&>().allocate(size_t{}))>>
    : true_type { };
  template<typename _Alloc>
    using _RequireAllocator
      = typename enable_if<__is_allocator<_Alloc>::value, _Alloc>::type;
  template<typename _Alloc>
    using _RequireNotAllocator
      = typename enable_if<!__is_allocator<_Alloc>::value, _Alloc>::type;
  template<typename _ForwardIterator, typename _Allocator>
    void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      _Allocator& __alloc)
    {
      for (; __first != __last; ++__first)
 allocator_traits<_Allocator>::destroy(__alloc,
           std::__addressof(*__first));
    }
  template<typename _ForwardIterator, typename _Tp>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      allocator<_Tp>&)
    {
      _Destroy(__first, __last);
    }
}
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
template<typename _Alloc, typename = typename _Alloc::value_type>
  struct __alloc_traits
  : std::allocator_traits<_Alloc>
  {
    typedef _Alloc allocator_type;
    typedef std::allocator_traits<_Alloc> _Base_type;
    typedef typename _Base_type::value_type value_type;
    typedef typename _Base_type::pointer pointer;
    typedef typename _Base_type::const_pointer const_pointer;
    typedef typename _Base_type::size_type size_type;
    typedef typename _Base_type::difference_type difference_type;
    typedef value_type& reference;
    typedef const value_type& const_reference;
    using _Base_type::allocate;
    using _Base_type::deallocate;
    using _Base_type::construct;
    using _Base_type::destroy;
    using _Base_type::max_size;
  private:
    template<typename _Ptr>
      using __is_custom_pointer
 = std::__and_<std::is_same<pointer, _Ptr>,
        std::__not_<std::is_pointer<_Ptr>>>;
  public:
    template<typename _Ptr, typename... _Args>
      static constexpr
      std::__enable_if_t<__is_custom_pointer<_Ptr>::value>
      construct(_Alloc& __a, _Ptr __p, _Args&&... __args)
      noexcept(noexcept(_Base_type::construct(__a, std::__to_address(__p),
           std::forward<_Args>(__args)...)))
      {
 _Base_type::construct(__a, std::__to_address(__p),
         std::forward<_Args>(__args)...);
      }
    template<typename _Ptr>
      static constexpr
      std::__enable_if_t<__is_custom_pointer<_Ptr>::value>
      destroy(_Alloc& __a, _Ptr __p)
      noexcept(noexcept(_Base_type::destroy(__a, std::__to_address(__p))))
      { _Base_type::destroy(__a, std::__to_address(__p)); }
    static constexpr _Alloc _S_select_on_copy(const _Alloc& __a)
    { return _Base_type::select_on_container_copy_construction(__a); }
    static constexpr void _S_on_swap(_Alloc& __a, _Alloc& __b)
    { std::__alloc_on_swap(__a, __b); }
    static constexpr bool _S_propagate_on_copy_assign()
    { return _Base_type::propagate_on_container_copy_assignment::value; }
    static constexpr bool _S_propagate_on_move_assign()
    { return _Base_type::propagate_on_container_move_assignment::value; }
    static constexpr bool _S_propagate_on_swap()
    { return _Base_type::propagate_on_container_swap::value; }
    static constexpr bool _S_always_equal()
    { return _Base_type::is_always_equal::value; }
    static constexpr bool _S_nothrow_move()
    { return _S_propagate_on_move_assign() || _S_always_equal(); }
    template<typename _Tp>
      struct rebind
      { typedef typename _Base_type::template rebind_alloc<_Tp> other; };
  };
}

namespace __gnu_cxx
{
  template<typename _Tp>
    struct __aligned_membuf
    {
      struct _Tp2 { _Tp _M_t; };
      alignas(__alignof__(_Tp2::_M_t)) unsigned char _M_storage[sizeof(_Tp)];
      __aligned_membuf() = default;
      __aligned_membuf(std::nullptr_t) { }
      void*
      _M_addr() noexcept
      { return static_cast<void*>(&_M_storage); }
      const void*
      _M_addr() const noexcept
      { return static_cast<const void*>(&_M_storage); }
      _Tp*
      _M_ptr() noexcept
      { return static_cast<_Tp*>(_M_addr()); }
      const _Tp*
      _M_ptr() const noexcept
      { return static_cast<const _Tp*>(_M_addr()); }
    };
  template<typename _Tp>
    struct __aligned_buffer
    : std::aligned_storage<sizeof(_Tp), __alignof__(_Tp)>
    {
      typename
 std::aligned_storage<sizeof(_Tp), __alignof__(_Tp)>::type _M_storage;
      __aligned_buffer() = default;
      __aligned_buffer(std::nullptr_t) { }
      void*
      _M_addr() noexcept
      {
        return static_cast<void*>(&_M_storage);
      }
      const void*
      _M_addr() const noexcept
      {
        return static_cast<const void*>(&_M_storage);
      }
      _Tp*
      _M_ptr() noexcept
      { return static_cast<_Tp*>(_M_addr()); }
      const _Tp*
      _M_ptr() const noexcept
      { return static_cast<const _Tp*>(_M_addr()); }
    };
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Val, typename _NodeAlloc>
    class _Node_handle_common
    {
      using _AllocTraits = allocator_traits<_NodeAlloc>;
    public:
      using allocator_type = __alloc_rebind<_NodeAlloc, _Val>;
      allocator_type
      get_allocator() const noexcept
      {
 do { if (__builtin_is_constant_evaluated() && !bool(!this->empty())) __builtin_unreachable(); } while (false);
 return allocator_type(_M_alloc._M_alloc);
      }
      explicit operator bool() const noexcept { return _M_ptr != nullptr; }
      [[nodiscard]] bool empty() const noexcept { return _M_ptr == nullptr; }
    protected:
      constexpr _Node_handle_common() noexcept : _M_ptr() { }
      ~_Node_handle_common()
      {
 if (!empty())
   _M_reset();
      }
      _Node_handle_common(_Node_handle_common&& __nh) noexcept
      : _M_ptr(__nh._M_ptr)
      {
 if (_M_ptr)
   _M_move(std::move(__nh));
      }
      _Node_handle_common&
      operator=(_Node_handle_common&& __nh) noexcept
      {
 if (empty())
   {
     if (!__nh.empty())
       _M_move(std::move(__nh));
   }
 else if (__nh.empty())
   _M_reset();
 else
   {
     _AllocTraits::destroy(*_M_alloc, _M_ptr->_M_valptr());
     _AllocTraits::deallocate(*_M_alloc, _M_ptr, 1);
     _M_alloc = __nh._M_alloc.release();
     _M_ptr = __nh._M_ptr;
     __nh._M_ptr = nullptr;
   }
 return *this;
      }
      _Node_handle_common(typename _AllocTraits::pointer __ptr,
     const _NodeAlloc& __alloc)
      : _M_ptr(__ptr), _M_alloc(__alloc)
      {
 do { if (__builtin_is_constant_evaluated() && !bool(__ptr != nullptr)) __builtin_unreachable(); } while (false);
      }
      void
      _M_swap(_Node_handle_common& __nh) noexcept
      {
 if (empty())
   {
     if (!__nh.empty())
       _M_move(std::move(__nh));
   }
 else if (__nh.empty())
   __nh._M_move(std::move(*this));
 else
   {
     using std::swap;
     swap(_M_ptr, __nh._M_ptr);
     _M_alloc.swap(__nh._M_alloc);
   }
      }
    private:
      void
      _M_move(_Node_handle_common&& __nh) noexcept
      {
 ::new (std::__addressof(_M_alloc)) _NodeAlloc(__nh._M_alloc.release());
 _M_ptr = __nh._M_ptr;
 __nh._M_ptr = nullptr;
      }
      void
      _M_reset() noexcept
      {
 _NodeAlloc __alloc = _M_alloc.release();
 _AllocTraits::destroy(__alloc, _M_ptr->_M_valptr());
 _AllocTraits::deallocate(__alloc, _M_ptr, 1);
 _M_ptr = nullptr;
      }
    protected:
      typename _AllocTraits::pointer _M_ptr;
    private:
      union _Optional_alloc
      {
 _Optional_alloc() { }
 ~_Optional_alloc() { }
 _Optional_alloc(_Optional_alloc&&) = delete;
 _Optional_alloc& operator=(_Optional_alloc&&) = delete;
 _Optional_alloc(const _NodeAlloc& __alloc) noexcept
 : _M_alloc(__alloc)
 { }
 void
 operator=(_NodeAlloc&& __alloc) noexcept
 {
   using _ATr = _AllocTraits;
   if constexpr (_ATr::propagate_on_container_move_assignment::value)
     _M_alloc = std::move(__alloc);
   else if constexpr (!_AllocTraits::is_always_equal::value)
     do { if (__builtin_is_constant_evaluated() && !bool(_M_alloc == __alloc)) __builtin_unreachable(); } while (false);
 }
 void
 swap(_Optional_alloc& __other) noexcept
 {
   using std::swap;
   if constexpr (_AllocTraits::propagate_on_container_swap::value)
     swap(_M_alloc, __other._M_alloc);
   else if constexpr (!_AllocTraits::is_always_equal::value)
     do { if (__builtin_is_constant_evaluated() && !bool(_M_alloc == __other._M_alloc)) __builtin_unreachable(); } while (false);
 }
 _NodeAlloc& operator*() noexcept { return _M_alloc; }
 _NodeAlloc release() noexcept
 {
   _NodeAlloc __tmp = std::move(_M_alloc);
   _M_alloc.~_NodeAlloc();
   return __tmp;
 }
 struct _Empty { };
 [[__no_unique_address__]] _Empty _M_empty;
 [[__no_unique_address__]] _NodeAlloc _M_alloc;
      };
      [[__no_unique_address__]] _Optional_alloc _M_alloc;
      template<typename _Key2, typename _Value2, typename _KeyOfValue,
        typename _Compare, typename _ValueAlloc>
 friend class _Rb_tree;
    };
  template<typename _Key, typename _Value, typename _NodeAlloc>
    class _Node_handle : public _Node_handle_common<_Value, _NodeAlloc>
    {
    public:
      constexpr _Node_handle() noexcept = default;
      ~_Node_handle() = default;
      _Node_handle(_Node_handle&&) noexcept = default;
      _Node_handle&
      operator=(_Node_handle&&) noexcept = default;
      using key_type = _Key;
      using mapped_type = typename _Value::second_type;
      key_type&
      key() const noexcept
      {
 do { if (__builtin_is_constant_evaluated() && !bool(!this->empty())) __builtin_unreachable(); } while (false);
 return *_M_pkey;
      }
      mapped_type&
      mapped() const noexcept
      {
 do { if (__builtin_is_constant_evaluated() && !bool(!this->empty())) __builtin_unreachable(); } while (false);
 return *_M_pmapped;
      }
      void
      swap(_Node_handle& __nh) noexcept
      {
 this->_M_swap(__nh);
 using std::swap;
 swap(_M_pkey, __nh._M_pkey);
 swap(_M_pmapped, __nh._M_pmapped);
      }
      friend void
      swap(_Node_handle& __x, _Node_handle& __y)
      noexcept(noexcept(__x.swap(__y)))
      { __x.swap(__y); }
    private:
      using _AllocTraits = allocator_traits<_NodeAlloc>;
      _Node_handle(typename _AllocTraits::pointer __ptr,
     const _NodeAlloc& __alloc)
      : _Node_handle_common<_Value, _NodeAlloc>(__ptr, __alloc)
      {
 if (__ptr)
   {
     auto& __key = const_cast<_Key&>(__ptr->_M_valptr()->first);
     _M_pkey = _S_pointer_to(__key);
     _M_pmapped = _S_pointer_to(__ptr->_M_valptr()->second);
   }
 else
   {
     _M_pkey = nullptr;
     _M_pmapped = nullptr;
   }
      }
      template<typename _Tp>
 using __pointer
   = __ptr_rebind<typename _AllocTraits::pointer,
    remove_reference_t<_Tp>>;
      __pointer<_Key> _M_pkey = nullptr;
      __pointer<typename _Value::second_type> _M_pmapped = nullptr;
      template<typename _Tp>
 __pointer<_Tp>
 _S_pointer_to(_Tp& __obj)
 { return pointer_traits<__pointer<_Tp>>::pointer_to(__obj); }
      const key_type&
      _M_key() const noexcept { return key(); }
      template<typename _Key2, typename _Value2, typename _KeyOfValue,
        typename _Compare, typename _ValueAlloc>
 friend class _Rb_tree;
      template<typename _Key2, typename _Value2, typename _ValueAlloc,
        typename _ExtractKey, typename _Equal,
        typename _Hash, typename _RangeHash, typename _Unused,
        typename _RehashPolicy, typename _Traits>
 friend class _Hashtable;
    };
  template<typename _Value, typename _NodeAlloc>
    class _Node_handle<_Value, _Value, _NodeAlloc>
    : public _Node_handle_common<_Value, _NodeAlloc>
    {
    public:
      constexpr _Node_handle() noexcept = default;
      ~_Node_handle() = default;
      _Node_handle(_Node_handle&&) noexcept = default;
      _Node_handle&
      operator=(_Node_handle&&) noexcept = default;
      using value_type = _Value;
      value_type&
      value() const noexcept
      {
 do { if (__builtin_is_constant_evaluated() && !bool(!this->empty())) __builtin_unreachable(); } while (false);
 return *this->_M_ptr->_M_valptr();
      }
      void
      swap(_Node_handle& __nh) noexcept
      { this->_M_swap(__nh); }
      friend void
      swap(_Node_handle& __x, _Node_handle& __y)
      noexcept(noexcept(__x.swap(__y)))
      { __x.swap(__y); }
    private:
      using _AllocTraits = allocator_traits<_NodeAlloc>;
      _Node_handle(typename _AllocTraits::pointer __ptr,
     const _NodeAlloc& __alloc)
      : _Node_handle_common<_Value, _NodeAlloc>(__ptr, __alloc) { }
      const value_type&
      _M_key() const noexcept { return value(); }
      template<typename _Key, typename _Val, typename _KeyOfValue,
        typename _Compare, typename _Alloc>
 friend class _Rb_tree;
      template<typename _Key2, typename _Value2, typename _ValueAlloc,
        typename _ExtractKey, typename _Equal,
        typename _Hash, typename _RangeHash, typename _Unused,
        typename _RehashPolicy, typename _Traits>
 friend class _Hashtable;
    };
  template<typename _Iterator, typename _NodeHandle>
    struct _Node_insert_return
    {
      _Iterator position = _Iterator();
      bool inserted = false;
      _NodeHandle node;
    };
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  enum _Rb_tree_color { _S_red = false, _S_black = true };
  struct _Rb_tree_node_base
  {
    typedef _Rb_tree_node_base* _Base_ptr;
    typedef const _Rb_tree_node_base* _Const_Base_ptr;
    _Rb_tree_color _M_color;
    _Base_ptr _M_parent;
    _Base_ptr _M_left;
    _Base_ptr _M_right;
    static _Base_ptr
    _S_minimum(_Base_ptr __x) noexcept
    {
      while (__x->_M_left != 0) __x = __x->_M_left;
      return __x;
    }
    static _Const_Base_ptr
    _S_minimum(_Const_Base_ptr __x) noexcept
    {
      while (__x->_M_left != 0) __x = __x->_M_left;
      return __x;
    }
    static _Base_ptr
    _S_maximum(_Base_ptr __x) noexcept
    {
      while (__x->_M_right != 0) __x = __x->_M_right;
      return __x;
    }
    static _Const_Base_ptr
    _S_maximum(_Const_Base_ptr __x) noexcept
    {
      while (__x->_M_right != 0) __x = __x->_M_right;
      return __x;
    }
  };
  template<typename _Key_compare>
    struct _Rb_tree_key_compare
    {
      _Key_compare _M_key_compare;
      _Rb_tree_key_compare()
      noexcept(is_nothrow_default_constructible<_Key_compare>::value)
      : _M_key_compare()
      { }
      _Rb_tree_key_compare(const _Key_compare& __comp)
      : _M_key_compare(__comp)
      { }
      _Rb_tree_key_compare(const _Rb_tree_key_compare&) = default;
      _Rb_tree_key_compare(_Rb_tree_key_compare&& __x)
 noexcept(is_nothrow_copy_constructible<_Key_compare>::value)
      : _M_key_compare(__x._M_key_compare)
      { }
    };
  struct _Rb_tree_header
  {
    _Rb_tree_node_base _M_header;
    size_t _M_node_count;
    _Rb_tree_header() noexcept
    {
      _M_header._M_color = _S_red;
      _M_reset();
    }
    _Rb_tree_header(_Rb_tree_header&& __x) noexcept
    {
      if (__x._M_header._M_parent != nullptr)
 _M_move_data(__x);
      else
 {
   _M_header._M_color = _S_red;
   _M_reset();
 }
    }
    void
    _M_move_data(_Rb_tree_header& __from)
    {
      _M_header._M_color = __from._M_header._M_color;
      _M_header._M_parent = __from._M_header._M_parent;
      _M_header._M_left = __from._M_header._M_left;
      _M_header._M_right = __from._M_header._M_right;
      _M_header._M_parent->_M_parent = &_M_header;
      _M_node_count = __from._M_node_count;
      __from._M_reset();
    }
    void
    _M_reset()
    {
      _M_header._M_parent = 0;
      _M_header._M_left = &_M_header;
      _M_header._M_right = &_M_header;
      _M_node_count = 0;
    }
  };
  template<typename _Val>
    struct _Rb_tree_node : public _Rb_tree_node_base
    {
      typedef _Rb_tree_node<_Val>* _Link_type;
      __gnu_cxx::__aligned_membuf<_Val> _M_storage;
      _Val*
      _M_valptr()
      { return _M_storage._M_ptr(); }
      const _Val*
      _M_valptr() const
      { return _M_storage._M_ptr(); }
    };
  __attribute__ ((__pure__)) _Rb_tree_node_base*
  _Rb_tree_increment(_Rb_tree_node_base* __x) throw ();
  __attribute__ ((__pure__)) const _Rb_tree_node_base*
  _Rb_tree_increment(const _Rb_tree_node_base* __x) throw ();
  __attribute__ ((__pure__)) _Rb_tree_node_base*
  _Rb_tree_decrement(_Rb_tree_node_base* __x) throw ();
  __attribute__ ((__pure__)) const _Rb_tree_node_base*
  _Rb_tree_decrement(const _Rb_tree_node_base* __x) throw ();
  template<typename _Tp>
    struct _Rb_tree_iterator
    {
      typedef _Tp value_type;
      typedef _Tp& reference;
      typedef _Tp* pointer;
      typedef bidirectional_iterator_tag iterator_category;
      typedef ptrdiff_t difference_type;
      typedef _Rb_tree_iterator<_Tp> _Self;
      typedef _Rb_tree_node_base::_Base_ptr _Base_ptr;
      typedef _Rb_tree_node<_Tp>* _Link_type;
      _Rb_tree_iterator() noexcept
      : _M_node() { }
      explicit
      _Rb_tree_iterator(_Base_ptr __x) noexcept
      : _M_node(__x) { }
      reference
      operator*() const noexcept
      { return *static_cast<_Link_type>(_M_node)->_M_valptr(); }
      pointer
      operator->() const noexcept
      { return static_cast<_Link_type> (_M_node)->_M_valptr(); }
      _Self&
      operator++() noexcept
      {
 _M_node = _Rb_tree_increment(_M_node);
 return *this;
      }
      _Self
      operator++(int) noexcept
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_increment(_M_node);
 return __tmp;
      }
      _Self&
      operator--() noexcept
      {
 _M_node = _Rb_tree_decrement(_M_node);
 return *this;
      }
      _Self
      operator--(int) noexcept
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_decrement(_M_node);
 return __tmp;
      }
      friend bool
      operator==(const _Self& __x, const _Self& __y) noexcept
      { return __x._M_node == __y._M_node; }
      friend bool
      operator!=(const _Self& __x, const _Self& __y) noexcept
      { return __x._M_node != __y._M_node; }
      _Base_ptr _M_node;
  };
  template<typename _Tp>
    struct _Rb_tree_const_iterator
    {
      typedef _Tp value_type;
      typedef const _Tp& reference;
      typedef const _Tp* pointer;
      typedef _Rb_tree_iterator<_Tp> iterator;
      typedef bidirectional_iterator_tag iterator_category;
      typedef ptrdiff_t difference_type;
      typedef _Rb_tree_const_iterator<_Tp> _Self;
      typedef _Rb_tree_node_base::_Const_Base_ptr _Base_ptr;
      typedef const _Rb_tree_node<_Tp>* _Link_type;
      _Rb_tree_const_iterator() noexcept
      : _M_node() { }
      explicit
      _Rb_tree_const_iterator(_Base_ptr __x) noexcept
      : _M_node(__x) { }
      _Rb_tree_const_iterator(const iterator& __it) noexcept
      : _M_node(__it._M_node) { }
      iterator
      _M_const_cast() const noexcept
      { return iterator(const_cast<typename iterator::_Base_ptr>(_M_node)); }
      reference
      operator*() const noexcept
      { return *static_cast<_Link_type>(_M_node)->_M_valptr(); }
      pointer
      operator->() const noexcept
      { return static_cast<_Link_type>(_M_node)->_M_valptr(); }
      _Self&
      operator++() noexcept
      {
 _M_node = _Rb_tree_increment(_M_node);
 return *this;
      }
      _Self
      operator++(int) noexcept
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_increment(_M_node);
 return __tmp;
      }
      _Self&
      operator--() noexcept
      {
 _M_node = _Rb_tree_decrement(_M_node);
 return *this;
      }
      _Self
      operator--(int) noexcept
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_decrement(_M_node);
 return __tmp;
      }
      friend bool
      operator==(const _Self& __x, const _Self& __y) noexcept
      { return __x._M_node == __y._M_node; }
      friend bool
      operator!=(const _Self& __x, const _Self& __y) noexcept
      { return __x._M_node != __y._M_node; }
      _Base_ptr _M_node;
    };
  void
  _Rb_tree_insert_and_rebalance(const bool __insert_left,
    _Rb_tree_node_base* __x,
    _Rb_tree_node_base* __p,
    _Rb_tree_node_base& __header) throw ();
  _Rb_tree_node_base*
  _Rb_tree_rebalance_for_erase(_Rb_tree_node_base* const __z,
          _Rb_tree_node_base& __header) throw ();
  template<typename _Tree1, typename _Cmp2>
    struct _Rb_tree_merge_helper { };
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc = allocator<_Val> >
    class _Rb_tree
    {
      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
 rebind<_Rb_tree_node<_Val> >::other _Node_allocator;
      typedef __gnu_cxx::__alloc_traits<_Node_allocator> _Alloc_traits;
    protected:
      typedef _Rb_tree_node_base* _Base_ptr;
      typedef const _Rb_tree_node_base* _Const_Base_ptr;
      typedef _Rb_tree_node<_Val>* _Link_type;
      typedef const _Rb_tree_node<_Val>* _Const_Link_type;
    private:
      struct _Reuse_or_alloc_node
      {
 _Reuse_or_alloc_node(_Rb_tree& __t)
 : _M_root(__t._M_root()), _M_nodes(__t._M_rightmost()), _M_t(__t)
 {
   if (_M_root)
     {
       _M_root->_M_parent = 0;
       if (_M_nodes->_M_left)
  _M_nodes = _M_nodes->_M_left;
     }
   else
     _M_nodes = 0;
 }
 _Reuse_or_alloc_node(const _Reuse_or_alloc_node&) = delete;
 ~_Reuse_or_alloc_node()
 { _M_t._M_erase(static_cast<_Link_type>(_M_root)); }
 template<typename _Arg>
   _Link_type
   operator()(_Arg&& __arg)
   {
     _Link_type __node = static_cast<_Link_type>(_M_extract());
     if (__node)
       {
  _M_t._M_destroy_node(__node);
  _M_t._M_construct_node(__node, std::forward<_Arg>(__arg));
  return __node;
       }
     return _M_t._M_create_node(std::forward<_Arg>(__arg));
   }
      private:
 _Base_ptr
 _M_extract()
 {
   if (!_M_nodes)
     return _M_nodes;
   _Base_ptr __node = _M_nodes;
   _M_nodes = _M_nodes->_M_parent;
   if (_M_nodes)
     {
       if (_M_nodes->_M_right == __node)
  {
    _M_nodes->_M_right = 0;
    if (_M_nodes->_M_left)
      {
        _M_nodes = _M_nodes->_M_left;
        while (_M_nodes->_M_right)
   _M_nodes = _M_nodes->_M_right;
        if (_M_nodes->_M_left)
   _M_nodes = _M_nodes->_M_left;
      }
  }
       else
  _M_nodes->_M_left = 0;
     }
   else
     _M_root = 0;
   return __node;
 }
 _Base_ptr _M_root;
 _Base_ptr _M_nodes;
 _Rb_tree& _M_t;
      };
      struct _Alloc_node
      {
 _Alloc_node(_Rb_tree& __t)
 : _M_t(__t) { }
 template<typename _Arg>
   _Link_type
   operator()(_Arg&& __arg) const
   { return _M_t._M_create_node(std::forward<_Arg>(__arg)); }
      private:
 _Rb_tree& _M_t;
      };
    public:
      typedef _Key key_type;
      typedef _Val value_type;
      typedef value_type* pointer;
      typedef const value_type* const_pointer;
      typedef value_type& reference;
      typedef const value_type& const_reference;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Alloc allocator_type;
      _Node_allocator&
      _M_get_Node_allocator() noexcept
      { return this->_M_impl; }
      const _Node_allocator&
      _M_get_Node_allocator() const noexcept
      { return this->_M_impl; }
      allocator_type
      get_allocator() const noexcept
      { return allocator_type(_M_get_Node_allocator()); }
    protected:
      _Link_type
      _M_get_node()
      { return _Alloc_traits::allocate(_M_get_Node_allocator(), 1); }
      void
      _M_put_node(_Link_type __p) noexcept
      { _Alloc_traits::deallocate(_M_get_Node_allocator(), __p, 1); }
      template<typename... _Args>
 void
 _M_construct_node(_Link_type __node, _Args&&... __args)
 {
   try
     {
       ::new(__node) _Rb_tree_node<_Val>;
       _Alloc_traits::construct(_M_get_Node_allocator(),
           __node->_M_valptr(),
           std::forward<_Args>(__args)...);
     }
   catch(...)
     {
       __node->~_Rb_tree_node<_Val>();
       _M_put_node(__node);
       throw;
     }
 }
      template<typename... _Args>
 _Link_type
 _M_create_node(_Args&&... __args)
 {
   _Link_type __tmp = _M_get_node();
   _M_construct_node(__tmp, std::forward<_Args>(__args)...);
   return __tmp;
 }
      void
      _M_destroy_node(_Link_type __p) noexcept
      {
 _Alloc_traits::destroy(_M_get_Node_allocator(), __p->_M_valptr());
 __p->~_Rb_tree_node<_Val>();
      }
      void
      _M_drop_node(_Link_type __p) noexcept
      {
 _M_destroy_node(__p);
 _M_put_node(__p);
      }
      template<bool _MoveValue, typename _NodeGen>
 _Link_type
 _M_clone_node(_Link_type __x, _NodeGen& __node_gen)
 {
   using _Vp = typename conditional<_MoveValue,
        value_type&&,
        const value_type&>::type;
   _Link_type __tmp
     = __node_gen(std::forward<_Vp>(*__x->_M_valptr()));
   __tmp->_M_color = __x->_M_color;
   __tmp->_M_left = 0;
   __tmp->_M_right = 0;
   return __tmp;
 }
    protected:
      template<typename _Key_compare,
        bool = __is_pod(_Key_compare)>
 struct _Rb_tree_impl
 : public _Node_allocator
 , public _Rb_tree_key_compare<_Key_compare>
 , public _Rb_tree_header
 {
   typedef _Rb_tree_key_compare<_Key_compare> _Base_key_compare;
   _Rb_tree_impl()
     noexcept(is_nothrow_default_constructible<_Node_allocator>::value && is_nothrow_default_constructible<_Base_key_compare>::value)
   : _Node_allocator()
   { }
   _Rb_tree_impl(const _Rb_tree_impl& __x)
   : _Node_allocator(_Alloc_traits::_S_select_on_copy(__x))
   , _Base_key_compare(__x._M_key_compare)
   , _Rb_tree_header()
   { }
   _Rb_tree_impl(_Rb_tree_impl&&)
     noexcept( is_nothrow_move_constructible<_Base_key_compare>::value )
   = default;
   explicit
   _Rb_tree_impl(_Node_allocator&& __a)
   : _Node_allocator(std::move(__a))
   { }
   _Rb_tree_impl(_Rb_tree_impl&& __x, _Node_allocator&& __a)
   : _Node_allocator(std::move(__a)),
     _Base_key_compare(std::move(__x)),
     _Rb_tree_header(std::move(__x))
   { }
   _Rb_tree_impl(const _Key_compare& __comp, _Node_allocator&& __a)
   : _Node_allocator(std::move(__a)), _Base_key_compare(__comp)
   { }
 };
      _Rb_tree_impl<_Compare> _M_impl;
    protected:
      _Base_ptr&
      _M_root() noexcept
      { return this->_M_impl._M_header._M_parent; }
      _Const_Base_ptr
      _M_root() const noexcept
      { return this->_M_impl._M_header._M_parent; }
      _Base_ptr&
      _M_leftmost() noexcept
      { return this->_M_impl._M_header._M_left; }
      _Const_Base_ptr
      _M_leftmost() const noexcept
      { return this->_M_impl._M_header._M_left; }
      _Base_ptr&
      _M_rightmost() noexcept
      { return this->_M_impl._M_header._M_right; }
      _Const_Base_ptr
      _M_rightmost() const noexcept
      { return this->_M_impl._M_header._M_right; }
      _Link_type
      _M_mbegin() const noexcept
      { return static_cast<_Link_type>(this->_M_impl._M_header._M_parent); }
      _Link_type
      _M_begin() noexcept
      { return _M_mbegin(); }
      _Const_Link_type
      _M_begin() const noexcept
      {
 return static_cast<_Const_Link_type>
   (this->_M_impl._M_header._M_parent);
      }
      _Base_ptr
      _M_end() noexcept
      { return &this->_M_impl._M_header; }
      _Const_Base_ptr
      _M_end() const noexcept
      { return &this->_M_impl._M_header; }
      static const _Key&
      _S_key(_Const_Link_type __x)
      {
 static_assert(__is_invocable<_Compare&, const _Key&, const _Key&>{},
        "comparison object must be invocable "
        "with two arguments of key type");
 if constexpr (__is_invocable<_Compare&, const _Key&, const _Key&>{})
   static_assert(
       is_invocable_v<const _Compare&, const _Key&, const _Key&>,
       "comparison object must be invocable as const");
 return _KeyOfValue()(*__x->_M_valptr());
      }
      static _Link_type
      _S_left(_Base_ptr __x) noexcept
      { return static_cast<_Link_type>(__x->_M_left); }
      static _Const_Link_type
      _S_left(_Const_Base_ptr __x) noexcept
      { return static_cast<_Const_Link_type>(__x->_M_left); }
      static _Link_type
      _S_right(_Base_ptr __x) noexcept
      { return static_cast<_Link_type>(__x->_M_right); }
      static _Const_Link_type
      _S_right(_Const_Base_ptr __x) noexcept
      { return static_cast<_Const_Link_type>(__x->_M_right); }
      static const _Key&
      _S_key(_Const_Base_ptr __x)
      { return _S_key(static_cast<_Const_Link_type>(__x)); }
      static _Base_ptr
      _S_minimum(_Base_ptr __x) noexcept
      { return _Rb_tree_node_base::_S_minimum(__x); }
      static _Const_Base_ptr
      _S_minimum(_Const_Base_ptr __x) noexcept
      { return _Rb_tree_node_base::_S_minimum(__x); }
      static _Base_ptr
      _S_maximum(_Base_ptr __x) noexcept
      { return _Rb_tree_node_base::_S_maximum(__x); }
      static _Const_Base_ptr
      _S_maximum(_Const_Base_ptr __x) noexcept
      { return _Rb_tree_node_base::_S_maximum(__x); }
    public:
      typedef _Rb_tree_iterator<value_type> iterator;
      typedef _Rb_tree_const_iterator<value_type> const_iterator;
      typedef std::reverse_iterator<iterator> reverse_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
      using node_type = _Node_handle<_Key, _Val, _Node_allocator>;
      using insert_return_type = _Node_insert_return<
 conditional_t<is_same_v<_Key, _Val>, const_iterator, iterator>,
 node_type>;
      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_unique_pos(const key_type& __k);
      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_equal_pos(const key_type& __k);
      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_hint_unique_pos(const_iterator __pos,
        const key_type& __k);
      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_hint_equal_pos(const_iterator __pos,
       const key_type& __k);
    private:
      template<typename _Arg, typename _NodeGen>
 iterator
 _M_insert_(_Base_ptr __x, _Base_ptr __y, _Arg&& __v, _NodeGen&);
      iterator
      _M_insert_node(_Base_ptr __x, _Base_ptr __y, _Link_type __z);
      template<typename _Arg>
 iterator
 _M_insert_lower(_Base_ptr __y, _Arg&& __v);
      template<typename _Arg>
 iterator
 _M_insert_equal_lower(_Arg&& __x);
      iterator
      _M_insert_lower_node(_Base_ptr __p, _Link_type __z);
      iterator
      _M_insert_equal_lower_node(_Link_type __z);
      enum { __as_lvalue, __as_rvalue };
      template<bool _MoveValues, typename _NodeGen>
 _Link_type
 _M_copy(_Link_type, _Base_ptr, _NodeGen&);
      template<bool _MoveValues, typename _NodeGen>
 _Link_type
 _M_copy(const _Rb_tree& __x, _NodeGen& __gen)
 {
   _Link_type __root =
     _M_copy<_MoveValues>(__x._M_mbegin(), _M_end(), __gen);
   _M_leftmost() = _S_minimum(__root);
   _M_rightmost() = _S_maximum(__root);
   _M_impl._M_node_count = __x._M_impl._M_node_count;
   return __root;
 }
      _Link_type
      _M_copy(const _Rb_tree& __x)
      {
 _Alloc_node __an(*this);
 return _M_copy<__as_lvalue>(__x, __an);
      }
      void
      _M_erase(_Link_type __x);
      iterator
      _M_lower_bound(_Link_type __x, _Base_ptr __y,
       const _Key& __k);
      const_iterator
      _M_lower_bound(_Const_Link_type __x, _Const_Base_ptr __y,
       const _Key& __k) const;
      iterator
      _M_upper_bound(_Link_type __x, _Base_ptr __y,
       const _Key& __k);
      const_iterator
      _M_upper_bound(_Const_Link_type __x, _Const_Base_ptr __y,
       const _Key& __k) const;
    public:
      _Rb_tree() = default;
      _Rb_tree(const _Compare& __comp,
        const allocator_type& __a = allocator_type())
      : _M_impl(__comp, _Node_allocator(__a)) { }
      _Rb_tree(const _Rb_tree& __x)
      : _M_impl(__x._M_impl)
      {
 if (__x._M_root() != 0)
   _M_root() = _M_copy(__x);
      }
      _Rb_tree(const allocator_type& __a)
      : _M_impl(_Node_allocator(__a))
      { }
      _Rb_tree(const _Rb_tree& __x, const allocator_type& __a)
      : _M_impl(__x._M_impl._M_key_compare, _Node_allocator(__a))
      {
 if (__x._M_root() != nullptr)
   _M_root() = _M_copy(__x);
      }
      _Rb_tree(_Rb_tree&&) = default;
      _Rb_tree(_Rb_tree&& __x, const allocator_type& __a)
      : _Rb_tree(std::move(__x), _Node_allocator(__a))
      { }
    private:
      _Rb_tree(_Rb_tree&& __x, _Node_allocator&& __a, true_type)
      noexcept(is_nothrow_default_constructible<_Compare>::value)
      : _M_impl(std::move(__x._M_impl), std::move(__a))
      { }
      _Rb_tree(_Rb_tree&& __x, _Node_allocator&& __a, false_type)
      : _M_impl(__x._M_impl._M_key_compare, std::move(__a))
      {
 if (__x._M_root() != nullptr)
   _M_move_data(__x, false_type{});
      }
    public:
      _Rb_tree(_Rb_tree&& __x, _Node_allocator&& __a)
      noexcept( noexcept(
 _Rb_tree(std::declval<_Rb_tree&&>(), std::declval<_Node_allocator&&>(),
   std::declval<typename _Alloc_traits::is_always_equal>())) )
      : _Rb_tree(std::move(__x), std::move(__a),
   typename _Alloc_traits::is_always_equal{})
      { }
      ~_Rb_tree() noexcept
      { _M_erase(_M_begin()); }
      _Rb_tree&
      operator=(const _Rb_tree& __x);
      _Compare
      key_comp() const
      { return _M_impl._M_key_compare; }
      iterator
      begin() noexcept
      { return iterator(this->_M_impl._M_header._M_left); }
      const_iterator
      begin() const noexcept
      { return const_iterator(this->_M_impl._M_header._M_left); }
      iterator
      end() noexcept
      { return iterator(&this->_M_impl._M_header); }
      const_iterator
      end() const noexcept
      { return const_iterator(&this->_M_impl._M_header); }
      reverse_iterator
      rbegin() noexcept
      { return reverse_iterator(end()); }
      const_reverse_iterator
      rbegin() const noexcept
      { return const_reverse_iterator(end()); }
      reverse_iterator
      rend() noexcept
      { return reverse_iterator(begin()); }
      const_reverse_iterator
      rend() const noexcept
      { return const_reverse_iterator(begin()); }
      [[__nodiscard__]] bool
      empty() const noexcept
      { return _M_impl._M_node_count == 0; }
      size_type
      size() const noexcept
      { return _M_impl._M_node_count; }
      size_type
      max_size() const noexcept
      { return _Alloc_traits::max_size(_M_get_Node_allocator()); }
      void
      swap(_Rb_tree& __t)
      noexcept(__is_nothrow_swappable<_Compare>::value);
      template<typename _Arg>
 pair<iterator, bool>
 _M_insert_unique(_Arg&& __x);
      template<typename _Arg>
 iterator
 _M_insert_equal(_Arg&& __x);
      template<typename _Arg, typename _NodeGen>
 iterator
 _M_insert_unique_(const_iterator __pos, _Arg&& __x, _NodeGen&);
      template<typename _Arg>
 iterator
 _M_insert_unique_(const_iterator __pos, _Arg&& __x)
 {
   _Alloc_node __an(*this);
   return _M_insert_unique_(__pos, std::forward<_Arg>(__x), __an);
 }
      template<typename _Arg, typename _NodeGen>
 iterator
 _M_insert_equal_(const_iterator __pos, _Arg&& __x, _NodeGen&);
      template<typename _Arg>
 iterator
 _M_insert_equal_(const_iterator __pos, _Arg&& __x)
 {
   _Alloc_node __an(*this);
   return _M_insert_equal_(__pos, std::forward<_Arg>(__x), __an);
 }
      template<typename... _Args>
 pair<iterator, bool>
 _M_emplace_unique(_Args&&... __args);
      template<typename... _Args>
 iterator
 _M_emplace_equal(_Args&&... __args);
      template<typename... _Args>
 iterator
 _M_emplace_hint_unique(const_iterator __pos, _Args&&... __args);
      template<typename... _Args>
 iterator
 _M_emplace_hint_equal(const_iterator __pos, _Args&&... __args);
      template<typename _Iter>
 using __same_value_type
   = is_same<value_type, typename iterator_traits<_Iter>::value_type>;
      template<typename _InputIterator>
 __enable_if_t<__same_value_type<_InputIterator>::value>
 _M_insert_range_unique(_InputIterator __first, _InputIterator __last)
 {
   _Alloc_node __an(*this);
   for (; __first != __last; ++__first)
     _M_insert_unique_(end(), *__first, __an);
 }
      template<typename _InputIterator>
 __enable_if_t<!__same_value_type<_InputIterator>::value>
 _M_insert_range_unique(_InputIterator __first, _InputIterator __last)
 {
   for (; __first != __last; ++__first)
     _M_emplace_unique(*__first);
 }
      template<typename _InputIterator>
 __enable_if_t<__same_value_type<_InputIterator>::value>
 _M_insert_range_equal(_InputIterator __first, _InputIterator __last)
 {
   _Alloc_node __an(*this);
   for (; __first != __last; ++__first)
     _M_insert_equal_(end(), *__first, __an);
 }
      template<typename _InputIterator>
 __enable_if_t<!__same_value_type<_InputIterator>::value>
 _M_insert_range_equal(_InputIterator __first, _InputIterator __last)
 {
   _Alloc_node __an(*this);
   for (; __first != __last; ++__first)
     _M_emplace_equal(*__first);
 }
    private:
      void
      _M_erase_aux(const_iterator __position);
      void
      _M_erase_aux(const_iterator __first, const_iterator __last);
    public:
      __attribute ((__abi_tag__ ("cxx11")))
      iterator
      erase(const_iterator __position)
      {
 do { if (__builtin_is_constant_evaluated() && !bool(__position != end())) __builtin_unreachable(); } while (false);
 const_iterator __result = __position;
 ++__result;
 _M_erase_aux(__position);
 return __result._M_const_cast();
      }
      __attribute ((__abi_tag__ ("cxx11")))
      iterator
      erase(iterator __position)
      {
 do { if (__builtin_is_constant_evaluated() && !bool(__position != end())) __builtin_unreachable(); } while (false);
 iterator __result = __position;
 ++__result;
 _M_erase_aux(__position);
 return __result;
      }
      size_type
      erase(const key_type& __x);
      __attribute ((__abi_tag__ ("cxx11")))
      iterator
      erase(const_iterator __first, const_iterator __last)
      {
 _M_erase_aux(__first, __last);
 return __last._M_const_cast();
      }
      void
      clear() noexcept
      {
 _M_erase(_M_begin());
 _M_impl._M_reset();
      }
      iterator
      find(const key_type& __k);
      const_iterator
      find(const key_type& __k) const;
      size_type
      count(const key_type& __k) const;
      iterator
      lower_bound(const key_type& __k)
      { return _M_lower_bound(_M_begin(), _M_end(), __k); }
      const_iterator
      lower_bound(const key_type& __k) const
      { return _M_lower_bound(_M_begin(), _M_end(), __k); }
      iterator
      upper_bound(const key_type& __k)
      { return _M_upper_bound(_M_begin(), _M_end(), __k); }
      const_iterator
      upper_bound(const key_type& __k) const
      { return _M_upper_bound(_M_begin(), _M_end(), __k); }
      pair<iterator, iterator>
      equal_range(const key_type& __k);
      pair<const_iterator, const_iterator>
      equal_range(const key_type& __k) const;
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 iterator
 _M_find_tr(const _Kt& __k)
 {
   const _Rb_tree* __const_this = this;
   return __const_this->_M_find_tr(__k)._M_const_cast();
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 const_iterator
 _M_find_tr(const _Kt& __k) const
 {
   auto __j = _M_lower_bound_tr(__k);
   if (__j != end() && _M_impl._M_key_compare(__k, _S_key(__j._M_node)))
     __j = end();
   return __j;
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 size_type
 _M_count_tr(const _Kt& __k) const
 {
   auto __p = _M_equal_range_tr(__k);
   return std::distance(__p.first, __p.second);
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 iterator
 _M_lower_bound_tr(const _Kt& __k)
 {
   const _Rb_tree* __const_this = this;
   return __const_this->_M_lower_bound_tr(__k)._M_const_cast();
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 const_iterator
 _M_lower_bound_tr(const _Kt& __k) const
 {
   auto __x = _M_begin();
   auto __y = _M_end();
   while (__x != 0)
     if (!_M_impl._M_key_compare(_S_key(__x), __k))
       {
  __y = __x;
  __x = _S_left(__x);
       }
     else
       __x = _S_right(__x);
   return const_iterator(__y);
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 iterator
 _M_upper_bound_tr(const _Kt& __k)
 {
   const _Rb_tree* __const_this = this;
   return __const_this->_M_upper_bound_tr(__k)._M_const_cast();
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 const_iterator
 _M_upper_bound_tr(const _Kt& __k) const
 {
   auto __x = _M_begin();
   auto __y = _M_end();
   while (__x != 0)
     if (_M_impl._M_key_compare(__k, _S_key(__x)))
       {
  __y = __x;
  __x = _S_left(__x);
       }
     else
       __x = _S_right(__x);
   return const_iterator(__y);
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 pair<iterator, iterator>
 _M_equal_range_tr(const _Kt& __k)
 {
   const _Rb_tree* __const_this = this;
   auto __ret = __const_this->_M_equal_range_tr(__k);
   return { __ret.first._M_const_cast(), __ret.second._M_const_cast() };
 }
      template<typename _Kt,
        typename _Req = __has_is_transparent_t<_Compare, _Kt>>
 pair<const_iterator, const_iterator>
 _M_equal_range_tr(const _Kt& __k) const
 {
   auto __low = _M_lower_bound_tr(__k);
   auto __high = __low;
   auto& __cmp = _M_impl._M_key_compare;
   while (__high != end() && !__cmp(__k, _S_key(__high._M_node)))
     ++__high;
   return { __low, __high };
 }
      bool
      __rb_verify() const;
      _Rb_tree&
      operator=(_Rb_tree&&)
      noexcept(_Alloc_traits::_S_nothrow_move()
        && is_nothrow_move_assignable<_Compare>::value);
      template<typename _Iterator>
 void
 _M_assign_unique(_Iterator, _Iterator);
      template<typename _Iterator>
 void
 _M_assign_equal(_Iterator, _Iterator);
    private:
      void
      _M_move_data(_Rb_tree& __x, true_type)
      { _M_impl._M_move_data(__x._M_impl); }
      void
      _M_move_data(_Rb_tree&, false_type);
      void
      _M_move_assign(_Rb_tree&, true_type);
      void
      _M_move_assign(_Rb_tree&, false_type);
    public:
      insert_return_type
      _M_reinsert_node_unique(node_type&& __nh)
      {
 insert_return_type __ret;
 if (__nh.empty())
   __ret.position = end();
 else
   {
     do { if (__builtin_is_constant_evaluated() && !bool(_M_get_Node_allocator() == *__nh._M_alloc)) __builtin_unreachable(); } while (false);
     auto __res = _M_get_insert_unique_pos(__nh._M_key());
     if (__res.second)
       {
  __ret.position
    = _M_insert_node(__res.first, __res.second, __nh._M_ptr);
  __nh._M_ptr = nullptr;
  __ret.inserted = true;
       }
     else
       {
  __ret.node = std::move(__nh);
  __ret.position = iterator(__res.first);
  __ret.inserted = false;
       }
   }
 return __ret;
      }
      iterator
      _M_reinsert_node_equal(node_type&& __nh)
      {
 iterator __ret;
 if (__nh.empty())
   __ret = end();
 else
   {
     do { if (__builtin_is_constant_evaluated() && !bool(_M_get_Node_allocator() == *__nh._M_alloc)) __builtin_unreachable(); } while (false);
     auto __res = _M_get_insert_equal_pos(__nh._M_key());
     if (__res.second)
       __ret = _M_insert_node(__res.first, __res.second, __nh._M_ptr);
     else
       __ret = _M_insert_equal_lower_node(__nh._M_ptr);
     __nh._M_ptr = nullptr;
   }
 return __ret;
      }
      iterator
      _M_reinsert_node_hint_unique(const_iterator __hint, node_type&& __nh)
      {
 iterator __ret;
 if (__nh.empty())
   __ret = end();
 else
   {
     do { if (__builtin_is_constant_evaluated() && !bool(_M_get_Node_allocator() == *__nh._M_alloc)) __builtin_unreachable(); } while (false);
     auto __res = _M_get_insert_hint_unique_pos(__hint, __nh._M_key());
     if (__res.second)
       {
  __ret = _M_insert_node(__res.first, __res.second, __nh._M_ptr);
  __nh._M_ptr = nullptr;
       }
     else
       __ret = iterator(__res.first);
   }
 return __ret;
      }
      iterator
      _M_reinsert_node_hint_equal(const_iterator __hint, node_type&& __nh)
      {
 iterator __ret;
 if (__nh.empty())
   __ret = end();
 else
   {
     do { if (__builtin_is_constant_evaluated() && !bool(_M_get_Node_allocator() == *__nh._M_alloc)) __builtin_unreachable(); } while (false);
     auto __res = _M_get_insert_hint_equal_pos(__hint, __nh._M_key());
     if (__res.second)
       __ret = _M_insert_node(__res.first, __res.second, __nh._M_ptr);
     else
       __ret = _M_insert_equal_lower_node(__nh._M_ptr);
     __nh._M_ptr = nullptr;
   }
 return __ret;
      }
      node_type
      extract(const_iterator __pos)
      {
 auto __ptr = _Rb_tree_rebalance_for_erase(
     __pos._M_const_cast()._M_node, _M_impl._M_header);
 --_M_impl._M_node_count;
 return { static_cast<_Link_type>(__ptr), _M_get_Node_allocator() };
      }
      node_type
      extract(const key_type& __k)
      {
 node_type __nh;
 auto __pos = find(__k);
 if (__pos != end())
   __nh = extract(const_iterator(__pos));
 return __nh;
      }
      template<typename _Compare2>
 using _Compatible_tree
   = _Rb_tree<_Key, _Val, _KeyOfValue, _Compare2, _Alloc>;
      template<typename, typename>
 friend class _Rb_tree_merge_helper;
      template<typename _Compare2>
 void
 _M_merge_unique(_Compatible_tree<_Compare2>& __src) noexcept
 {
   using _Merge_helper = _Rb_tree_merge_helper<_Rb_tree, _Compare2>;
   for (auto __i = __src.begin(), __end = __src.end(); __i != __end;)
     {
       auto __pos = __i++;
       auto __res = _M_get_insert_unique_pos(_KeyOfValue()(*__pos));
       if (__res.second)
  {
    auto& __src_impl = _Merge_helper::_S_get_impl(__src);
    auto __ptr = _Rb_tree_rebalance_for_erase(
        __pos._M_node, __src_impl._M_header);
    --__src_impl._M_node_count;
    _M_insert_node(__res.first, __res.second,
     static_cast<_Link_type>(__ptr));
  }
     }
 }
      template<typename _Compare2>
 void
 _M_merge_equal(_Compatible_tree<_Compare2>& __src) noexcept
 {
   using _Merge_helper = _Rb_tree_merge_helper<_Rb_tree, _Compare2>;
   for (auto __i = __src.begin(), __end = __src.end(); __i != __end;)
     {
       auto __pos = __i++;
       auto __res = _M_get_insert_equal_pos(_KeyOfValue()(*__pos));
       if (__res.second)
  {
    auto& __src_impl = _Merge_helper::_S_get_impl(__src);
    auto __ptr = _Rb_tree_rebalance_for_erase(
        __pos._M_node, __src_impl._M_header);
    --__src_impl._M_node_count;
    _M_insert_node(__res.first, __res.second,
     static_cast<_Link_type>(__ptr));
  }
     }
 }
      friend bool
      operator==(const _Rb_tree& __x, const _Rb_tree& __y)
      {
 return __x.size() == __y.size()
   && std::equal(__x.begin(), __x.end(), __y.begin());
      }
      friend bool
      operator<(const _Rb_tree& __x, const _Rb_tree& __y)
      {
 return std::lexicographical_compare(__x.begin(), __x.end(),
         __y.begin(), __y.end());
      }
    };
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    inline void
    swap(_Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
  _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    { __x.swap(__y); }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_move_data(_Rb_tree& __x, false_type)
    {
      if (_M_get_Node_allocator() == __x._M_get_Node_allocator())
 _M_move_data(__x, true_type());
      else
 {
   constexpr bool __move = !__move_if_noexcept_cond<value_type>::value;
   _Alloc_node __an(*this);
   _M_root() = _M_copy<__move>(__x, __an);
   if constexpr (__move)
     __x.clear();
 }
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    inline void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_move_assign(_Rb_tree& __x, true_type)
    {
      clear();
      if (__x._M_root() != nullptr)
 _M_move_data(__x, true_type());
      std::__alloc_on_move(_M_get_Node_allocator(),
      __x._M_get_Node_allocator());
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_move_assign(_Rb_tree& __x, false_type)
    {
      if (_M_get_Node_allocator() == __x._M_get_Node_allocator())
 return _M_move_assign(__x, true_type{});
      _Reuse_or_alloc_node __roan(*this);
      _M_impl._M_reset();
      if (__x._M_root() != nullptr)
 {
   _M_root() = _M_copy<__as_rvalue>(__x, __roan);
   __x.clear();
 }
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    inline _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>&
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    operator=(_Rb_tree&& __x)
    noexcept(_Alloc_traits::_S_nothrow_move()
      && is_nothrow_move_assignable<_Compare>::value)
    {
      _M_impl._M_key_compare = std::move(__x._M_impl._M_key_compare);
      _M_move_assign(__x, __bool_constant<_Alloc_traits::_S_nothrow_move()>());
      return *this;
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Iterator>
      void
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_assign_unique(_Iterator __first, _Iterator __last)
      {
 _Reuse_or_alloc_node __roan(*this);
 _M_impl._M_reset();
 for (; __first != __last; ++__first)
   _M_insert_unique_(end(), *__first, __roan);
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Iterator>
      void
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_assign_equal(_Iterator __first, _Iterator __last)
      {
 _Reuse_or_alloc_node __roan(*this);
 _M_impl._M_reset();
 for (; __first != __last; ++__first)
   _M_insert_equal_(end(), *__first, __roan);
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>&
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    operator=(const _Rb_tree& __x)
    {
      if (this != &__x)
 {
   if (_Alloc_traits::_S_propagate_on_copy_assign())
     {
       auto& __this_alloc = this->_M_get_Node_allocator();
       auto& __that_alloc = __x._M_get_Node_allocator();
       if (!_Alloc_traits::_S_always_equal()
    && __this_alloc != __that_alloc)
  {
    clear();
    std::__alloc_on_copy(__this_alloc, __that_alloc);
  }
     }
   _Reuse_or_alloc_node __roan(*this);
   _M_impl._M_reset();
   _M_impl._M_key_compare = __x._M_impl._M_key_compare;
   if (__x._M_root() != 0)
     _M_root() = _M_copy<__as_lvalue>(__x, __roan);
 }
      return *this;
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg, typename _NodeGen>
      typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_insert_(_Base_ptr __x, _Base_ptr __p,
   _Arg&& __v,
   _NodeGen& __node_gen)
      {
 bool __insert_left = (__x != 0 || __p == _M_end()
         || _M_impl._M_key_compare(_KeyOfValue()(__v),
       _S_key(__p)));
 _Link_type __z = __node_gen(std::forward<_Arg>(__v));
 _Rb_tree_insert_and_rebalance(__insert_left, __z, __p,
          this->_M_impl._M_header);
 ++_M_impl._M_node_count;
 return iterator(__z);
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_lower(_Base_ptr __p, _Arg&& __v)
    {
      bool __insert_left = (__p == _M_end()
       || !_M_impl._M_key_compare(_S_key(__p),
             _KeyOfValue()(__v)));
      _Link_type __z = _M_create_node(std::forward<_Arg>(__v));
      _Rb_tree_insert_and_rebalance(__insert_left, __z, __p,
        this->_M_impl._M_header);
      ++_M_impl._M_node_count;
      return iterator(__z);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_equal_lower(_Arg&& __v)
    {
      _Link_type __x = _M_begin();
      _Base_ptr __y = _M_end();
      while (__x != 0)
 {
   __y = __x;
   __x = !_M_impl._M_key_compare(_S_key(__x), _KeyOfValue()(__v)) ?
  _S_left(__x) : _S_right(__x);
 }
      return _M_insert_lower(__y, std::forward<_Arg>(__v));
    }
  template<typename _Key, typename _Val, typename _KoV,
    typename _Compare, typename _Alloc>
    template<bool _MoveValues, typename _NodeGen>
      typename _Rb_tree<_Key, _Val, _KoV, _Compare, _Alloc>::_Link_type
      _Rb_tree<_Key, _Val, _KoV, _Compare, _Alloc>::
      _M_copy(_Link_type __x, _Base_ptr __p, _NodeGen& __node_gen)
      {
 _Link_type __top = _M_clone_node<_MoveValues>(__x, __node_gen);
 __top->_M_parent = __p;
 try
   {
     if (__x->_M_right)
       __top->_M_right =
  _M_copy<_MoveValues>(_S_right(__x), __top, __node_gen);
     __p = __top;
     __x = _S_left(__x);
     while (__x != 0)
       {
  _Link_type __y = _M_clone_node<_MoveValues>(__x, __node_gen);
  __p->_M_left = __y;
  __y->_M_parent = __p;
  if (__x->_M_right)
    __y->_M_right = _M_copy<_MoveValues>(_S_right(__x),
             __y, __node_gen);
  __p = __y;
  __x = _S_left(__x);
       }
   }
 catch(...)
   {
     _M_erase(__top);
     throw;
   }
 return __top;
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_erase(_Link_type __x)
    {
      while (__x != 0)
 {
   _M_erase(_S_right(__x));
   _Link_type __y = _S_left(__x);
   _M_drop_node(__x);
   __x = __y;
 }
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_lower_bound(_Link_type __x, _Base_ptr __y,
     const _Key& __k)
    {
      while (__x != 0)
 if (!_M_impl._M_key_compare(_S_key(__x), __k))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return iterator(__y);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::const_iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_lower_bound(_Const_Link_type __x, _Const_Base_ptr __y,
     const _Key& __k) const
    {
      while (__x != 0)
 if (!_M_impl._M_key_compare(_S_key(__x), __k))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return const_iterator(__y);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_upper_bound(_Link_type __x, _Base_ptr __y,
     const _Key& __k)
    {
      while (__x != 0)
 if (_M_impl._M_key_compare(__k, _S_key(__x)))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return iterator(__y);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::const_iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_upper_bound(_Const_Link_type __x, _Const_Base_ptr __y,
     const _Key& __k) const
    {
      while (__x != 0)
 if (_M_impl._M_key_compare(__k, _S_key(__x)))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return const_iterator(__y);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::iterator,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::iterator>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    equal_range(const _Key& __k)
    {
      _Link_type __x = _M_begin();
      _Base_ptr __y = _M_end();
      while (__x != 0)
 {
   if (_M_impl._M_key_compare(_S_key(__x), __k))
     __x = _S_right(__x);
   else if (_M_impl._M_key_compare(__k, _S_key(__x)))
     __y = __x, __x = _S_left(__x);
   else
     {
       _Link_type __xu(__x);
       _Base_ptr __yu(__y);
       __y = __x, __x = _S_left(__x);
       __xu = _S_right(__xu);
       return pair<iterator,
     iterator>(_M_lower_bound(__x, __y, __k),
        _M_upper_bound(__xu, __yu, __k));
     }
 }
      return pair<iterator, iterator>(iterator(__y),
          iterator(__y));
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::const_iterator,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::const_iterator>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    equal_range(const _Key& __k) const
    {
      _Const_Link_type __x = _M_begin();
      _Const_Base_ptr __y = _M_end();
      while (__x != 0)
 {
   if (_M_impl._M_key_compare(_S_key(__x), __k))
     __x = _S_right(__x);
   else if (_M_impl._M_key_compare(__k, _S_key(__x)))
     __y = __x, __x = _S_left(__x);
   else
     {
       _Const_Link_type __xu(__x);
       _Const_Base_ptr __yu(__y);
       __y = __x, __x = _S_left(__x);
       __xu = _S_right(__xu);
       return pair<const_iterator,
     const_iterator>(_M_lower_bound(__x, __y, __k),
       _M_upper_bound(__xu, __yu, __k));
     }
 }
      return pair<const_iterator, const_iterator>(const_iterator(__y),
        const_iterator(__y));
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    swap(_Rb_tree& __t)
    noexcept(__is_nothrow_swappable<_Compare>::value)
    {
      if (_M_root() == 0)
 {
   if (__t._M_root() != 0)
     _M_impl._M_move_data(__t._M_impl);
 }
      else if (__t._M_root() == 0)
 __t._M_impl._M_move_data(_M_impl);
      else
 {
   std::swap(_M_root(),__t._M_root());
   std::swap(_M_leftmost(),__t._M_leftmost());
   std::swap(_M_rightmost(),__t._M_rightmost());
   _M_root()->_M_parent = _M_end();
   __t._M_root()->_M_parent = __t._M_end();
   std::swap(this->_M_impl._M_node_count, __t._M_impl._M_node_count);
 }
      std::swap(this->_M_impl._M_key_compare, __t._M_impl._M_key_compare);
      _Alloc_traits::_S_on_swap(_M_get_Node_allocator(),
    __t._M_get_Node_allocator());
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_unique_pos(const key_type& __k)
    {
      typedef pair<_Base_ptr, _Base_ptr> _Res;
      _Link_type __x = _M_begin();
      _Base_ptr __y = _M_end();
      bool __comp = true;
      while (__x != 0)
 {
   __y = __x;
   __comp = _M_impl._M_key_compare(__k, _S_key(__x));
   __x = __comp ? _S_left(__x) : _S_right(__x);
 }
      iterator __j = iterator(__y);
      if (__comp)
 {
   if (__j == begin())
     return _Res(__x, __y);
   else
     --__j;
 }
      if (_M_impl._M_key_compare(_S_key(__j._M_node), __k))
 return _Res(__x, __y);
      return _Res(__j._M_node, 0);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_equal_pos(const key_type& __k)
    {
      typedef pair<_Base_ptr, _Base_ptr> _Res;
      _Link_type __x = _M_begin();
      _Base_ptr __y = _M_end();
      while (__x != 0)
 {
   __y = __x;
   __x = _M_impl._M_key_compare(__k, _S_key(__x)) ?
  _S_left(__x) : _S_right(__x);
 }
      return _Res(__x, __y);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::iterator, bool>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_unique(_Arg&& __v)
    {
      typedef pair<iterator, bool> _Res;
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_unique_pos(_KeyOfValue()(__v));
      if (__res.second)
 {
   _Alloc_node __an(*this);
   return _Res(_M_insert_(__res.first, __res.second,
     std::forward<_Arg>(__v), __an),
        true);
 }
      return _Res(iterator(__res.first), false);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_equal(_Arg&& __v)
    {
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_equal_pos(_KeyOfValue()(__v));
      _Alloc_node __an(*this);
      return _M_insert_(__res.first, __res.second,
   std::forward<_Arg>(__v), __an);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_hint_unique_pos(const_iterator __position,
      const key_type& __k)
    {
      iterator __pos = __position._M_const_cast();
      typedef pair<_Base_ptr, _Base_ptr> _Res;
      if (__pos._M_node == _M_end())
 {
   if (size() > 0
       && _M_impl._M_key_compare(_S_key(_M_rightmost()), __k))
     return _Res(0, _M_rightmost());
   else
     return _M_get_insert_unique_pos(__k);
 }
      else if (_M_impl._M_key_compare(__k, _S_key(__pos._M_node)))
 {
   iterator __before = __pos;
   if (__pos._M_node == _M_leftmost())
     return _Res(_M_leftmost(), _M_leftmost());
   else if (_M_impl._M_key_compare(_S_key((--__before)._M_node), __k))
     {
       if (_S_right(__before._M_node) == 0)
  return _Res(0, __before._M_node);
       else
  return _Res(__pos._M_node, __pos._M_node);
     }
   else
     return _M_get_insert_unique_pos(__k);
 }
      else if (_M_impl._M_key_compare(_S_key(__pos._M_node), __k))
 {
   iterator __after = __pos;
   if (__pos._M_node == _M_rightmost())
     return _Res(0, _M_rightmost());
   else if (_M_impl._M_key_compare(__k, _S_key((++__after)._M_node)))
     {
       if (_S_right(__pos._M_node) == 0)
  return _Res(0, __pos._M_node);
       else
  return _Res(__after._M_node, __after._M_node);
     }
   else
     return _M_get_insert_unique_pos(__k);
 }
      else
 return _Res(__pos._M_node, 0);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg, typename _NodeGen>
      typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_insert_unique_(const_iterator __position,
   _Arg&& __v,
   _NodeGen& __node_gen)
    {
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_hint_unique_pos(__position, _KeyOfValue()(__v));
      if (__res.second)
 return _M_insert_(__res.first, __res.second,
     std::forward<_Arg>(__v),
     __node_gen);
      return iterator(__res.first);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_hint_equal_pos(const_iterator __position, const key_type& __k)
    {
      iterator __pos = __position._M_const_cast();
      typedef pair<_Base_ptr, _Base_ptr> _Res;
      if (__pos._M_node == _M_end())
 {
   if (size() > 0
       && !_M_impl._M_key_compare(__k, _S_key(_M_rightmost())))
     return _Res(0, _M_rightmost());
   else
     return _M_get_insert_equal_pos(__k);
 }
      else if (!_M_impl._M_key_compare(_S_key(__pos._M_node), __k))
 {
   iterator __before = __pos;
   if (__pos._M_node == _M_leftmost())
     return _Res(_M_leftmost(), _M_leftmost());
   else if (!_M_impl._M_key_compare(__k, _S_key((--__before)._M_node)))
     {
       if (_S_right(__before._M_node) == 0)
  return _Res(0, __before._M_node);
       else
  return _Res(__pos._M_node, __pos._M_node);
     }
   else
     return _M_get_insert_equal_pos(__k);
 }
      else
 {
   iterator __after = __pos;
   if (__pos._M_node == _M_rightmost())
     return _Res(0, _M_rightmost());
   else if (!_M_impl._M_key_compare(_S_key((++__after)._M_node), __k))
     {
       if (_S_right(__pos._M_node) == 0)
  return _Res(0, __pos._M_node);
       else
  return _Res(__after._M_node, __after._M_node);
     }
   else
     return _Res(0, 0);
 }
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename _Arg, typename _NodeGen>
      typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_insert_equal_(const_iterator __position,
         _Arg&& __v,
         _NodeGen& __node_gen)
      {
 pair<_Base_ptr, _Base_ptr> __res
   = _M_get_insert_hint_equal_pos(__position, _KeyOfValue()(__v));
 if (__res.second)
   return _M_insert_(__res.first, __res.second,
       std::forward<_Arg>(__v),
       __node_gen);
 return _M_insert_equal_lower(std::forward<_Arg>(__v));
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_node(_Base_ptr __x, _Base_ptr __p, _Link_type __z)
    {
      bool __insert_left = (__x != 0 || __p == _M_end()
       || _M_impl._M_key_compare(_S_key(__z),
            _S_key(__p)));
      _Rb_tree_insert_and_rebalance(__insert_left, __z, __p,
        this->_M_impl._M_header);
      ++_M_impl._M_node_count;
      return iterator(__z);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_lower_node(_Base_ptr __p, _Link_type __z)
    {
      bool __insert_left = (__p == _M_end()
       || !_M_impl._M_key_compare(_S_key(__p),
             _S_key(__z)));
      _Rb_tree_insert_and_rebalance(__insert_left, __z, __p,
        this->_M_impl._M_header);
      ++_M_impl._M_node_count;
      return iterator(__z);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_insert_equal_lower_node(_Link_type __z)
    {
      _Link_type __x = _M_begin();
      _Base_ptr __y = _M_end();
      while (__x != 0)
 {
   __y = __x;
   __x = !_M_impl._M_key_compare(_S_key(__x), _S_key(__z)) ?
  _S_left(__x) : _S_right(__x);
 }
      return _M_insert_lower_node(__y, __z);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename... _Args>
      pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator, bool>
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_emplace_unique(_Args&&... __args)
      {
 _Link_type __z = _M_create_node(std::forward<_Args>(__args)...);
 try
   {
     typedef pair<iterator, bool> _Res;
     auto __res = _M_get_insert_unique_pos(_S_key(__z));
     if (__res.second)
       return _Res(_M_insert_node(__res.first, __res.second, __z), true);
     _M_drop_node(__z);
     return _Res(iterator(__res.first), false);
   }
 catch(...)
   {
     _M_drop_node(__z);
     throw;
   }
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename... _Args>
      typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_emplace_equal(_Args&&... __args)
      {
 _Link_type __z = _M_create_node(std::forward<_Args>(__args)...);
 try
   {
     auto __res = _M_get_insert_equal_pos(_S_key(__z));
     return _M_insert_node(__res.first, __res.second, __z);
   }
 catch(...)
   {
     _M_drop_node(__z);
     throw;
   }
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename... _Args>
      typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_emplace_hint_unique(const_iterator __pos, _Args&&... __args)
      {
 _Link_type __z = _M_create_node(std::forward<_Args>(__args)...);
 try
   {
     auto __res = _M_get_insert_hint_unique_pos(__pos, _S_key(__z));
     if (__res.second)
       return _M_insert_node(__res.first, __res.second, __z);
     _M_drop_node(__z);
     return iterator(__res.first);
   }
 catch(...)
   {
     _M_drop_node(__z);
     throw;
   }
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    template<typename... _Args>
      typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
      _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
      _M_emplace_hint_equal(const_iterator __pos, _Args&&... __args)
      {
 _Link_type __z = _M_create_node(std::forward<_Args>(__args)...);
 try
   {
     auto __res = _M_get_insert_hint_equal_pos(__pos, _S_key(__z));
     if (__res.second)
       return _M_insert_node(__res.first, __res.second, __z);
     return _M_insert_equal_lower_node(__z);
   }
 catch(...)
   {
     _M_drop_node(__z);
     throw;
   }
      }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_erase_aux(const_iterator __position)
    {
      _Link_type __y =
 static_cast<_Link_type>(_Rb_tree_rebalance_for_erase
    (const_cast<_Base_ptr>(__position._M_node),
     this->_M_impl._M_header));
      _M_drop_node(__y);
      --_M_impl._M_node_count;
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_erase_aux(const_iterator __first, const_iterator __last)
    {
      if (__first == begin() && __last == end())
 clear();
      else
 while (__first != __last)
   _M_erase_aux(__first++);
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::size_type
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    erase(const _Key& __x)
    {
      pair<iterator, iterator> __p = equal_range(__x);
      const size_type __old_size = size();
      _M_erase_aux(__p.first, __p.second);
      return __old_size - size();
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    find(const _Key& __k)
    {
      iterator __j = _M_lower_bound(_M_begin(), _M_end(), __k);
      return (__j == end()
       || _M_impl._M_key_compare(__k,
     _S_key(__j._M_node))) ? end() : __j;
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::const_iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    find(const _Key& __k) const
    {
      const_iterator __j = _M_lower_bound(_M_begin(), _M_end(), __k);
      return (__j == end()
       || _M_impl._M_key_compare(__k,
     _S_key(__j._M_node))) ? end() : __j;
    }
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::size_type
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    count(const _Key& __k) const
    {
      pair<const_iterator, const_iterator> __p = equal_range(__k);
      const size_type __n = std::distance(__p.first, __p.second);
      return __n;
    }
  __attribute__ ((__pure__)) unsigned int
  _Rb_tree_black_count(const _Rb_tree_node_base* __node,
         const _Rb_tree_node_base* __root) throw ();
  template<typename _Key, typename _Val, typename _KeyOfValue,
    typename _Compare, typename _Alloc>
    bool
    _Rb_tree<_Key,_Val,_KeyOfValue,_Compare,_Alloc>::__rb_verify() const
    {
      if (_M_impl._M_node_count == 0 || begin() == end())
 return _M_impl._M_node_count == 0 && begin() == end()
        && this->_M_impl._M_header._M_left == _M_end()
        && this->_M_impl._M_header._M_right == _M_end();
      unsigned int __len = _Rb_tree_black_count(_M_leftmost(), _M_root());
      for (const_iterator __it = begin(); __it != end(); ++__it)
 {
   _Const_Link_type __x = static_cast<_Const_Link_type>(__it._M_node);
   _Const_Link_type __L = _S_left(__x);
   _Const_Link_type __R = _S_right(__x);
   if (__x->_M_color == _S_red)
     if ((__L && __L->_M_color == _S_red)
  || (__R && __R->_M_color == _S_red))
       return false;
   if (__L && _M_impl._M_key_compare(_S_key(__x), _S_key(__L)))
     return false;
   if (__R && _M_impl._M_key_compare(_S_key(__R), _S_key(__x)))
     return false;
   if (!__L && !__R && _Rb_tree_black_count(__x, _M_root()) != __len)
     return false;
 }
      if (_M_leftmost() != _Rb_tree_node_base::_S_minimum(_M_root()))
 return false;
      if (_M_rightmost() != _Rb_tree_node_base::_S_maximum(_M_root()))
 return false;
      return true;
    }
  template<typename _Key, typename _Val, typename _Sel, typename _Cmp1,
    typename _Alloc, typename _Cmp2>
    struct _Rb_tree_merge_helper<_Rb_tree<_Key, _Val, _Sel, _Cmp1, _Alloc>,
     _Cmp2>
    {
    private:
      friend class _Rb_tree<_Key, _Val, _Sel, _Cmp1, _Alloc>;
      static auto&
      _S_get_impl(_Rb_tree<_Key, _Val, _Sel, _Cmp2, _Alloc>& __tree)
      { return __tree._M_impl; }
    };
}
#pragma GCC visibility push(default)
namespace std
{
  template<class _E>
    class initializer_list
    {
    public:
      typedef _E value_type;
      typedef const _E& reference;
      typedef const _E& const_reference;
      typedef size_t size_type;
      typedef const _E* iterator;
      typedef const _E* const_iterator;
    private:
      iterator _M_array;
      size_type _M_len;
      constexpr initializer_list(const_iterator __a, size_type __l)
      : _M_array(__a), _M_len(__l) { }
    public:
      constexpr initializer_list() noexcept
      : _M_array(0), _M_len(0) { }
      constexpr size_type
      size() const noexcept { return _M_len; }
      constexpr const_iterator
      begin() const noexcept { return _M_array; }
      constexpr const_iterator
      end() const noexcept { return begin() + size(); }
    };
  template<class _Tp>
    constexpr const _Tp*
    begin(initializer_list<_Tp> __ils) noexcept
    { return __ils.begin(); }
  template<class _Tp>
    constexpr const _Tp*
    end(initializer_list<_Tp> __ils) noexcept
    { return __ils.end(); }
}
#pragma GCC visibility pop
namespace std __attribute__ ((__visibility__ ("default")))
{
  namespace rel_ops
  {
    template <class _Tp>
      inline bool
      operator!=(const _Tp& __x, const _Tp& __y)
      { return !(__x == __y); }
    template <class _Tp>
      inline bool
      operator>(const _Tp& __x, const _Tp& __y)
      { return __y < __x; }
    template <class _Tp>
      inline bool
      operator<=(const _Tp& __x, const _Tp& __y)
      { return !(__y < __x); }
    template <class _Tp>
      inline bool
      operator>=(const _Tp& __x, const _Tp& __y)
      { return !(__x < __y); }
  }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp>
    struct tuple_size;
  template<typename _Tp,
    typename _Up = typename remove_cv<_Tp>::type,
    typename = typename enable_if<is_same<_Tp, _Up>::value>::type,
    size_t = tuple_size<_Tp>::value>
    using __enable_if_has_tuple_size = _Tp;
  template<typename _Tp>
    struct tuple_size<const __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };
  template<typename _Tp>
    struct tuple_size<volatile __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };
  template<typename _Tp>
    struct tuple_size<const volatile __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };
  template<size_t __i, typename _Tp>
    struct tuple_element;
  template<size_t __i, typename _Tp>
    using __tuple_element_t = typename tuple_element<__i, _Tp>::type;
  template<size_t __i, typename _Tp>
    struct tuple_element<__i, const _Tp>
    {
      typedef typename add_const<__tuple_element_t<__i, _Tp>>::type type;
    };
  template<size_t __i, typename _Tp>
    struct tuple_element<__i, volatile _Tp>
    {
      typedef typename add_volatile<__tuple_element_t<__i, _Tp>>::type type;
    };
  template<size_t __i, typename _Tp>
    struct tuple_element<__i, const volatile _Tp>
    {
      typedef typename add_cv<__tuple_element_t<__i, _Tp>>::type type;
    };
  template<size_t __i, typename _Tp>
    using tuple_element_t = typename tuple_element<__i, _Tp>::type;
  template<typename _T1, typename _T2>
    struct __is_tuple_like_impl<pair<_T1, _T2>> : true_type
    { };
  template<class _Tp1, class _Tp2>
    struct tuple_size<pair<_Tp1, _Tp2>>
    : public integral_constant<size_t, 2> { };
  template<class _Tp1, class _Tp2>
    struct tuple_element<0, pair<_Tp1, _Tp2>>
    { typedef _Tp1 type; };
  template<class _Tp1, class _Tp2>
    struct tuple_element<1, pair<_Tp1, _Tp2>>
    { typedef _Tp2 type; };
  template<size_t _Int>
    struct __pair_get;
  template<>
    struct __pair_get<0>
    {
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp1&
 __get(pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.first; }
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp1&&
 __move_get(pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<_Tp1>(__pair.first); }
      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp1&
 __const_get(const pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.first; }
      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp1&&
 __const_move_get(const pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<const _Tp1>(__pair.first); }
    };
  template<>
    struct __pair_get<1>
    {
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp2&
 __get(pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.second; }
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp2&&
 __move_get(pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<_Tp2>(__pair.second); }
      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp2&
 __const_get(const pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.second; }
      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp2&&
 __const_move_get(const pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<const _Tp2>(__pair.second); }
    };
  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(pair<_Tp1, _Tp2>& __in) noexcept
    { return __pair_get<_Int>::__get(__in); }
  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(pair<_Tp1, _Tp2>&& __in) noexcept
    { return __pair_get<_Int>::__move_get(std::move(__in)); }
  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(const pair<_Tp1, _Tp2>& __in) noexcept
    { return __pair_get<_Int>::__const_get(__in); }
  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(const pair<_Tp1, _Tp2>&& __in) noexcept
    { return __pair_get<_Int>::__const_move_get(std::move(__in)); }
  template <typename _Tp, typename _Up>
    constexpr _Tp&
    get(pair<_Tp, _Up>& __p) noexcept
    { return __p.first; }
  template <typename _Tp, typename _Up>
    constexpr const _Tp&
    get(const pair<_Tp, _Up>& __p) noexcept
    { return __p.first; }
  template <typename _Tp, typename _Up>
    constexpr _Tp&&
    get(pair<_Tp, _Up>&& __p) noexcept
    { return std::move(__p.first); }
  template <typename _Tp, typename _Up>
    constexpr const _Tp&&
    get(const pair<_Tp, _Up>&& __p) noexcept
    { return std::move(__p.first); }
  template <typename _Tp, typename _Up>
    constexpr _Tp&
    get(pair<_Up, _Tp>& __p) noexcept
    { return __p.second; }
  template <typename _Tp, typename _Up>
    constexpr const _Tp&
    get(const pair<_Up, _Tp>& __p) noexcept
    { return __p.second; }
  template <typename _Tp, typename _Up>
    constexpr _Tp&&
    get(pair<_Up, _Tp>&& __p) noexcept
    { return std::move(__p.second); }
  template <typename _Tp, typename _Up>
    constexpr const _Tp&&
    get(const pair<_Up, _Tp>&& __p) noexcept
    { return std::move(__p.second); }
  template <typename _Tp, typename _Up = _Tp>
    inline _Tp
    exchange(_Tp& __obj, _Up&& __new_val)
    { return std::__exchange(__obj, std::forward<_Up>(__new_val)); }
  template<size_t... _Indexes> struct _Index_tuple { };
  template<size_t _Num>
    struct _Build_index_tuple
    {
      template<typename, size_t... _Indices>
        using _IdxTuple = _Index_tuple<_Indices...>;
      using __type = __make_integer_seq<_IdxTuple, size_t, _Num>;
    };
  template<typename _Tp, _Tp... _Idx>
    struct integer_sequence
    {
      typedef _Tp value_type;
      static constexpr size_t size() noexcept { return sizeof...(_Idx); }
    };
  template<typename _Tp, _Tp _Num>
    using make_integer_sequence
      = __make_integer_seq<integer_sequence, _Tp, _Num>;
  template<size_t... _Idx>
    using index_sequence = integer_sequence<size_t, _Idx...>;
  template<size_t _Num>
    using make_index_sequence = make_integer_sequence<size_t, _Num>;
  template<typename... _Types>
    using index_sequence_for = make_index_sequence<sizeof...(_Types)>;
  struct in_place_t {
    explicit in_place_t() = default;
  };
  inline constexpr in_place_t in_place{};
  template<typename _Tp> struct in_place_type_t
  {
    explicit in_place_type_t() = default;
  };
  template<typename _Tp>
    inline constexpr in_place_type_t<_Tp> in_place_type{};
  template<size_t _Idx> struct in_place_index_t
  {
    explicit in_place_index_t() = default;
  };
  template<size_t _Idx>
    inline constexpr in_place_index_t<_Idx> in_place_index{};
  template<typename>
    inline constexpr bool __is_in_place_type_v = false;
  template<typename _Tp>
    inline constexpr bool __is_in_place_type_v<in_place_type_t<_Tp>> = true;
  template<typename _Tp>
    using __is_in_place_type = bool_constant<__is_in_place_type_v<_Tp>>;
  template<typename _Tp>
    [[nodiscard]]
    constexpr add_const_t<_Tp>&
    as_const(_Tp& __t) noexcept
    { return __t; }
  template<typename _Tp>
    void as_const(const _Tp&&) = delete;
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Container>
    inline constexpr auto
    begin(_Container& __cont) -> decltype(__cont.begin())
    { return __cont.begin(); }
  template<typename _Container>
    inline constexpr auto
    begin(const _Container& __cont) -> decltype(__cont.begin())
    { return __cont.begin(); }
  template<typename _Container>
    inline constexpr auto
    end(_Container& __cont) -> decltype(__cont.end())
    { return __cont.end(); }
  template<typename _Container>
    inline constexpr auto
    end(const _Container& __cont) -> decltype(__cont.end())
    { return __cont.end(); }
  template<typename _Tp, size_t _Nm>
    inline constexpr _Tp*
    begin(_Tp (&__arr)[_Nm]) noexcept
    { return __arr; }
  template<typename _Tp, size_t _Nm>
    inline constexpr _Tp*
    end(_Tp (&__arr)[_Nm]) noexcept
    { return __arr + _Nm; }
  template<typename _Tp> class valarray;
  template<typename _Tp> _Tp* begin(valarray<_Tp>&) noexcept;
  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&) noexcept;
  template<typename _Tp> _Tp* end(valarray<_Tp>&) noexcept;
  template<typename _Tp> const _Tp* end(const valarray<_Tp>&) noexcept;
  template<typename _Container>
    inline constexpr auto
    cbegin(const _Container& __cont) noexcept(noexcept(std::begin(__cont)))
      -> decltype(std::begin(__cont))
    { return std::begin(__cont); }
  template<typename _Container>
    inline constexpr auto
    cend(const _Container& __cont) noexcept(noexcept(std::end(__cont)))
      -> decltype(std::end(__cont))
    { return std::end(__cont); }
  template<typename _Container>
    inline constexpr auto
    rbegin(_Container& __cont) -> decltype(__cont.rbegin())
    { return __cont.rbegin(); }
  template<typename _Container>
    inline constexpr auto
    rbegin(const _Container& __cont) -> decltype(__cont.rbegin())
    { return __cont.rbegin(); }
  template<typename _Container>
    inline constexpr auto
    rend(_Container& __cont) -> decltype(__cont.rend())
    { return __cont.rend(); }
  template<typename _Container>
    inline constexpr auto
    rend(const _Container& __cont) -> decltype(__cont.rend())
    { return __cont.rend(); }
  template<typename _Tp, size_t _Nm>
    inline constexpr reverse_iterator<_Tp*>
    rbegin(_Tp (&__arr)[_Nm]) noexcept
    { return reverse_iterator<_Tp*>(__arr + _Nm); }
  template<typename _Tp, size_t _Nm>
    inline constexpr reverse_iterator<_Tp*>
    rend(_Tp (&__arr)[_Nm]) noexcept
    { return reverse_iterator<_Tp*>(__arr); }
  template<typename _Tp>
    inline constexpr reverse_iterator<const _Tp*>
    rbegin(initializer_list<_Tp> __il) noexcept
    { return reverse_iterator<const _Tp*>(__il.end()); }
  template<typename _Tp>
    inline constexpr reverse_iterator<const _Tp*>
    rend(initializer_list<_Tp> __il) noexcept
    { return reverse_iterator<const _Tp*>(__il.begin()); }
  template<typename _Container>
    inline constexpr auto
    crbegin(const _Container& __cont) -> decltype(std::rbegin(__cont))
    { return std::rbegin(__cont); }
  template<typename _Container>
    inline constexpr auto
    crend(const _Container& __cont) -> decltype(std::rend(__cont))
    { return std::rend(__cont); }
  template <typename _Container>
    constexpr auto
    size(const _Container& __cont) noexcept(noexcept(__cont.size()))
    -> decltype(__cont.size())
    { return __cont.size(); }
  template <typename _Tp, size_t _Nm>
    constexpr size_t
    size(const _Tp (&)[_Nm]) noexcept
    { return _Nm; }
  template <typename _Container>
    [[nodiscard]] constexpr auto
    empty(const _Container& __cont) noexcept(noexcept(__cont.empty()))
    -> decltype(__cont.empty())
    { return __cont.empty(); }
  template <typename _Tp, size_t _Nm>
    [[nodiscard]] constexpr bool
    empty(const _Tp (&)[_Nm]) noexcept
    { return false; }
  template <typename _Tp>
    [[nodiscard]] constexpr bool
    empty(initializer_list<_Tp> __il) noexcept
    { return __il.size() == 0;}
  template <typename _Container>
    constexpr auto
    data(_Container& __cont) noexcept(noexcept(__cont.data()))
    -> decltype(__cont.data())
    { return __cont.data(); }
  template <typename _Container>
    constexpr auto
    data(const _Container& __cont) noexcept(noexcept(__cont.data()))
    -> decltype(__cont.data())
    { return __cont.data(); }
  template <typename _Tp, size_t _Nm>
    constexpr _Tp*
    data(_Tp (&__array)[_Nm]) noexcept
    { return __array; }
  template <typename _Tp>
    constexpr const _Tp*
    data(initializer_list<_Tp> __il) noexcept
    { return __il.begin(); }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp, std::size_t _Nm>
    struct __array_traits
    {
      typedef _Tp _Type[_Nm];
      typedef __is_swappable<_Tp> _Is_swappable;
      typedef __is_nothrow_swappable<_Tp> _Is_nothrow_swappable;
      static constexpr _Tp&
      _S_ref(const _Type& __t, std::size_t __n) noexcept
      { return const_cast<_Tp&>(__t[__n]); }
      static constexpr _Tp*
      _S_ptr(const _Type& __t) noexcept
      { return const_cast<_Tp*>(__t); }
    };
 template<typename _Tp>
   struct __array_traits<_Tp, 0>
   {
     struct _Type { };
     typedef true_type _Is_swappable;
     typedef true_type _Is_nothrow_swappable;
     static constexpr _Tp&
     _S_ref(const _Type&, std::size_t) noexcept
     { return *static_cast<_Tp*>(nullptr); }
     static constexpr _Tp*
     _S_ptr(const _Type&) noexcept
     { return nullptr; }
   };
  template<typename _Tp, std::size_t _Nm>
    struct array
    {
      typedef _Tp value_type;
      typedef value_type* pointer;
      typedef const value_type* const_pointer;
      typedef value_type& reference;
      typedef const value_type& const_reference;
      typedef value_type* iterator;
      typedef const value_type* const_iterator;
      typedef std::size_t size_type;
      typedef std::ptrdiff_t difference_type;
      typedef std::reverse_iterator<iterator> reverse_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
      typedef __array_traits<_Tp, _Nm> _AT_Type;
      typename _AT_Type::_Type _M_elems;
                           void
      fill(const value_type& __u)
      { std::fill_n(begin(), size(), __u); }
                           void
      swap(array& __other)
      noexcept(_AT_Type::_Is_nothrow_swappable::value)
      { std::swap_ranges(begin(), end(), __other.begin()); }
      constexpr iterator
      begin() noexcept
      { return iterator(data()); }
      constexpr const_iterator
      begin() const noexcept
      { return const_iterator(data()); }
      constexpr iterator
      end() noexcept
      { return iterator(data() + _Nm); }
      constexpr const_iterator
      end() const noexcept
      { return const_iterator(data() + _Nm); }
      constexpr reverse_iterator
      rbegin() noexcept
      { return reverse_iterator(end()); }
      constexpr const_reverse_iterator
      rbegin() const noexcept
      { return const_reverse_iterator(end()); }
      constexpr reverse_iterator
      rend() noexcept
      { return reverse_iterator(begin()); }
      constexpr const_reverse_iterator
      rend() const noexcept
      { return const_reverse_iterator(begin()); }
      constexpr const_iterator
      cbegin() const noexcept
      { return const_iterator(data()); }
      constexpr const_iterator
      cend() const noexcept
      { return const_iterator(data() + _Nm); }
      constexpr const_reverse_iterator
      crbegin() const noexcept
      { return const_reverse_iterator(end()); }
      constexpr const_reverse_iterator
      crend() const noexcept
      { return const_reverse_iterator(begin()); }
      constexpr size_type
      size() const noexcept { return _Nm; }
      constexpr size_type
      max_size() const noexcept { return _Nm; }
      [[__nodiscard__]] constexpr bool
      empty() const noexcept { return size() == 0; }
      constexpr reference
      operator[](size_type __n) noexcept
      {
                                  ;
 return _AT_Type::_S_ref(_M_elems, __n);
      }
      constexpr const_reference
      operator[](size_type __n) const noexcept
      {
                                  ;
 return _AT_Type::_S_ref(_M_elems, __n);
      }
      constexpr reference
      at(size_type __n)
      {
 if (__n >= _Nm)
   std::__throw_out_of_range_fmt(("array::at: __n (which is %zu) " ">= _Nm (which is %zu)"),
     __n, _Nm);
 return _AT_Type::_S_ref(_M_elems, __n);
      }
      constexpr const_reference
      at(size_type __n) const
      {
 return __n < _Nm ? _AT_Type::_S_ref(_M_elems, __n)
   : (std::__throw_out_of_range_fmt(("array::at: __n (which is %zu) " ">= _Nm (which is %zu)"),
        __n, _Nm),
      _AT_Type::_S_ref(_M_elems, 0));
      }
      constexpr reference
      front() noexcept
      {
                              ;
 return *begin();
      }
      constexpr const_reference
      front() const noexcept
      {
                              ;
 return _AT_Type::_S_ref(_M_elems, 0);
      }
      constexpr reference
      back() noexcept
      {
                              ;
 return _Nm ? *(end() - 1) : *end();
      }
      constexpr const_reference
      back() const noexcept
      {
                              ;
 return _Nm ? _AT_Type::_S_ref(_M_elems, _Nm - 1)
             : _AT_Type::_S_ref(_M_elems, 0);
      }
      constexpr pointer
      data() noexcept
      { return _AT_Type::_S_ptr(_M_elems); }
      constexpr const_pointer
      data() const noexcept
      { return _AT_Type::_S_ptr(_M_elems); }
    };
  template<typename _Tp, typename... _Up>
    array(_Tp, _Up...)
      -> array<enable_if_t<(is_same_v<_Tp, _Up> && ...), _Tp>,
        1 + sizeof...(_Up)>;
  template<typename _Tp, std::size_t _Nm>
    inline bool
    operator==(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return std::equal(__one.begin(), __one.end(), __two.begin()); }
  template<typename _Tp, std::size_t _Nm>
    inline bool
    operator!=(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return !(__one == __two); }
  template<typename _Tp, std::size_t _Nm>
    inline bool
    operator<(const array<_Tp, _Nm>& __a, const array<_Tp, _Nm>& __b)
    {
      return std::lexicographical_compare(__a.begin(), __a.end(),
       __b.begin(), __b.end());
    }
  template<typename _Tp, std::size_t _Nm>
    inline bool
    operator>(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return __two < __one; }
  template<typename _Tp, std::size_t _Nm>
    inline bool
    operator<=(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return !(__one > __two); }
  template<typename _Tp, std::size_t _Nm>
    inline bool
    operator>=(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return !(__one < __two); }
  template<typename _Tp, std::size_t _Nm>
    inline
    typename enable_if<
      __array_traits<_Tp, _Nm>::_Is_swappable::value
    >::type
    swap(array<_Tp, _Nm>& __one, array<_Tp, _Nm>& __two)
    noexcept(noexcept(__one.swap(__two)))
    { __one.swap(__two); }
  template<typename _Tp, std::size_t _Nm>
    typename enable_if<
      !__array_traits<_Tp, _Nm>::_Is_swappable::value>::type
    swap(array<_Tp, _Nm>&, array<_Tp, _Nm>&) = delete;
  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr _Tp&
    get(array<_Tp, _Nm>& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return __array_traits<_Tp, _Nm>::_S_ref(__arr._M_elems, _Int);
    }
  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr _Tp&&
    get(array<_Tp, _Nm>&& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return std::move(std::get<_Int>(__arr));
    }
  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr const _Tp&
    get(const array<_Tp, _Nm>& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return __array_traits<_Tp, _Nm>::_S_ref(__arr._M_elems, _Int);
    }
  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr const _Tp&&
    get(const array<_Tp, _Nm>&& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return std::move(std::get<_Int>(__arr));
    }
  template<typename _Tp>
    struct tuple_size;
  template<typename _Tp, std::size_t _Nm>
    struct tuple_size<array<_Tp, _Nm>>
    : public integral_constant<std::size_t, _Nm> { };
  template<std::size_t _Int, typename _Tp>
    struct tuple_element;
  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    struct tuple_element<_Int, array<_Tp, _Nm>>
    {
      static_assert(_Int < _Nm, "index is out of bounds");
      typedef _Tp type;
    };
  template<typename _Tp, std::size_t _Nm>
    struct __is_tuple_like_impl<array<_Tp, _Nm>> : true_type
    { };
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  struct __erased_type { };
  template<typename _Alloc, typename _Tp>
    using __is_erased_or_convertible
      = __or_<is_convertible<_Alloc, _Tp>, is_same<_Tp, __erased_type>>;
  struct allocator_arg_t { explicit allocator_arg_t() = default; };
  inline constexpr allocator_arg_t allocator_arg =
    allocator_arg_t();
  template<typename _Tp, typename _Alloc, typename = __void_t<>>
    struct __uses_allocator_helper
    : false_type { };
  template<typename _Tp, typename _Alloc>
    struct __uses_allocator_helper<_Tp, _Alloc,
       __void_t<typename _Tp::allocator_type>>
    : __is_erased_or_convertible<_Alloc, typename _Tp::allocator_type>::type
    { };
  template<typename _Tp, typename _Alloc>
    struct uses_allocator
    : __uses_allocator_helper<_Tp, _Alloc>::type
    { };
  struct __uses_alloc_base { };
  struct __uses_alloc0 : __uses_alloc_base
  {
    struct _Sink { void operator=(const void*) { } } _M_a;
  };
  template<typename _Alloc>
    struct __uses_alloc1 : __uses_alloc_base { const _Alloc* _M_a; };
  template<typename _Alloc>
    struct __uses_alloc2 : __uses_alloc_base { const _Alloc* _M_a; };
  template<bool, typename _Tp, typename _Alloc, typename... _Args>
    struct __uses_alloc;
  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __uses_alloc<true, _Tp, _Alloc, _Args...>
    : conditional<
        is_constructible<_Tp, allocator_arg_t, const _Alloc&, _Args...>::value,
        __uses_alloc1<_Alloc>,
        __uses_alloc2<_Alloc>>::type
    {
      static_assert(__or_<
   is_constructible<_Tp, allocator_arg_t, const _Alloc&, _Args...>,
   is_constructible<_Tp, _Args..., const _Alloc&>>::value,
   "construction with an allocator must be possible"
   " if uses_allocator is true");
    };
  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __uses_alloc<false, _Tp, _Alloc, _Args...>
    : __uses_alloc0 { };
  template<typename _Tp, typename _Alloc, typename... _Args>
    using __uses_alloc_t =
      __uses_alloc<uses_allocator<_Tp, _Alloc>::value, _Tp, _Alloc, _Args...>;
  template<typename _Tp, typename _Alloc, typename... _Args>
    inline __uses_alloc_t<_Tp, _Alloc, _Args...>
    __use_alloc(const _Alloc& __a)
    {
      __uses_alloc_t<_Tp, _Alloc, _Args...> __ret;
      __ret._M_a = std::__addressof(__a);
      return __ret;
    }
  template<typename _Tp, typename _Alloc, typename... _Args>
    void
    __use_alloc(const _Alloc&&) = delete;
  template <typename _Tp, typename _Alloc>
    inline constexpr bool uses_allocator_v =
      uses_allocator<_Tp, _Alloc>::value;
  template<template<typename...> class _Predicate,
    typename _Tp, typename _Alloc, typename... _Args>
    struct __is_uses_allocator_predicate
    : conditional<uses_allocator<_Tp, _Alloc>::value,
      __or_<_Predicate<_Tp, allocator_arg_t, _Alloc, _Args...>,
     _Predicate<_Tp, _Args..., _Alloc>>,
      _Predicate<_Tp, _Args...>>::type { };
  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __is_uses_allocator_constructible
    : __is_uses_allocator_predicate<is_constructible, _Tp, _Alloc, _Args...>
    { };
  template<typename _Tp, typename _Alloc, typename... _Args>
    inline constexpr bool __is_uses_allocator_constructible_v =
      __is_uses_allocator_constructible<_Tp, _Alloc, _Args...>::value;
  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __is_nothrow_uses_allocator_constructible
    : __is_uses_allocator_predicate<is_nothrow_constructible,
        _Tp, _Alloc, _Args...>
    { };
  template<typename _Tp, typename _Alloc, typename... _Args>
    inline constexpr bool
    __is_nothrow_uses_allocator_constructible_v =
      __is_nothrow_uses_allocator_constructible<_Tp, _Alloc, _Args...>::value;
  template<typename _Tp, typename... _Args>
    void __uses_allocator_construct_impl(__uses_alloc0 __a, _Tp* __ptr,
      _Args&&... __args)
    { ::new ((void*)__ptr) _Tp(std::forward<_Args>(__args)...); }
  template<typename _Tp, typename _Alloc, typename... _Args>
    void __uses_allocator_construct_impl(__uses_alloc1<_Alloc> __a, _Tp* __ptr,
      _Args&&... __args)
    {
      ::new ((void*)__ptr) _Tp(allocator_arg, *__a._M_a,
          std::forward<_Args>(__args)...);
    }
  template<typename _Tp, typename _Alloc, typename... _Args>
    void __uses_allocator_construct_impl(__uses_alloc2<_Alloc> __a, _Tp* __ptr,
      _Args&&... __args)
    { ::new ((void*)__ptr) _Tp(std::forward<_Args>(__args)..., *__a._M_a); }
  template<typename _Tp, typename _Alloc, typename... _Args>
    void __uses_allocator_construct(const _Alloc& __a, _Tp* __ptr,
        _Args&&... __args)
    {
      std::__uses_allocator_construct_impl(
   std::__use_alloc<_Tp, _Alloc, _Args...>(__a), __ptr,
   std::forward<_Args>(__args)...);
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename _Tp, typename _Up = typename __inv_unwrap<_Tp>::type>
    constexpr _Up&&
    __invfwd(typename remove_reference<_Tp>::type& __t) noexcept
    { return static_cast<_Up&&>(__t); }
  template<typename _Res, typename _Fn, typename... _Args>
    constexpr _Res
    __invoke_impl(__invoke_other, _Fn&& __f, _Args&&... __args)
    { return std::forward<_Fn>(__f)(std::forward<_Args>(__args)...); }
  template<typename _Res, typename _MemFun, typename _Tp, typename... _Args>
    constexpr _Res
    __invoke_impl(__invoke_memfun_ref, _MemFun&& __f, _Tp&& __t,
    _Args&&... __args)
    { return (__invfwd<_Tp>(__t).*__f)(std::forward<_Args>(__args)...); }
  template<typename _Res, typename _MemFun, typename _Tp, typename... _Args>
    constexpr _Res
    __invoke_impl(__invoke_memfun_deref, _MemFun&& __f, _Tp&& __t,
    _Args&&... __args)
    {
      return ((*std::forward<_Tp>(__t)).*__f)(std::forward<_Args>(__args)...);
    }
  template<typename _Res, typename _MemPtr, typename _Tp>
    constexpr _Res
    __invoke_impl(__invoke_memobj_ref, _MemPtr&& __f, _Tp&& __t)
    { return __invfwd<_Tp>(__t).*__f; }
  template<typename _Res, typename _MemPtr, typename _Tp>
    constexpr _Res
    __invoke_impl(__invoke_memobj_deref, _MemPtr&& __f, _Tp&& __t)
    { return (*std::forward<_Tp>(__t)).*__f; }
  template<typename _Callable, typename... _Args>
    constexpr typename __invoke_result<_Callable, _Args...>::type
    __invoke(_Callable&& __fn, _Args&&... __args)
    noexcept(__is_nothrow_invocable<_Callable, _Args...>::value)
    {
      using __result = __invoke_result<_Callable, _Args...>;
      using __type = typename __result::type;
      using __tag = typename __result::__invoke_type;
      return std::__invoke_impl<__type>(__tag{}, std::forward<_Callable>(__fn),
     std::forward<_Args>(__args)...);
    }
  template<typename _Res, typename _Callable, typename... _Args>
    constexpr enable_if_t<is_invocable_r_v<_Res, _Callable, _Args...>, _Res>
    __invoke_r(_Callable&& __fn, _Args&&... __args)
    noexcept(is_nothrow_invocable_r_v<_Res, _Callable, _Args...>)
    {
      using __result = __invoke_result<_Callable, _Args...>;
      using __type = typename __result::type;
      using __tag = typename __result::__invoke_type;
      if constexpr (is_void_v<_Res>)
 std::__invoke_impl<__type>(__tag{}, std::forward<_Callable>(__fn),
     std::forward<_Args>(__args)...);
      else
 return std::__invoke_impl<__type>(__tag{},
       std::forward<_Callable>(__fn),
       std::forward<_Args>(__args)...);
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template<typename... _Elements>
    class tuple;
  template<typename _Tp>
    struct __is_empty_non_tuple : is_empty<_Tp> { };
  template<typename _El0, typename... _El>
    struct __is_empty_non_tuple<tuple<_El0, _El...>> : false_type { };
  template<typename _Tp>
    using __empty_not_final
    = typename conditional<__is_final(_Tp), false_type,
      __is_empty_non_tuple<_Tp>>::type;
  template<size_t _Idx, typename _Head,
    bool = __empty_not_final<_Head>::value>
    struct _Head_base;
  template<size_t _Idx, typename _Head>
    struct _Head_base<_Idx, _Head, true>
    {
      constexpr _Head_base()
      : _M_head_impl() { }
      constexpr _Head_base(const _Head& __h)
      : _M_head_impl(__h) { }
      constexpr _Head_base(const _Head_base&) = default;
      constexpr _Head_base(_Head_base&&) = default;
      template<typename _UHead>
 constexpr _Head_base(_UHead&& __h)
 : _M_head_impl(std::forward<_UHead>(__h)) { }
      _Head_base(allocator_arg_t, __uses_alloc0)
      : _M_head_impl() { }
      template<typename _Alloc>
 _Head_base(allocator_arg_t, __uses_alloc1<_Alloc> __a)
 : _M_head_impl(allocator_arg, *__a._M_a) { }
      template<typename _Alloc>
 _Head_base(allocator_arg_t, __uses_alloc2<_Alloc> __a)
 : _M_head_impl(*__a._M_a) { }
      template<typename _UHead>
 _Head_base(__uses_alloc0, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead)) { }
      template<typename _Alloc, typename _UHead>
 _Head_base(__uses_alloc1<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(allocator_arg, *__a._M_a, std::forward<_UHead>(__uhead))
 { }
      template<typename _Alloc, typename _UHead>
 _Head_base(__uses_alloc2<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead), *__a._M_a) { }
      static constexpr _Head&
      _M_head(_Head_base& __b) noexcept { return __b._M_head_impl; }
      static constexpr const _Head&
      _M_head(const _Head_base& __b) noexcept { return __b._M_head_impl; }
      [[__no_unique_address__]] _Head _M_head_impl;
    };
  template<size_t _Idx, typename _Head>
    struct _Head_base<_Idx, _Head, false>
    {
      constexpr _Head_base()
      : _M_head_impl() { }
      constexpr _Head_base(const _Head& __h)
      : _M_head_impl(__h) { }
      constexpr _Head_base(const _Head_base&) = default;
      constexpr _Head_base(_Head_base&&) = default;
      template<typename _UHead>
        constexpr _Head_base(_UHead&& __h)
 : _M_head_impl(std::forward<_UHead>(__h)) { }
      _Head_base(allocator_arg_t, __uses_alloc0)
      : _M_head_impl() { }
      template<typename _Alloc>
 _Head_base(allocator_arg_t, __uses_alloc1<_Alloc> __a)
 : _M_head_impl(allocator_arg, *__a._M_a) { }
      template<typename _Alloc>
 _Head_base(allocator_arg_t, __uses_alloc2<_Alloc> __a)
 : _M_head_impl(*__a._M_a) { }
      template<typename _UHead>
 _Head_base(__uses_alloc0, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead)) { }
      template<typename _Alloc, typename _UHead>
 _Head_base(__uses_alloc1<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(allocator_arg, *__a._M_a, std::forward<_UHead>(__uhead))
 { }
      template<typename _Alloc, typename _UHead>
 _Head_base(__uses_alloc2<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead), *__a._M_a) { }
      static constexpr _Head&
      _M_head(_Head_base& __b) noexcept { return __b._M_head_impl; }
      static constexpr const _Head&
      _M_head(const _Head_base& __b) noexcept { return __b._M_head_impl; }
      _Head _M_head_impl;
    };
  template<size_t _Idx, typename... _Elements>
    struct _Tuple_impl;
  template<size_t _Idx, typename _Head, typename... _Tail>
    struct _Tuple_impl<_Idx, _Head, _Tail...>
    : public _Tuple_impl<_Idx + 1, _Tail...>,
      private _Head_base<_Idx, _Head>
    {
      template<size_t, typename...> friend struct _Tuple_impl;
      typedef _Tuple_impl<_Idx + 1, _Tail...> _Inherited;
      typedef _Head_base<_Idx, _Head> _Base;
      static constexpr _Head&
      _M_head(_Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }
      static constexpr const _Head&
      _M_head(const _Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }
      static constexpr _Inherited&
      _M_tail(_Tuple_impl& __t) noexcept { return __t; }
      static constexpr const _Inherited&
      _M_tail(const _Tuple_impl& __t) noexcept { return __t; }
      constexpr _Tuple_impl()
      : _Inherited(), _Base() { }
      explicit constexpr
      _Tuple_impl(const _Head& __head, const _Tail&... __tail)
      : _Inherited(__tail...), _Base(__head)
      { }
      template<typename _UHead, typename... _UTail,
        typename = __enable_if_t<sizeof...(_Tail) == sizeof...(_UTail)>>
 explicit constexpr
 _Tuple_impl(_UHead&& __head, _UTail&&... __tail)
 : _Inherited(std::forward<_UTail>(__tail)...),
   _Base(std::forward<_UHead>(__head))
 { }
      constexpr _Tuple_impl(const _Tuple_impl&) = default;
      _Tuple_impl& operator=(const _Tuple_impl&) = delete;
      _Tuple_impl(_Tuple_impl&&) = default;
      template<typename... _UElements>
 constexpr
 _Tuple_impl(const _Tuple_impl<_Idx, _UElements...>& __in)
 : _Inherited(_Tuple_impl<_Idx, _UElements...>::_M_tail(__in)),
   _Base(_Tuple_impl<_Idx, _UElements...>::_M_head(__in))
 { }
      template<typename _UHead, typename... _UTails>
 constexpr
 _Tuple_impl(_Tuple_impl<_Idx, _UHead, _UTails...>&& __in)
 : _Inherited(std::move
       (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in))),
   _Base(std::forward<_UHead>
  (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in)))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a)
 : _Inherited(__tag, __a),
   _Base(__tag, __use_alloc<_Head>(__a))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Head& __head, const _Tail&... __tail)
 : _Inherited(__tag, __a, __tail...),
   _Base(__use_alloc<_Head, _Alloc, _Head>(__a), __head)
 { }
      template<typename _Alloc, typename _UHead, typename... _UTail,
        typename = __enable_if_t<sizeof...(_Tail) == sizeof...(_UTail)>>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _UHead&& __head, _UTail&&... __tail)
 : _Inherited(__tag, __a, std::forward<_UTail>(__tail)...),
   _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>(__head))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl& __in)
 : _Inherited(__tag, __a, _M_tail(__in)),
   _Base(__use_alloc<_Head, _Alloc, _Head>(__a), _M_head(__in))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl&& __in)
 : _Inherited(__tag, __a, std::move(_M_tail(__in))),
   _Base(__use_alloc<_Head, _Alloc, _Head>(__a),
  std::forward<_Head>(_M_head(__in)))
 { }
      template<typename _Alloc, typename _UHead, typename... _UTails>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl<_Idx, _UHead, _UTails...>& __in)
 : _Inherited(__tag, __a,
       _Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in)),
   _Base(__use_alloc<_Head, _Alloc, const _UHead&>(__a),
  _Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in))
 { }
      template<typename _Alloc, typename _UHead, typename... _UTails>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl<_Idx, _UHead, _UTails...>&& __in)
 : _Inherited(__tag, __a, std::move
       (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in))),
   _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>
  (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in)))
 { }
      template<typename... _UElements>
 void
 _M_assign(const _Tuple_impl<_Idx, _UElements...>& __in)
 {
   _M_head(*this) = _Tuple_impl<_Idx, _UElements...>::_M_head(__in);
   _M_tail(*this)._M_assign(
       _Tuple_impl<_Idx, _UElements...>::_M_tail(__in));
 }
      template<typename _UHead, typename... _UTails>
 void
 _M_assign(_Tuple_impl<_Idx, _UHead, _UTails...>&& __in)
 {
   _M_head(*this) = std::forward<_UHead>
     (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in));
   _M_tail(*this)._M_assign(
       std::move(_Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in)));
 }
    protected:
      void
      _M_swap(_Tuple_impl& __in)
      {
 using std::swap;
 swap(_M_head(*this), _M_head(__in));
 _Inherited::_M_swap(_M_tail(__in));
      }
    };
  template<size_t _Idx, typename _Head>
    struct _Tuple_impl<_Idx, _Head>
    : private _Head_base<_Idx, _Head>
    {
      template<size_t, typename...> friend struct _Tuple_impl;
      typedef _Head_base<_Idx, _Head> _Base;
      static constexpr _Head&
      _M_head(_Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }
      static constexpr const _Head&
      _M_head(const _Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }
      constexpr
      _Tuple_impl()
      : _Base() { }
      explicit constexpr
      _Tuple_impl(const _Head& __head)
      : _Base(__head)
      { }
      template<typename _UHead>
 explicit constexpr
 _Tuple_impl(_UHead&& __head)
 : _Base(std::forward<_UHead>(__head))
 { }
      constexpr _Tuple_impl(const _Tuple_impl&) = default;
      _Tuple_impl& operator=(const _Tuple_impl&) = delete;
      constexpr
      _Tuple_impl(_Tuple_impl&& __in)
      noexcept(is_nothrow_move_constructible<_Head>::value)
      : _Base(static_cast<_Base&&>(__in))
      { }
      template<typename _UHead>
 constexpr
 _Tuple_impl(const _Tuple_impl<_Idx, _UHead>& __in)
 : _Base(_Tuple_impl<_Idx, _UHead>::_M_head(__in))
 { }
      template<typename _UHead>
 constexpr
 _Tuple_impl(_Tuple_impl<_Idx, _UHead>&& __in)
 : _Base(std::forward<_UHead>(_Tuple_impl<_Idx, _UHead>::_M_head(__in)))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a)
 : _Base(__tag, __use_alloc<_Head>(__a))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Head& __head)
 : _Base(__use_alloc<_Head, _Alloc, const _Head&>(__a), __head)
 { }
      template<typename _Alloc, typename _UHead>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _UHead&& __head)
 : _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>(__head))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl& __in)
 : _Base(__use_alloc<_Head, _Alloc, const _Head&>(__a), _M_head(__in))
 { }
      template<typename _Alloc>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl&& __in)
 : _Base(__use_alloc<_Head, _Alloc, _Head>(__a),
  std::forward<_Head>(_M_head(__in)))
 { }
      template<typename _Alloc, typename _UHead>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl<_Idx, _UHead>& __in)
 : _Base(__use_alloc<_Head, _Alloc, const _UHead&>(__a),
  _Tuple_impl<_Idx, _UHead>::_M_head(__in))
 { }
      template<typename _Alloc, typename _UHead>
 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl<_Idx, _UHead>&& __in)
 : _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>(_Tuple_impl<_Idx, _UHead>::_M_head(__in)))
 { }
      template<typename _UHead>
 void
 _M_assign(const _Tuple_impl<_Idx, _UHead>& __in)
 {
   _M_head(*this) = _Tuple_impl<_Idx, _UHead>::_M_head(__in);
 }
      template<typename _UHead>
 void
 _M_assign(_Tuple_impl<_Idx, _UHead>&& __in)
 {
   _M_head(*this)
     = std::forward<_UHead>(_Tuple_impl<_Idx, _UHead>::_M_head(__in));
 }
    protected:
      void
      _M_swap(_Tuple_impl& __in)
      {
 using std::swap;
 swap(_M_head(*this), _M_head(__in));
      }
    };
  template<bool, typename... _Types>
    struct _TupleConstraints
    {
      template<typename... _UTypes>
 static constexpr bool __is_implicitly_constructible()
 {
   return __and_<is_constructible<_Types, _UTypes>...,
   is_convertible<_UTypes, _Types>...
   >::value;
 }
      template<typename... _UTypes>
 static constexpr bool __is_explicitly_constructible()
 {
   return __and_<is_constructible<_Types, _UTypes>...,
   __not_<__and_<is_convertible<_UTypes, _Types>...>>
   >::value;
 }
      static constexpr bool __is_implicitly_default_constructible()
      {
 return __and_<std::__is_implicitly_default_constructible<_Types>...
        >::value;
      }
      static constexpr bool __is_explicitly_default_constructible()
      {
 return __and_<is_default_constructible<_Types>...,
        __not_<__and_<
   std::__is_implicitly_default_constructible<_Types>...>
        >>::value;
      }
    };
  template<typename... _Types>
    struct _TupleConstraints<false, _Types...>
    {
      template<typename... _UTypes>
 static constexpr bool __is_implicitly_constructible()
 { return false; }
      template<typename... _UTypes>
 static constexpr bool __is_explicitly_constructible()
 { return false; }
    };
  template<typename... _Elements>
    class tuple : public _Tuple_impl<0, _Elements...>
    {
      typedef _Tuple_impl<0, _Elements...> _Inherited;
      template<bool _Cond>
 using _TCC = _TupleConstraints<_Cond, _Elements...>;
      template<bool _Dummy>
 using _ImplicitDefaultCtor = __enable_if_t<
   _TCC<_Dummy>::__is_implicitly_default_constructible(),
   bool>;
      template<bool _Dummy>
 using _ExplicitDefaultCtor = __enable_if_t<
   _TCC<_Dummy>::__is_explicitly_default_constructible(),
   bool>;
      template<bool _Cond, typename... _Args>
 using _ImplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_implicitly_constructible<_Args...>(),
   bool>;
      template<bool _Cond, typename... _Args>
 using _ExplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_explicitly_constructible<_Args...>(),
   bool>;
      template<typename... _UElements>
 static constexpr
 __enable_if_t<sizeof...(_UElements) == sizeof...(_Elements), bool>
 __assignable()
 { return __and_<is_assignable<_Elements&, _UElements>...>::value; }
      template<typename... _UElements>
 static constexpr bool __nothrow_assignable()
 {
   return
     __and_<is_nothrow_assignable<_Elements&, _UElements>...>::value;
 }
      template<typename... _UElements>
 static constexpr bool __nothrow_constructible()
 {
   return
     __and_<is_nothrow_constructible<_Elements, _UElements>...>::value;
 }
      template<typename _Up>
 static constexpr bool __valid_args()
 {
   return sizeof...(_Elements) == 1
     && !is_same<tuple, __remove_cvref_t<_Up>>::value;
 }
      template<typename, typename, typename... _Tail>
 static constexpr bool __valid_args()
 { return (sizeof...(_Tail) + 2) == sizeof...(_Elements); }
      template<typename _Tuple, typename = tuple,
        typename = __remove_cvref_t<_Tuple>>
 struct _UseOtherCtor
 : false_type
 { };
      template<typename _Tuple, typename _Tp, typename _Up>
 struct _UseOtherCtor<_Tuple, tuple<_Tp>, tuple<_Up>>
 : __or_<is_convertible<_Tuple, _Tp>, is_constructible<_Tp, _Tuple>>
 { };
      template<typename _Tuple, typename _Tp>
 struct _UseOtherCtor<_Tuple, tuple<_Tp>, tuple<_Tp>>
 : true_type
 { };
      template<typename _Tuple>
 static constexpr bool __use_other_ctor()
 { return _UseOtherCtor<_Tuple>::value; }
    public:
      template<typename _Dummy = void,
        _ImplicitDefaultCtor<is_void<_Dummy>::value> = true>
 constexpr
 tuple()
 noexcept(__and_<is_nothrow_default_constructible<_Elements>...>::value)
 : _Inherited() { }
      template<typename _Dummy = void,
        _ExplicitDefaultCtor<is_void<_Dummy>::value> = false>
 explicit constexpr
 tuple()
 noexcept(__and_<is_nothrow_default_constructible<_Elements>...>::value)
 : _Inherited() { }
      template<bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ImplicitCtor<_NotEmpty, const _Elements&...> = true>
 constexpr
 tuple(const _Elements&... __elements)
 noexcept(__nothrow_constructible<const _Elements&...>())
 : _Inherited(__elements...) { }
      template<bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ExplicitCtor<_NotEmpty, const _Elements&...> = false>
 explicit constexpr
 tuple(const _Elements&... __elements)
 noexcept(__nothrow_constructible<const _Elements&...>())
 : _Inherited(__elements...) { }
      template<typename... _UElements,
        bool _Valid = __valid_args<_UElements...>(),
        _ImplicitCtor<_Valid, _UElements...> = true>
 constexpr
 tuple(_UElements&&... __elements)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(std::forward<_UElements>(__elements)...) { }
      template<typename... _UElements,
        bool _Valid = __valid_args<_UElements...>(),
        _ExplicitCtor<_Valid, _UElements...> = false>
 explicit constexpr
 tuple(_UElements&&... __elements)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(std::forward<_UElements>(__elements)...) { }
      constexpr tuple(const tuple&) = default;
      constexpr tuple(tuple&&) = default;
      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
      && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ImplicitCtor<_Valid, const _UElements&...> = true>
 constexpr
 tuple(const tuple<_UElements...>& __in)
 noexcept(__nothrow_constructible<const _UElements&...>())
 : _Inherited(static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }
      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
      && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ExplicitCtor<_Valid, const _UElements&...> = false>
 explicit constexpr
 tuple(const tuple<_UElements...>& __in)
 noexcept(__nothrow_constructible<const _UElements&...>())
 : _Inherited(static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }
      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ImplicitCtor<_Valid, _UElements...> = true>
 constexpr
 tuple(tuple<_UElements...>&& __in)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(static_cast<_Tuple_impl<0, _UElements...>&&>(__in)) { }
      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ExplicitCtor<_Valid, _UElements...> = false>
 explicit constexpr
 tuple(tuple<_UElements...>&& __in)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(static_cast<_Tuple_impl<0, _UElements...>&&>(__in)) { }
      template<typename _Alloc,
        _ImplicitDefaultCtor<is_object<_Alloc>::value> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a)
 : _Inherited(__tag, __a) { }
      template<typename _Alloc, bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ImplicitCtor<_NotEmpty, const _Elements&...> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _Elements&... __elements)
 : _Inherited(__tag, __a, __elements...) { }
      template<typename _Alloc, bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ExplicitCtor<_NotEmpty, const _Elements&...> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _Elements&... __elements)
 : _Inherited(__tag, __a, __elements...) { }
      template<typename _Alloc, typename... _UElements,
        bool _Valid = __valid_args<_UElements...>(),
        _ImplicitCtor<_Valid, _UElements...> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       _UElements&&... __elements)
 : _Inherited(__tag, __a, std::forward<_UElements>(__elements)...)
 { }
      template<typename _Alloc, typename... _UElements,
   bool _Valid = __valid_args<_UElements...>(),
        _ExplicitCtor<_Valid, _UElements...> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       _UElements&&... __elements)
 : _Inherited(__tag, __a, std::forward<_UElements>(__elements)...)
 { }
      template<typename _Alloc>
 tuple(allocator_arg_t __tag, const _Alloc& __a, const tuple& __in)
 : _Inherited(__tag, __a, static_cast<const _Inherited&>(__in)) { }
      template<typename _Alloc>
 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple&& __in)
 : _Inherited(__tag, __a, static_cast<_Inherited&&>(__in)) { }
      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ImplicitCtor<_Valid, const _UElements&...> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_UElements...>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }
      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ExplicitCtor<_Valid, const _UElements&...> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_UElements...>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }
      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ImplicitCtor<_Valid, _UElements...> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       tuple<_UElements...>&& __in)
 : _Inherited(__tag, __a,
              static_cast<_Tuple_impl<0, _UElements...>&&>(__in))
 { }
      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ExplicitCtor<_Valid, _UElements...> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       tuple<_UElements...>&& __in)
 : _Inherited(__tag, __a,
              static_cast<_Tuple_impl<0, _UElements...>&&>(__in))
 { }
      tuple&
      operator=(typename conditional<__assignable<const _Elements&...>(),
         const tuple&,
         const __nonesuch&>::type __in)
      noexcept(__nothrow_assignable<const _Elements&...>())
      {
 this->_M_assign(__in);
 return *this;
      }
      tuple&
      operator=(typename conditional<__assignable<_Elements...>(),
         tuple&&,
         __nonesuch&&>::type __in)
      noexcept(__nothrow_assignable<_Elements...>())
      {
 this->_M_assign(std::move(__in));
 return *this;
      }
      template<typename... _UElements>
 __enable_if_t<__assignable<const _UElements&...>(), tuple&>
 operator=(const tuple<_UElements...>& __in)
 noexcept(__nothrow_assignable<const _UElements&...>())
 {
   this->_M_assign(__in);
   return *this;
 }
      template<typename... _UElements>
 __enable_if_t<__assignable<_UElements...>(), tuple&>
 operator=(tuple<_UElements...>&& __in)
 noexcept(__nothrow_assignable<_UElements...>())
 {
   this->_M_assign(std::move(__in));
   return *this;
 }
      void
      swap(tuple& __in)
      noexcept(__and_<__is_nothrow_swappable<_Elements>...>::value)
      { _Inherited::_M_swap(__in); }
    };
  template<typename... _UTypes>
    tuple(_UTypes...) -> tuple<_UTypes...>;
  template<typename _T1, typename _T2>
    tuple(pair<_T1, _T2>) -> tuple<_T1, _T2>;
  template<typename _Alloc, typename... _UTypes>
    tuple(allocator_arg_t, _Alloc, _UTypes...) -> tuple<_UTypes...>;
  template<typename _Alloc, typename _T1, typename _T2>
    tuple(allocator_arg_t, _Alloc, pair<_T1, _T2>) -> tuple<_T1, _T2>;
  template<typename _Alloc, typename... _UTypes>
    tuple(allocator_arg_t, _Alloc, tuple<_UTypes...>) -> tuple<_UTypes...>;
  template<>
    class tuple<>
    {
    public:
      void swap(tuple&) noexcept { }
      tuple() = default;
      template<typename _Alloc>
 tuple(allocator_arg_t, const _Alloc&) noexcept { }
      template<typename _Alloc>
 tuple(allocator_arg_t, const _Alloc&, const tuple&) noexcept { }
    };
  template<typename _T1, typename _T2>
    class tuple<_T1, _T2> : public _Tuple_impl<0, _T1, _T2>
    {
      typedef _Tuple_impl<0, _T1, _T2> _Inherited;
      template<bool _Dummy, typename _U1, typename _U2>
 using _ImplicitDefaultCtor = __enable_if_t<
   _TupleConstraints<_Dummy, _U1, _U2>::
     __is_implicitly_default_constructible(),
   bool>;
      template<bool _Dummy, typename _U1, typename _U2>
 using _ExplicitDefaultCtor = __enable_if_t<
   _TupleConstraints<_Dummy, _U1, _U2>::
     __is_explicitly_default_constructible(),
   bool>;
      template<bool _Dummy>
 using _TCC = _TupleConstraints<_Dummy, _T1, _T2>;
      template<bool _Cond, typename _U1, typename _U2>
 using _ImplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_implicitly_constructible<_U1, _U2>(),
   bool>;
      template<bool _Cond, typename _U1, typename _U2>
 using _ExplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_explicitly_constructible<_U1, _U2>(),
   bool>;
      template<typename _U1, typename _U2>
 static constexpr bool __assignable()
 {
   return __and_<is_assignable<_T1&, _U1>,
   is_assignable<_T2&, _U2>>::value;
 }
      template<typename _U1, typename _U2>
 static constexpr bool __nothrow_assignable()
 {
   return __and_<is_nothrow_assignable<_T1&, _U1>,
   is_nothrow_assignable<_T2&, _U2>>::value;
 }
      template<typename _U1, typename _U2>
 static constexpr bool __nothrow_constructible()
 {
   return __and_<is_nothrow_constructible<_T1, _U1>,
       is_nothrow_constructible<_T2, _U2>>::value;
 }
      static constexpr bool __nothrow_default_constructible()
      {
 return __and_<is_nothrow_default_constructible<_T1>,
        is_nothrow_default_constructible<_T2>>::value;
      }
      template<typename _U1>
 static constexpr bool __is_alloc_arg()
 { return is_same<__remove_cvref_t<_U1>, allocator_arg_t>::value; }
    public:
      template<bool _Dummy = true,
        _ImplicitDefaultCtor<_Dummy, _T1, _T2> = true>
 constexpr
 tuple()
 noexcept(__nothrow_default_constructible())
 : _Inherited() { }
      template<bool _Dummy = true,
        _ExplicitDefaultCtor<_Dummy, _T1, _T2> = false>
 explicit constexpr
 tuple()
 noexcept(__nothrow_default_constructible())
 : _Inherited() { }
      template<bool _Dummy = true,
        _ImplicitCtor<_Dummy, const _T1&, const _T2&> = true>
 constexpr
 tuple(const _T1& __a1, const _T2& __a2)
 noexcept(__nothrow_constructible<const _T1&, const _T2&>())
 : _Inherited(__a1, __a2) { }
      template<bool _Dummy = true,
        _ExplicitCtor<_Dummy, const _T1&, const _T2&> = false>
 explicit constexpr
 tuple(const _T1& __a1, const _T2& __a2)
 noexcept(__nothrow_constructible<const _T1&, const _T2&>())
 : _Inherited(__a1, __a2) { }
      template<typename _U1, typename _U2,
        _ImplicitCtor<!__is_alloc_arg<_U1>(), _U1, _U2> = true>
 constexpr
 tuple(_U1&& __a1, _U2&& __a2)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__a1), std::forward<_U2>(__a2)) { }
      template<typename _U1, typename _U2,
        _ExplicitCtor<!__is_alloc_arg<_U1>(), _U1, _U2> = false>
 explicit constexpr
 tuple(_U1&& __a1, _U2&& __a2)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__a1), std::forward<_U2>(__a2)) { }
      constexpr tuple(const tuple&) = default;
      constexpr tuple(tuple&&) = default;
      template<typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>
 constexpr
 tuple(const tuple<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in)) { }
      template<typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit constexpr
 tuple(const tuple<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in)) { }
      template<typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 constexpr
 tuple(tuple<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in)) { }
      template<typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit constexpr
 tuple(tuple<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in)) { }
      template<typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>
 constexpr
 tuple(const pair<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(__in.first, __in.second) { }
      template<typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit constexpr
 tuple(const pair<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(__in.first, __in.second) { }
      template<typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 constexpr
 tuple(pair<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }
      template<typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit constexpr
 tuple(pair<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }
      template<typename _Alloc,
        _ImplicitDefaultCtor<is_object<_Alloc>::value, _T1, _T2> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a)
 : _Inherited(__tag, __a) { }
      template<typename _Alloc, bool _Dummy = true,
        _ImplicitCtor<_Dummy, const _T1&, const _T2&> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _T1& __a1, const _T2& __a2)
 : _Inherited(__tag, __a, __a1, __a2) { }
      template<typename _Alloc, bool _Dummy = true,
        _ExplicitCtor<_Dummy, const _T1&, const _T2&> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _T1& __a1, const _T2& __a2)
 : _Inherited(__tag, __a, __a1, __a2) { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a, _U1&& __a1, _U2&& __a2)
 : _Inherited(__tag, __a, std::forward<_U1>(__a1),
              std::forward<_U2>(__a2)) { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       _U1&& __a1, _U2&& __a2)
 : _Inherited(__tag, __a, std::forward<_U1>(__a1),
              std::forward<_U2>(__a2)) { }
      template<typename _Alloc>
 tuple(allocator_arg_t __tag, const _Alloc& __a, const tuple& __in)
 : _Inherited(__tag, __a, static_cast<const _Inherited&>(__in)) { }
      template<typename _Alloc>
 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple&& __in)
 : _Inherited(__tag, __a, static_cast<_Inherited&&>(__in)) { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_U1, _U2>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in))
 { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_U1, _U2>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in))
 { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in))
 { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in))
 { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const pair<_U1, _U2>& __in)
 : _Inherited(__tag, __a, __in.first, __in.second) { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const pair<_U1, _U2>& __in)
 : _Inherited(__tag, __a, __in.first, __in.second) { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 tuple(allocator_arg_t __tag, const _Alloc& __a, pair<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }
      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a, pair<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }
      tuple&
      operator=(typename conditional<__assignable<const _T1&, const _T2&>(),
         const tuple&,
         const __nonesuch&>::type __in)
      noexcept(__nothrow_assignable<const _T1&, const _T2&>())
      {
 this->_M_assign(__in);
 return *this;
      }
      tuple&
      operator=(typename conditional<__assignable<_T1, _T2>(),
         tuple&&,
         __nonesuch&&>::type __in)
      noexcept(__nothrow_assignable<_T1, _T2>())
      {
 this->_M_assign(std::move(__in));
 return *this;
      }
      template<typename _U1, typename _U2>
 __enable_if_t<__assignable<const _U1&, const _U2&>(), tuple&>
 operator=(const tuple<_U1, _U2>& __in)
 noexcept(__nothrow_assignable<const _U1&, const _U2&>())
 {
   this->_M_assign(__in);
   return *this;
 }
      template<typename _U1, typename _U2>
 __enable_if_t<__assignable<_U1, _U2>(), tuple&>
 operator=(tuple<_U1, _U2>&& __in)
 noexcept(__nothrow_assignable<_U1, _U2>())
 {
   this->_M_assign(std::move(__in));
   return *this;
 }
      template<typename _U1, typename _U2>
 __enable_if_t<__assignable<const _U1&, const _U2&>(), tuple&>
 operator=(const pair<_U1, _U2>& __in)
 noexcept(__nothrow_assignable<const _U1&, const _U2&>())
 {
   this->_M_head(*this) = __in.first;
   this->_M_tail(*this)._M_head(*this) = __in.second;
   return *this;
 }
      template<typename _U1, typename _U2>
 __enable_if_t<__assignable<_U1, _U2>(), tuple&>
 operator=(pair<_U1, _U2>&& __in)
 noexcept(__nothrow_assignable<_U1, _U2>())
 {
   this->_M_head(*this) = std::forward<_U1>(__in.first);
   this->_M_tail(*this)._M_head(*this) = std::forward<_U2>(__in.second);
   return *this;
 }
      void
      swap(tuple& __in)
      noexcept(__and_<__is_nothrow_swappable<_T1>,
        __is_nothrow_swappable<_T2>>::value)
      { _Inherited::_M_swap(__in); }
    };
  template<typename... _Elements>
    struct tuple_size<tuple<_Elements...>>
    : public integral_constant<size_t, sizeof...(_Elements)> { };
  template <typename _Tp>
    inline constexpr size_t tuple_size_v = tuple_size<_Tp>::value;
  template<size_t __i, typename _Head, typename... _Tail>
    struct tuple_element<__i, tuple<_Head, _Tail...> >
    : tuple_element<__i - 1, tuple<_Tail...> > { };
  template<typename _Head, typename... _Tail>
    struct tuple_element<0, tuple<_Head, _Tail...> >
    {
      typedef _Head type;
    };
  template<size_t __i>
    struct tuple_element<__i, tuple<>>
    {
      static_assert(__i < tuple_size<tuple<>>::value,
   "tuple index must be in range");
    };
  template<size_t __i, typename _Head, typename... _Tail>
    constexpr _Head&
    __get_helper(_Tuple_impl<__i, _Head, _Tail...>& __t) noexcept
    { return _Tuple_impl<__i, _Head, _Tail...>::_M_head(__t); }
  template<size_t __i, typename _Head, typename... _Tail>
    constexpr const _Head&
    __get_helper(const _Tuple_impl<__i, _Head, _Tail...>& __t) noexcept
    { return _Tuple_impl<__i, _Head, _Tail...>::_M_head(__t); }
  template<size_t __i, typename... _Types>
    __enable_if_t<(__i >= sizeof...(_Types))>
    __get_helper(const tuple<_Types...>&) = delete;
  template<size_t __i, typename... _Elements>
    constexpr __tuple_element_t<__i, tuple<_Elements...>>&
    get(tuple<_Elements...>& __t) noexcept
    { return std::__get_helper<__i>(__t); }
  template<size_t __i, typename... _Elements>
    constexpr const __tuple_element_t<__i, tuple<_Elements...>>&
    get(const tuple<_Elements...>& __t) noexcept
    { return std::__get_helper<__i>(__t); }
  template<size_t __i, typename... _Elements>
    constexpr __tuple_element_t<__i, tuple<_Elements...>>&&
    get(tuple<_Elements...>&& __t) noexcept
    {
      typedef __tuple_element_t<__i, tuple<_Elements...>> __element_type;
      return std::forward<__element_type>(std::__get_helper<__i>(__t));
    }
  template<size_t __i, typename... _Elements>
    constexpr const __tuple_element_t<__i, tuple<_Elements...>>&&
    get(const tuple<_Elements...>&& __t) noexcept
    {
      typedef __tuple_element_t<__i, tuple<_Elements...>> __element_type;
      return std::forward<const __element_type>(std::__get_helper<__i>(__t));
    }
  template<typename _Tp, typename... _Types>
    constexpr size_t
    __find_uniq_type_in_pack()
    {
      constexpr size_t __sz = sizeof...(_Types);
      constexpr bool __found[__sz] = { __is_same(_Tp, _Types) ... };
      size_t __n = __sz;
      for (size_t __i = 0; __i < __sz; ++__i)
 {
   if (__found[__i])
     {
       if (__n < __sz)
  return __sz;
       __n = __i;
     }
 }
      return __n;
    }
  template <typename _Tp, typename... _Types>
    constexpr _Tp&
    get(tuple<_Types...>& __t) noexcept
    {
      constexpr size_t __idx = __find_uniq_type_in_pack<_Tp, _Types...>();
      static_assert(__idx < sizeof...(_Types),
   "the type T in std::get<T> must occur exactly once in the tuple");
      return std::__get_helper<__idx>(__t);
    }
  template <typename _Tp, typename... _Types>
    constexpr _Tp&&
    get(tuple<_Types...>&& __t) noexcept
    {
      constexpr size_t __idx = __find_uniq_type_in_pack<_Tp, _Types...>();
      static_assert(__idx < sizeof...(_Types),
   "the type T in std::get<T> must occur exactly once in the tuple");
      return std::forward<_Tp>(std::__get_helper<__idx>(__t));
    }
  template <typename _Tp, typename... _Types>
    constexpr const _Tp&
    get(const tuple<_Types...>& __t) noexcept
    {
      constexpr size_t __idx = __find_uniq_type_in_pack<_Tp, _Types...>();
      static_assert(__idx < sizeof...(_Types),
   "the type T in std::get<T> must occur exactly once in the tuple");
      return std::__get_helper<__idx>(__t);
    }
  template <typename _Tp, typename... _Types>
    constexpr const _Tp&&
    get(const tuple<_Types...>&& __t) noexcept
    {
      constexpr size_t __idx = __find_uniq_type_in_pack<_Tp, _Types...>();
      static_assert(__idx < sizeof...(_Types),
   "the type T in std::get<T> must occur exactly once in the tuple");
      return std::forward<const _Tp>(std::__get_helper<__idx>(__t));
    }
  template<typename _Tp, typename _Up, size_t __i, size_t __size>
    struct __tuple_compare
    {
      static constexpr bool
      __eq(const _Tp& __t, const _Up& __u)
      {
 return bool(std::get<__i>(__t) == std::get<__i>(__u))
   && __tuple_compare<_Tp, _Up, __i + 1, __size>::__eq(__t, __u);
      }
      static constexpr bool
      __less(const _Tp& __t, const _Up& __u)
      {
 return bool(std::get<__i>(__t) < std::get<__i>(__u))
   || (!bool(std::get<__i>(__u) < std::get<__i>(__t))
       && __tuple_compare<_Tp, _Up, __i + 1, __size>::__less(__t, __u));
      }
    };
  template<typename _Tp, typename _Up, size_t __size>
    struct __tuple_compare<_Tp, _Up, __size, __size>
    {
      static constexpr bool
      __eq(const _Tp&, const _Up&) { return true; }
      static constexpr bool
      __less(const _Tp&, const _Up&) { return false; }
    };
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator==(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    {
      static_assert(sizeof...(_TElements) == sizeof...(_UElements),
   "tuple objects can only be compared if they have equal sizes.");
      using __compare = __tuple_compare<tuple<_TElements...>,
     tuple<_UElements...>,
     0, sizeof...(_TElements)>;
      return __compare::__eq(__t, __u);
    }
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator<(const tuple<_TElements...>& __t,
       const tuple<_UElements...>& __u)
    {
      static_assert(sizeof...(_TElements) == sizeof...(_UElements),
   "tuple objects can only be compared if they have equal sizes.");
      using __compare = __tuple_compare<tuple<_TElements...>,
     tuple<_UElements...>,
     0, sizeof...(_TElements)>;
      return __compare::__less(__t, __u);
    }
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator!=(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    { return !(__t == __u); }
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator>(const tuple<_TElements...>& __t,
       const tuple<_UElements...>& __u)
    { return __u < __t; }
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator<=(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    { return !(__u < __t); }
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator>=(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    { return !(__t < __u); }
  template<typename... _Elements>
    constexpr tuple<typename __decay_and_strip<_Elements>::__type...>
    make_tuple(_Elements&&... __args)
    {
      typedef tuple<typename __decay_and_strip<_Elements>::__type...>
 __result_type;
      return __result_type(std::forward<_Elements>(__args)...);
    }
  template<typename... _Elements>
    constexpr tuple<_Elements&&...>
    forward_as_tuple(_Elements&&... __args) noexcept
    { return tuple<_Elements&&...>(std::forward<_Elements>(__args)...); }
  template<size_t, typename, typename, size_t>
    struct __make_tuple_impl;
  template<size_t _Idx, typename _Tuple, typename... _Tp, size_t _Nm>
    struct __make_tuple_impl<_Idx, tuple<_Tp...>, _Tuple, _Nm>
    : __make_tuple_impl<_Idx + 1,
   tuple<_Tp..., __tuple_element_t<_Idx, _Tuple>>,
   _Tuple, _Nm>
    { };
  template<size_t _Nm, typename _Tuple, typename... _Tp>
    struct __make_tuple_impl<_Nm, tuple<_Tp...>, _Tuple, _Nm>
    {
      typedef tuple<_Tp...> __type;
    };
  template<typename _Tuple>
    struct __do_make_tuple
    : __make_tuple_impl<0, tuple<>, _Tuple, tuple_size<_Tuple>::value>
    { };
  template<typename _Tuple>
    struct __make_tuple
    : public __do_make_tuple<__remove_cvref_t<_Tuple>>
    { };
  template<typename...>
    struct __combine_tuples;
  template<>
    struct __combine_tuples<>
    {
      typedef tuple<> __type;
    };
  template<typename... _Ts>
    struct __combine_tuples<tuple<_Ts...>>
    {
      typedef tuple<_Ts...> __type;
    };
  template<typename... _T1s, typename... _T2s, typename... _Rem>
    struct __combine_tuples<tuple<_T1s...>, tuple<_T2s...>, _Rem...>
    {
      typedef typename __combine_tuples<tuple<_T1s..., _T2s...>,
     _Rem...>::__type __type;
    };
  template<typename... _Tpls>
    struct __tuple_cat_result
    {
      typedef typename __combine_tuples
        <typename __make_tuple<_Tpls>::__type...>::__type __type;
    };
  template<typename...>
    struct __make_1st_indices;
  template<>
    struct __make_1st_indices<>
    {
      typedef _Index_tuple<> __type;
    };
  template<typename _Tp, typename... _Tpls>
    struct __make_1st_indices<_Tp, _Tpls...>
    {
      typedef typename _Build_index_tuple<tuple_size<
 typename remove_reference<_Tp>::type>::value>::__type __type;
    };
  template<typename _Ret, typename _Indices, typename... _Tpls>
    struct __tuple_concater;
  template<typename _Ret, size_t... _Is, typename _Tp, typename... _Tpls>
    struct __tuple_concater<_Ret, _Index_tuple<_Is...>, _Tp, _Tpls...>
    {
      template<typename... _Us>
        static constexpr _Ret
        _S_do(_Tp&& __tp, _Tpls&&... __tps, _Us&&... __us)
        {
   typedef typename __make_1st_indices<_Tpls...>::__type __idx;
   typedef __tuple_concater<_Ret, __idx, _Tpls...> __next;
   return __next::_S_do(std::forward<_Tpls>(__tps)...,
          std::forward<_Us>(__us)...,
          std::get<_Is>(std::forward<_Tp>(__tp))...);
 }
    };
  template<typename _Ret>
    struct __tuple_concater<_Ret, _Index_tuple<>>
    {
      template<typename... _Us>
 static constexpr _Ret
 _S_do(_Us&&... __us)
        {
   return _Ret(std::forward<_Us>(__us)...);
 }
    };
  template<typename... _Tpls, typename = typename
           enable_if<__and_<__is_tuple_like<_Tpls>...>::value>::type>
    constexpr auto
    tuple_cat(_Tpls&&... __tpls)
    -> typename __tuple_cat_result<_Tpls...>::__type
    {
      typedef typename __tuple_cat_result<_Tpls...>::__type __ret;
      typedef typename __make_1st_indices<_Tpls...>::__type __idx;
      typedef __tuple_concater<__ret, __idx, _Tpls...> __concater;
      return __concater::_S_do(std::forward<_Tpls>(__tpls)...);
    }
  template<typename... _Elements>
    constexpr tuple<_Elements&...>
    tie(_Elements&... __args) noexcept
    { return tuple<_Elements&...>(__args...); }
  template<typename... _Elements>
    inline
    typename enable_if<__and_<__is_swappable<_Elements>...>::value
      >::type
    swap(tuple<_Elements...>& __x, tuple<_Elements...>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
  template<typename... _Elements>
    typename enable_if<!__and_<__is_swappable<_Elements>...>::value>::type
    swap(tuple<_Elements...>&, tuple<_Elements...>&) = delete;
  struct _Swallow_assign
  {
    template<class _Tp>
      constexpr const _Swallow_assign&
      operator=(const _Tp&) const
      { return *this; }
  };
  inline constexpr _Swallow_assign ignore{};
  template<typename... _Types, typename _Alloc>
    struct uses_allocator<tuple<_Types...>, _Alloc> : true_type { };
  template<class _T1, class _T2>
    template<typename... _Args1, typename... _Args2>
      inline
      pair<_T1, _T2>::
      pair(piecewise_construct_t,
    tuple<_Args1...> __first, tuple<_Args2...> __second)
      : pair(__first, __second,
      typename _Build_index_tuple<sizeof...(_Args1)>::__type(),
      typename _Build_index_tuple<sizeof...(_Args2)>::__type())
      { }
  template<class _T1, class _T2>
    template<typename... _Args1, size_t... _Indexes1,
      typename... _Args2, size_t... _Indexes2>
                           inline
      pair<_T1, _T2>::
      pair(tuple<_Args1...>& __tuple1, tuple<_Args2...>& __tuple2,
    _Index_tuple<_Indexes1...>, _Index_tuple<_Indexes2...>)
      : first(std::forward<_Args1>(std::get<_Indexes1>(__tuple1))...),
 second(std::forward<_Args2>(std::get<_Indexes2>(__tuple2))...)
      { }
  template<template<typename...> class _Trait, typename _Tp, typename _Tuple>
    inline constexpr bool __unpack_std_tuple = false;
  template<template<typename...> class _Trait, typename _Tp, typename... _Up>
    inline constexpr bool __unpack_std_tuple<_Trait, _Tp, tuple<_Up...>>
      = _Trait<_Tp, _Up...>::value;
  template<template<typename...> class _Trait, typename _Tp, typename... _Up>
    inline constexpr bool __unpack_std_tuple<_Trait, _Tp, tuple<_Up...>&>
      = _Trait<_Tp, _Up&...>::value;
  template<template<typename...> class _Trait, typename _Tp, typename... _Up>
    inline constexpr bool __unpack_std_tuple<_Trait, _Tp, const tuple<_Up...>>
      = _Trait<_Tp, const _Up...>::value;
  template<template<typename...> class _Trait, typename _Tp, typename... _Up>
    inline constexpr bool __unpack_std_tuple<_Trait, _Tp, const tuple<_Up...>&>
      = _Trait<_Tp, const _Up&...>::value;
  template <typename _Fn, typename _Tuple, size_t... _Idx>
    constexpr decltype(auto)
    __apply_impl(_Fn&& __f, _Tuple&& __t, index_sequence<_Idx...>)
    {
      return std::__invoke(std::forward<_Fn>(__f),
      std::get<_Idx>(std::forward<_Tuple>(__t))...);
    }
  template <typename _Fn, typename _Tuple>
    constexpr decltype(auto)
    apply(_Fn&& __f, _Tuple&& __t)
    noexcept(__unpack_std_tuple<is_nothrow_invocable, _Fn, _Tuple>)
    {
      using _Indices
 = make_index_sequence<tuple_size_v<remove_reference_t<_Tuple>>>;
      return std::__apply_impl(std::forward<_Fn>(__f),
          std::forward<_Tuple>(__t),
          _Indices{});
    }
  template <typename _Tp, typename _Tuple, size_t... _Idx>
    constexpr _Tp
    __make_from_tuple_impl(_Tuple&& __t, index_sequence<_Idx...>)
    { return _Tp(std::get<_Idx>(std::forward<_Tuple>(__t))...); }
  template <typename _Tp, typename _Tuple>
    constexpr _Tp
    make_from_tuple(_Tuple&& __t)
    noexcept(__unpack_std_tuple<is_nothrow_constructible, _Tp, _Tuple>)
    {
      return __make_from_tuple_impl<_Tp>(
        std::forward<_Tuple>(__t),
 make_index_sequence<tuple_size_v<remove_reference_t<_Tuple>>>{});
    }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template <typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    class multimap;
  template <typename _Key, typename _Tp, typename _Compare = std::less<_Key>,
     typename _Alloc = std::allocator<std::pair<const _Key, _Tp> > >
    class map
    {
    public:
      typedef _Key key_type;
      typedef _Tp mapped_type;
      typedef std::pair<const _Key, _Tp> value_type;
      typedef _Compare key_compare;
      typedef _Alloc allocator_type;
    private:
    public:
      class value_compare
      : public std::binary_function<value_type, value_type, bool>
      {
 friend class map<_Key, _Tp, _Compare, _Alloc>;
      protected:
 _Compare comp;
 value_compare(_Compare __c)
 : comp(__c) { }
      public:
 bool operator()(const value_type& __x, const value_type& __y) const
 { return comp(__x.first, __y.first); }
      };
    private:
      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
 rebind<value_type>::other _Pair_alloc_type;
      typedef _Rb_tree<key_type, value_type, _Select1st<value_type>,
         key_compare, _Pair_alloc_type> _Rep_type;
      _Rep_type _M_t;
      typedef __gnu_cxx::__alloc_traits<_Pair_alloc_type> _Alloc_traits;
    public:
      typedef typename _Alloc_traits::pointer pointer;
      typedef typename _Alloc_traits::const_pointer const_pointer;
      typedef typename _Alloc_traits::reference reference;
      typedef typename _Alloc_traits::const_reference const_reference;
      typedef typename _Rep_type::iterator iterator;
      typedef typename _Rep_type::const_iterator const_iterator;
      typedef typename _Rep_type::size_type size_type;
      typedef typename _Rep_type::difference_type difference_type;
      typedef typename _Rep_type::reverse_iterator reverse_iterator;
      typedef typename _Rep_type::const_reverse_iterator const_reverse_iterator;
      using node_type = typename _Rep_type::node_type;
      using insert_return_type = typename _Rep_type::insert_return_type;
      map() = default;
      explicit
      map(const _Compare& __comp,
   const allocator_type& __a = allocator_type())
      : _M_t(__comp, _Pair_alloc_type(__a)) { }
      map(const map&) = default;
      map(map&&) = default;
      map(initializer_list<value_type> __l,
   const _Compare& __comp = _Compare(),
   const allocator_type& __a = allocator_type())
      : _M_t(__comp, _Pair_alloc_type(__a))
      { _M_t._M_insert_range_unique(__l.begin(), __l.end()); }
      explicit
      map(const allocator_type& __a)
      : _M_t(_Pair_alloc_type(__a)) { }
      map(const map& __m, const allocator_type& __a)
      : _M_t(__m._M_t, _Pair_alloc_type(__a)) { }
      map(map&& __m, const allocator_type& __a)
      noexcept(is_nothrow_copy_constructible<_Compare>::value
        && _Alloc_traits::_S_always_equal())
      : _M_t(std::move(__m._M_t), _Pair_alloc_type(__a)) { }
      map(initializer_list<value_type> __l, const allocator_type& __a)
      : _M_t(_Pair_alloc_type(__a))
      { _M_t._M_insert_range_unique(__l.begin(), __l.end()); }
      template<typename _InputIterator>
 map(_InputIterator __first, _InputIterator __last,
     const allocator_type& __a)
 : _M_t(_Pair_alloc_type(__a))
 { _M_t._M_insert_range_unique(__first, __last); }
      template<typename _InputIterator>
 map(_InputIterator __first, _InputIterator __last)
 : _M_t()
 { _M_t._M_insert_range_unique(__first, __last); }
      template<typename _InputIterator>
 map(_InputIterator __first, _InputIterator __last,
     const _Compare& __comp,
     const allocator_type& __a = allocator_type())
 : _M_t(__comp, _Pair_alloc_type(__a))
 { _M_t._M_insert_range_unique(__first, __last); }
      ~map() = default;
      map&
      operator=(const map&) = default;
      map&
      operator=(map&&) = default;
      map&
      operator=(initializer_list<value_type> __l)
      {
 _M_t._M_assign_unique(__l.begin(), __l.end());
 return *this;
      }
      allocator_type
      get_allocator() const noexcept
      { return allocator_type(_M_t.get_allocator()); }
      iterator
      begin() noexcept
      { return _M_t.begin(); }
      const_iterator
      begin() const noexcept
      { return _M_t.begin(); }
      iterator
      end() noexcept
      { return _M_t.end(); }
      const_iterator
      end() const noexcept
      { return _M_t.end(); }
      reverse_iterator
      rbegin() noexcept
      { return _M_t.rbegin(); }
      const_reverse_iterator
      rbegin() const noexcept
      { return _M_t.rbegin(); }
      reverse_iterator
      rend() noexcept
      { return _M_t.rend(); }
      const_reverse_iterator
      rend() const noexcept
      { return _M_t.rend(); }
      const_iterator
      cbegin() const noexcept
      { return _M_t.begin(); }
      const_iterator
      cend() const noexcept
      { return _M_t.end(); }
      const_reverse_iterator
      crbegin() const noexcept
      { return _M_t.rbegin(); }
      const_reverse_iterator
      crend() const noexcept
      { return _M_t.rend(); }
      [[__nodiscard__]] bool
      empty() const noexcept
      { return _M_t.empty(); }
      size_type
      size() const noexcept
      { return _M_t.size(); }
      size_type
      max_size() const noexcept
      { return _M_t.max_size(); }
      mapped_type&
      operator[](const key_type& __k)
      {
 iterator __i = lower_bound(__k);
 if (__i == end() || key_comp()(__k, (*__i).first))
   __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
         std::tuple<const key_type&>(__k),
         std::tuple<>());
 return (*__i).second;
      }
      mapped_type&
      operator[](key_type&& __k)
      {
 iterator __i = lower_bound(__k);
 if (__i == end() || key_comp()(__k, (*__i).first))
   __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
     std::forward_as_tuple(std::move(__k)),
     std::tuple<>());
 return (*__i).second;
      }
      mapped_type&
      at(const key_type& __k)
      {
 iterator __i = lower_bound(__k);
 if (__i == end() || key_comp()(__k, (*__i).first))
   __throw_out_of_range(("map::at"));
 return (*__i).second;
      }
      const mapped_type&
      at(const key_type& __k) const
      {
 const_iterator __i = lower_bound(__k);
 if (__i == end() || key_comp()(__k, (*__i).first))
   __throw_out_of_range(("map::at"));
 return (*__i).second;
      }
      template<typename... _Args>
 std::pair<iterator, bool>
 emplace(_Args&&... __args)
 { return _M_t._M_emplace_unique(std::forward<_Args>(__args)...); }
      template<typename... _Args>
 iterator
 emplace_hint(const_iterator __pos, _Args&&... __args)
 {
   return _M_t._M_emplace_hint_unique(__pos,
          std::forward<_Args>(__args)...);
 }
      node_type
      extract(const_iterator __pos)
      {
 do { if (__builtin_is_constant_evaluated() && !bool(__pos != end())) __builtin_unreachable(); } while (false);
 return _M_t.extract(__pos);
      }
      node_type
      extract(const key_type& __x)
      { return _M_t.extract(__x); }
      insert_return_type
      insert(node_type&& __nh)
      { return _M_t._M_reinsert_node_unique(std::move(__nh)); }
      iterator
      insert(const_iterator __hint, node_type&& __nh)
      { return _M_t._M_reinsert_node_hint_unique(__hint, std::move(__nh)); }
      template<typename, typename>
 friend struct std::_Rb_tree_merge_helper;
      template<typename _Cmp2>
 void
 merge(map<_Key, _Tp, _Cmp2, _Alloc>& __source)
 {
   using _Merge_helper = _Rb_tree_merge_helper<map, _Cmp2>;
   _M_t._M_merge_unique(_Merge_helper::_S_get_tree(__source));
 }
      template<typename _Cmp2>
 void
 merge(map<_Key, _Tp, _Cmp2, _Alloc>&& __source)
 { merge(__source); }
      template<typename _Cmp2>
 void
 merge(multimap<_Key, _Tp, _Cmp2, _Alloc>& __source)
 {
   using _Merge_helper = _Rb_tree_merge_helper<map, _Cmp2>;
   _M_t._M_merge_unique(_Merge_helper::_S_get_tree(__source));
 }
      template<typename _Cmp2>
 void
 merge(multimap<_Key, _Tp, _Cmp2, _Alloc>&& __source)
 { merge(__source); }
      template <typename... _Args>
 pair<iterator, bool>
 try_emplace(const key_type& __k, _Args&&... __args)
 {
   iterator __i = lower_bound(__k);
   if (__i == end() || key_comp()(__k, (*__i).first))
     {
       __i = emplace_hint(__i, std::piecewise_construct,
     std::forward_as_tuple(__k),
     std::forward_as_tuple(
       std::forward<_Args>(__args)...));
       return {__i, true};
     }
   return {__i, false};
 }
      template <typename... _Args>
 pair<iterator, bool>
 try_emplace(key_type&& __k, _Args&&... __args)
 {
   iterator __i = lower_bound(__k);
   if (__i == end() || key_comp()(__k, (*__i).first))
     {
       __i = emplace_hint(__i, std::piecewise_construct,
     std::forward_as_tuple(std::move(__k)),
     std::forward_as_tuple(
       std::forward<_Args>(__args)...));
       return {__i, true};
     }
   return {__i, false};
 }
      template <typename... _Args>
 iterator
 try_emplace(const_iterator __hint, const key_type& __k,
      _Args&&... __args)
 {
   iterator __i;
   auto __true_hint = _M_t._M_get_insert_hint_unique_pos(__hint, __k);
   if (__true_hint.second)
     __i = emplace_hint(iterator(__true_hint.second),
          std::piecewise_construct,
          std::forward_as_tuple(__k),
          std::forward_as_tuple(
     std::forward<_Args>(__args)...));
   else
     __i = iterator(__true_hint.first);
   return __i;
 }
      template <typename... _Args>
 iterator
 try_emplace(const_iterator __hint, key_type&& __k, _Args&&... __args)
 {
   iterator __i;
   auto __true_hint = _M_t._M_get_insert_hint_unique_pos(__hint, __k);
   if (__true_hint.second)
     __i = emplace_hint(iterator(__true_hint.second),
          std::piecewise_construct,
          std::forward_as_tuple(std::move(__k)),
          std::forward_as_tuple(
     std::forward<_Args>(__args)...));
   else
     __i = iterator(__true_hint.first);
   return __i;
 }
      std::pair<iterator, bool>
      insert(const value_type& __x)
      { return _M_t._M_insert_unique(__x); }
      std::pair<iterator, bool>
      insert(value_type&& __x)
      { return _M_t._M_insert_unique(std::move(__x)); }
      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair>::value,
        pair<iterator, bool>>
 insert(_Pair&& __x)
 { return _M_t._M_emplace_unique(std::forward<_Pair>(__x)); }
      void
      insert(std::initializer_list<value_type> __list)
      { insert(__list.begin(), __list.end()); }
      iterator
      insert(const_iterator __position, const value_type& __x)
      { return _M_t._M_insert_unique_(__position, __x); }
      iterator
      insert(const_iterator __position, value_type&& __x)
      { return _M_t._M_insert_unique_(__position, std::move(__x)); }
      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair>::value, iterator>
 insert(const_iterator __position, _Pair&& __x)
 {
   return _M_t._M_emplace_hint_unique(__position,
          std::forward<_Pair>(__x));
 }
      template<typename _InputIterator>
 void
 insert(_InputIterator __first, _InputIterator __last)
 { _M_t._M_insert_range_unique(__first, __last); }
      template <typename _Obj>
 pair<iterator, bool>
 insert_or_assign(const key_type& __k, _Obj&& __obj)
 {
   iterator __i = lower_bound(__k);
   if (__i == end() || key_comp()(__k, (*__i).first))
     {
       __i = emplace_hint(__i, std::piecewise_construct,
     std::forward_as_tuple(__k),
     std::forward_as_tuple(
       std::forward<_Obj>(__obj)));
       return {__i, true};
     }
   (*__i).second = std::forward<_Obj>(__obj);
   return {__i, false};
 }
      template <typename _Obj>
 pair<iterator, bool>
 insert_or_assign(key_type&& __k, _Obj&& __obj)
 {
   iterator __i = lower_bound(__k);
   if (__i == end() || key_comp()(__k, (*__i).first))
     {
       __i = emplace_hint(__i, std::piecewise_construct,
     std::forward_as_tuple(std::move(__k)),
     std::forward_as_tuple(
       std::forward<_Obj>(__obj)));
       return {__i, true};
     }
   (*__i).second = std::forward<_Obj>(__obj);
   return {__i, false};
 }
      template <typename _Obj>
 iterator
 insert_or_assign(const_iterator __hint,
    const key_type& __k, _Obj&& __obj)
 {
   iterator __i;
   auto __true_hint = _M_t._M_get_insert_hint_unique_pos(__hint, __k);
   if (__true_hint.second)
     {
       return emplace_hint(iterator(__true_hint.second),
      std::piecewise_construct,
      std::forward_as_tuple(__k),
      std::forward_as_tuple(
        std::forward<_Obj>(__obj)));
     }
   __i = iterator(__true_hint.first);
   (*__i).second = std::forward<_Obj>(__obj);
   return __i;
 }
      template <typename _Obj>
 iterator
 insert_or_assign(const_iterator __hint, key_type&& __k, _Obj&& __obj)
 {
   iterator __i;
   auto __true_hint = _M_t._M_get_insert_hint_unique_pos(__hint, __k);
   if (__true_hint.second)
     {
       return emplace_hint(iterator(__true_hint.second),
      std::piecewise_construct,
      std::forward_as_tuple(std::move(__k)),
      std::forward_as_tuple(
        std::forward<_Obj>(__obj)));
     }
   __i = iterator(__true_hint.first);
   (*__i).second = std::forward<_Obj>(__obj);
   return __i;
 }
      iterator
      erase(const_iterator __position)
      { return _M_t.erase(__position); }
      __attribute ((__abi_tag__ ("cxx11")))
      iterator
      erase(iterator __position)
      { return _M_t.erase(__position); }
      size_type
      erase(const key_type& __x)
      { return _M_t.erase(__x); }
      iterator
      erase(const_iterator __first, const_iterator __last)
      { return _M_t.erase(__first, __last); }
      void
      swap(map& __x)
      noexcept(__is_nothrow_swappable<_Compare>::value)
      { _M_t.swap(__x._M_t); }
      void
      clear() noexcept
      { _M_t.clear(); }
      key_compare
      key_comp() const
      { return _M_t.key_comp(); }
      value_compare
      value_comp() const
      { return value_compare(_M_t.key_comp()); }
      iterator
      find(const key_type& __x)
      { return _M_t.find(__x); }
      template<typename _Kt>
 auto
 find(const _Kt& __x) -> decltype(_M_t._M_find_tr(__x))
 { return _M_t._M_find_tr(__x); }
      const_iterator
      find(const key_type& __x) const
      { return _M_t.find(__x); }
      template<typename _Kt>
 auto
 find(const _Kt& __x) const -> decltype(_M_t._M_find_tr(__x))
 { return _M_t._M_find_tr(__x); }
      size_type
      count(const key_type& __x) const
      { return _M_t.find(__x) == _M_t.end() ? 0 : 1; }
      template<typename _Kt>
 auto
 count(const _Kt& __x) const -> decltype(_M_t._M_count_tr(__x))
 { return _M_t._M_count_tr(__x); }
      iterator
      lower_bound(const key_type& __x)
      { return _M_t.lower_bound(__x); }
      template<typename _Kt>
 auto
 lower_bound(const _Kt& __x)
 -> decltype(iterator(_M_t._M_lower_bound_tr(__x)))
 { return iterator(_M_t._M_lower_bound_tr(__x)); }
      const_iterator
      lower_bound(const key_type& __x) const
      { return _M_t.lower_bound(__x); }
      template<typename _Kt>
 auto
 lower_bound(const _Kt& __x) const
 -> decltype(const_iterator(_M_t._M_lower_bound_tr(__x)))
 { return const_iterator(_M_t._M_lower_bound_tr(__x)); }
      iterator
      upper_bound(const key_type& __x)
      { return _M_t.upper_bound(__x); }
      template<typename _Kt>
 auto
 upper_bound(const _Kt& __x)
 -> decltype(iterator(_M_t._M_upper_bound_tr(__x)))
 { return iterator(_M_t._M_upper_bound_tr(__x)); }
      const_iterator
      upper_bound(const key_type& __x) const
      { return _M_t.upper_bound(__x); }
      template<typename _Kt>
 auto
 upper_bound(const _Kt& __x) const
 -> decltype(const_iterator(_M_t._M_upper_bound_tr(__x)))
 { return const_iterator(_M_t._M_upper_bound_tr(__x)); }
      std::pair<iterator, iterator>
      equal_range(const key_type& __x)
      { return _M_t.equal_range(__x); }
      template<typename _Kt>
 auto
 equal_range(const _Kt& __x)
 -> decltype(pair<iterator, iterator>(_M_t._M_equal_range_tr(__x)))
 { return pair<iterator, iterator>(_M_t._M_equal_range_tr(__x)); }
      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __x) const
      { return _M_t.equal_range(__x); }
      template<typename _Kt>
 auto
 equal_range(const _Kt& __x) const
 -> decltype(pair<const_iterator, const_iterator>(
       _M_t._M_equal_range_tr(__x)))
 {
   return pair<const_iterator, const_iterator>(
       _M_t._M_equal_range_tr(__x));
 }
      template<typename _K1, typename _T1, typename _C1, typename _A1>
 friend bool
 operator==(const map<_K1, _T1, _C1, _A1>&,
     const map<_K1, _T1, _C1, _A1>&);
      template<typename _K1, typename _T1, typename _C1, typename _A1>
 friend bool
 operator<(const map<_K1, _T1, _C1, _A1>&,
    const map<_K1, _T1, _C1, _A1>&);
    };
  template<typename _InputIterator,
    typename _Compare = less<__iter_key_t<_InputIterator>>,
    typename _Allocator = allocator<__iter_to_alloc_t<_InputIterator>>,
    typename = _RequireInputIter<_InputIterator>,
    typename = _RequireNotAllocator<_Compare>,
    typename = _RequireAllocator<_Allocator>>
    map(_InputIterator, _InputIterator,
 _Compare = _Compare(), _Allocator = _Allocator())
    -> map<__iter_key_t<_InputIterator>, __iter_val_t<_InputIterator>,
    _Compare, _Allocator>;
  template<typename _Key, typename _Tp, typename _Compare = less<_Key>,
    typename _Allocator = allocator<pair<const _Key, _Tp>>,
    typename = _RequireNotAllocator<_Compare>,
    typename = _RequireAllocator<_Allocator>>
    map(initializer_list<pair<_Key, _Tp>>,
 _Compare = _Compare(), _Allocator = _Allocator())
    -> map<_Key, _Tp, _Compare, _Allocator>;
  template <typename _InputIterator, typename _Allocator,
     typename = _RequireInputIter<_InputIterator>,
     typename = _RequireAllocator<_Allocator>>
    map(_InputIterator, _InputIterator, _Allocator)
    -> map<__iter_key_t<_InputIterator>, __iter_val_t<_InputIterator>,
    less<__iter_key_t<_InputIterator>>, _Allocator>;
  template<typename _Key, typename _Tp, typename _Allocator,
    typename = _RequireAllocator<_Allocator>>
    map(initializer_list<pair<_Key, _Tp>>, _Allocator)
    -> map<_Key, _Tp, less<_Key>, _Allocator>;
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator==(const map<_Key, _Tp, _Compare, _Alloc>& __x,
        const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t == __y._M_t; }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<(const map<_Key, _Tp, _Compare, _Alloc>& __x,
       const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t < __y._M_t; }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator!=(const map<_Key, _Tp, _Compare, _Alloc>& __x,
        const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x == __y); }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>(const map<_Key, _Tp, _Compare, _Alloc>& __x,
       const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __y < __x; }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<=(const map<_Key, _Tp, _Compare, _Alloc>& __x,
        const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__y < __x); }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>=(const map<_Key, _Tp, _Compare, _Alloc>& __x,
        const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x < __y); }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline void
    swap(map<_Key, _Tp, _Compare, _Alloc>& __x,
  map<_Key, _Tp, _Compare, _Alloc>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
  template<typename _Key, typename _Val, typename _Cmp1, typename _Alloc,
    typename _Cmp2>
    struct
    _Rb_tree_merge_helper<std::map<_Key, _Val, _Cmp1, _Alloc>,
     _Cmp2>
    {
    private:
      friend class std::map<_Key, _Val, _Cmp1, _Alloc>;
      static auto&
      _S_get_tree(std::map<_Key, _Val, _Cmp2, _Alloc>& __map)
      { return __map._M_t; }
      static auto&
      _S_get_tree(std::multimap<_Key, _Val, _Cmp2, _Alloc>& __map)
      { return __map._M_t; }
    };
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  template <typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    class map;
  template <typename _Key, typename _Tp,
     typename _Compare = std::less<_Key>,
     typename _Alloc = std::allocator<std::pair<const _Key, _Tp> > >
    class multimap
    {
    public:
      typedef _Key key_type;
      typedef _Tp mapped_type;
      typedef std::pair<const _Key, _Tp> value_type;
      typedef _Compare key_compare;
      typedef _Alloc allocator_type;
    private:
    public:
      class value_compare
      : public std::binary_function<value_type, value_type, bool>
      {
 friend class multimap<_Key, _Tp, _Compare, _Alloc>;
      protected:
 _Compare comp;
 value_compare(_Compare __c)
 : comp(__c) { }
      public:
 bool operator()(const value_type& __x, const value_type& __y) const
 { return comp(__x.first, __y.first); }
      };
    private:
      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
 rebind<value_type>::other _Pair_alloc_type;
      typedef _Rb_tree<key_type, value_type, _Select1st<value_type>,
         key_compare, _Pair_alloc_type> _Rep_type;
      _Rep_type _M_t;
      typedef __gnu_cxx::__alloc_traits<_Pair_alloc_type> _Alloc_traits;
    public:
      typedef typename _Alloc_traits::pointer pointer;
      typedef typename _Alloc_traits::const_pointer const_pointer;
      typedef typename _Alloc_traits::reference reference;
      typedef typename _Alloc_traits::const_reference const_reference;
      typedef typename _Rep_type::iterator iterator;
      typedef typename _Rep_type::const_iterator const_iterator;
      typedef typename _Rep_type::size_type size_type;
      typedef typename _Rep_type::difference_type difference_type;
      typedef typename _Rep_type::reverse_iterator reverse_iterator;
      typedef typename _Rep_type::const_reverse_iterator const_reverse_iterator;
      using node_type = typename _Rep_type::node_type;
      multimap() = default;
      explicit
      multimap(const _Compare& __comp,
        const allocator_type& __a = allocator_type())
      : _M_t(__comp, _Pair_alloc_type(__a)) { }
      multimap(const multimap&) = default;
      multimap(multimap&&) = default;
      multimap(initializer_list<value_type> __l,
        const _Compare& __comp = _Compare(),
        const allocator_type& __a = allocator_type())
      : _M_t(__comp, _Pair_alloc_type(__a))
      { _M_t._M_insert_range_equal(__l.begin(), __l.end()); }
      explicit
      multimap(const allocator_type& __a)
      : _M_t(_Pair_alloc_type(__a)) { }
      multimap(const multimap& __m, const allocator_type& __a)
      : _M_t(__m._M_t, _Pair_alloc_type(__a)) { }
      multimap(multimap&& __m, const allocator_type& __a)
      noexcept(is_nothrow_copy_constructible<_Compare>::value
        && _Alloc_traits::_S_always_equal())
      : _M_t(std::move(__m._M_t), _Pair_alloc_type(__a)) { }
      multimap(initializer_list<value_type> __l, const allocator_type& __a)
      : _M_t(_Pair_alloc_type(__a))
      { _M_t._M_insert_range_equal(__l.begin(), __l.end()); }
      template<typename _InputIterator>
 multimap(_InputIterator __first, _InputIterator __last,
   const allocator_type& __a)
 : _M_t(_Pair_alloc_type(__a))
 { _M_t._M_insert_range_equal(__first, __last); }
      template<typename _InputIterator>
 multimap(_InputIterator __first, _InputIterator __last)
 : _M_t()
 { _M_t._M_insert_range_equal(__first, __last); }
      template<typename _InputIterator>
 multimap(_InputIterator __first, _InputIterator __last,
   const _Compare& __comp,
   const allocator_type& __a = allocator_type())
 : _M_t(__comp, _Pair_alloc_type(__a))
 { _M_t._M_insert_range_equal(__first, __last); }
      ~multimap() = default;
      multimap&
      operator=(const multimap&) = default;
      multimap&
      operator=(multimap&&) = default;
      multimap&
      operator=(initializer_list<value_type> __l)
      {
 _M_t._M_assign_equal(__l.begin(), __l.end());
 return *this;
      }
      allocator_type
      get_allocator() const noexcept
      { return allocator_type(_M_t.get_allocator()); }
      iterator
      begin() noexcept
      { return _M_t.begin(); }
      const_iterator
      begin() const noexcept
      { return _M_t.begin(); }
      iterator
      end() noexcept
      { return _M_t.end(); }
      const_iterator
      end() const noexcept
      { return _M_t.end(); }
      reverse_iterator
      rbegin() noexcept
      { return _M_t.rbegin(); }
      const_reverse_iterator
      rbegin() const noexcept
      { return _M_t.rbegin(); }
      reverse_iterator
      rend() noexcept
      { return _M_t.rend(); }
      const_reverse_iterator
      rend() const noexcept
      { return _M_t.rend(); }
      const_iterator
      cbegin() const noexcept
      { return _M_t.begin(); }
      const_iterator
      cend() const noexcept
      { return _M_t.end(); }
      const_reverse_iterator
      crbegin() const noexcept
      { return _M_t.rbegin(); }
      const_reverse_iterator
      crend() const noexcept
      { return _M_t.rend(); }
      [[__nodiscard__]] bool
      empty() const noexcept
      { return _M_t.empty(); }
      size_type
      size() const noexcept
      { return _M_t.size(); }
      size_type
      max_size() const noexcept
      { return _M_t.max_size(); }
      template<typename... _Args>
 iterator
 emplace(_Args&&... __args)
 { return _M_t._M_emplace_equal(std::forward<_Args>(__args)...); }
      template<typename... _Args>
 iterator
 emplace_hint(const_iterator __pos, _Args&&... __args)
 {
   return _M_t._M_emplace_hint_equal(__pos,
         std::forward<_Args>(__args)...);
 }
      iterator
      insert(const value_type& __x)
      { return _M_t._M_insert_equal(__x); }
      iterator
      insert(value_type&& __x)
      { return _M_t._M_insert_equal(std::move(__x)); }
      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair>::value, iterator>
 insert(_Pair&& __x)
 { return _M_t._M_emplace_equal(std::forward<_Pair>(__x)); }
      iterator
      insert(const_iterator __position, const value_type& __x)
      { return _M_t._M_insert_equal_(__position, __x); }
      iterator
      insert(const_iterator __position, value_type&& __x)
      { return _M_t._M_insert_equal_(__position, std::move(__x)); }
      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair&&>::value, iterator>
 insert(const_iterator __position, _Pair&& __x)
 {
   return _M_t._M_emplace_hint_equal(__position,
         std::forward<_Pair>(__x));
 }
      template<typename _InputIterator>
 void
 insert(_InputIterator __first, _InputIterator __last)
 { _M_t._M_insert_range_equal(__first, __last); }
      void
      insert(initializer_list<value_type> __l)
      { this->insert(__l.begin(), __l.end()); }
      node_type
      extract(const_iterator __pos)
      {
 do { if (__builtin_is_constant_evaluated() && !bool(__pos != end())) __builtin_unreachable(); } while (false);
 return _M_t.extract(__pos);
      }
      node_type
      extract(const key_type& __x)
      { return _M_t.extract(__x); }
      iterator
      insert(node_type&& __nh)
      { return _M_t._M_reinsert_node_equal(std::move(__nh)); }
      iterator
      insert(const_iterator __hint, node_type&& __nh)
      { return _M_t._M_reinsert_node_hint_equal(__hint, std::move(__nh)); }
      template<typename, typename>
 friend struct std::_Rb_tree_merge_helper;
      template<typename _Cmp2>
 void
 merge(multimap<_Key, _Tp, _Cmp2, _Alloc>& __source)
 {
   using _Merge_helper = _Rb_tree_merge_helper<multimap, _Cmp2>;
   _M_t._M_merge_equal(_Merge_helper::_S_get_tree(__source));
 }
      template<typename _Cmp2>
 void
 merge(multimap<_Key, _Tp, _Cmp2, _Alloc>&& __source)
 { merge(__source); }
      template<typename _Cmp2>
 void
 merge(map<_Key, _Tp, _Cmp2, _Alloc>& __source)
 {
   using _Merge_helper = _Rb_tree_merge_helper<multimap, _Cmp2>;
   _M_t._M_merge_equal(_Merge_helper::_S_get_tree(__source));
 }
      template<typename _Cmp2>
 void
 merge(map<_Key, _Tp, _Cmp2, _Alloc>&& __source)
 { merge(__source); }
      iterator
      erase(const_iterator __position)
      { return _M_t.erase(__position); }
      __attribute ((__abi_tag__ ("cxx11")))
      iterator
      erase(iterator __position)
      { return _M_t.erase(__position); }
      size_type
      erase(const key_type& __x)
      { return _M_t.erase(__x); }
      iterator
      erase(const_iterator __first, const_iterator __last)
      { return _M_t.erase(__first, __last); }
      void
      swap(multimap& __x)
      noexcept(__is_nothrow_swappable<_Compare>::value)
      { _M_t.swap(__x._M_t); }
      void
      clear() noexcept
      { _M_t.clear(); }
      key_compare
      key_comp() const
      { return _M_t.key_comp(); }
      value_compare
      value_comp() const
      { return value_compare(_M_t.key_comp()); }
      iterator
      find(const key_type& __x)
      { return _M_t.find(__x); }
      template<typename _Kt>
 auto
 find(const _Kt& __x) -> decltype(_M_t._M_find_tr(__x))
 { return _M_t._M_find_tr(__x); }
      const_iterator
      find(const key_type& __x) const
      { return _M_t.find(__x); }
      template<typename _Kt>
 auto
 find(const _Kt& __x) const -> decltype(_M_t._M_find_tr(__x))
 { return _M_t._M_find_tr(__x); }
      size_type
      count(const key_type& __x) const
      { return _M_t.count(__x); }
      template<typename _Kt>
 auto
 count(const _Kt& __x) const -> decltype(_M_t._M_count_tr(__x))
 { return _M_t._M_count_tr(__x); }
      iterator
      lower_bound(const key_type& __x)
      { return _M_t.lower_bound(__x); }
      template<typename _Kt>
 auto
 lower_bound(const _Kt& __x)
 -> decltype(iterator(_M_t._M_lower_bound_tr(__x)))
 { return iterator(_M_t._M_lower_bound_tr(__x)); }
      const_iterator
      lower_bound(const key_type& __x) const
      { return _M_t.lower_bound(__x); }
      template<typename _Kt>
 auto
 lower_bound(const _Kt& __x) const
 -> decltype(const_iterator(_M_t._M_lower_bound_tr(__x)))
 { return const_iterator(_M_t._M_lower_bound_tr(__x)); }
      iterator
      upper_bound(const key_type& __x)
      { return _M_t.upper_bound(__x); }
      template<typename _Kt>
 auto
 upper_bound(const _Kt& __x)
 -> decltype(iterator(_M_t._M_upper_bound_tr(__x)))
 { return iterator(_M_t._M_upper_bound_tr(__x)); }
      const_iterator
      upper_bound(const key_type& __x) const
      { return _M_t.upper_bound(__x); }
      template<typename _Kt>
 auto
 upper_bound(const _Kt& __x) const
 -> decltype(const_iterator(_M_t._M_upper_bound_tr(__x)))
 { return const_iterator(_M_t._M_upper_bound_tr(__x)); }
      std::pair<iterator, iterator>
      equal_range(const key_type& __x)
      { return _M_t.equal_range(__x); }
      template<typename _Kt>
 auto
 equal_range(const _Kt& __x)
 -> decltype(pair<iterator, iterator>(_M_t._M_equal_range_tr(__x)))
 { return pair<iterator, iterator>(_M_t._M_equal_range_tr(__x)); }
      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __x) const
      { return _M_t.equal_range(__x); }
      template<typename _Kt>
 auto
 equal_range(const _Kt& __x) const
 -> decltype(pair<const_iterator, const_iterator>(
       _M_t._M_equal_range_tr(__x)))
 {
   return pair<const_iterator, const_iterator>(
       _M_t._M_equal_range_tr(__x));
 }
      template<typename _K1, typename _T1, typename _C1, typename _A1>
 friend bool
 operator==(const multimap<_K1, _T1, _C1, _A1>&,
     const multimap<_K1, _T1, _C1, _A1>&);
      template<typename _K1, typename _T1, typename _C1, typename _A1>
 friend bool
 operator<(const multimap<_K1, _T1, _C1, _A1>&,
    const multimap<_K1, _T1, _C1, _A1>&);
  };
  template<typename _InputIterator,
    typename _Compare = less<__iter_key_t<_InputIterator>>,
    typename _Allocator = allocator<__iter_to_alloc_t<_InputIterator>>,
    typename = _RequireInputIter<_InputIterator>,
    typename = _RequireNotAllocator<_Compare>,
    typename = _RequireAllocator<_Allocator>>
    multimap(_InputIterator, _InputIterator,
      _Compare = _Compare(), _Allocator = _Allocator())
    -> multimap<__iter_key_t<_InputIterator>, __iter_val_t<_InputIterator>,
  _Compare, _Allocator>;
  template<typename _Key, typename _Tp, typename _Compare = less<_Key>,
    typename _Allocator = allocator<pair<const _Key, _Tp>>,
    typename = _RequireNotAllocator<_Compare>,
    typename = _RequireAllocator<_Allocator>>
    multimap(initializer_list<pair<_Key, _Tp>>,
      _Compare = _Compare(), _Allocator = _Allocator())
    -> multimap<_Key, _Tp, _Compare, _Allocator>;
  template<typename _InputIterator, typename _Allocator,
    typename = _RequireInputIter<_InputIterator>,
    typename = _RequireAllocator<_Allocator>>
    multimap(_InputIterator, _InputIterator, _Allocator)
    -> multimap<__iter_key_t<_InputIterator>, __iter_val_t<_InputIterator>,
  less<__iter_key_t<_InputIterator>>, _Allocator>;
  template<typename _Key, typename _Tp, typename _Allocator,
    typename = _RequireAllocator<_Allocator>>
    multimap(initializer_list<pair<_Key, _Tp>>, _Allocator)
    -> multimap<_Key, _Tp, less<_Key>, _Allocator>;
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator==(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
        const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t == __y._M_t; }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
       const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t < __y._M_t; }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator!=(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
        const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x == __y); }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
       const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __y < __x; }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<=(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
        const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__y < __x); }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>=(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
        const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x < __y); }
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline void
    swap(multimap<_Key, _Tp, _Compare, _Alloc>& __x,
  multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
  template<typename _Key, typename _Val, typename _Cmp1, typename _Alloc,
    typename _Cmp2>
    struct
    _Rb_tree_merge_helper<std::multimap<_Key, _Val, _Cmp1, _Alloc>,
     _Cmp2>
    {
    private:
      friend class std::multimap<_Key, _Val, _Cmp1, _Alloc>;
      static auto&
      _S_get_tree(std::map<_Key, _Val, _Cmp2, _Alloc>& __map)
      { return __map._M_t; }
      static auto&
      _S_get_tree(std::multimap<_Key, _Val, _Cmp2, _Alloc>& __map)
      { return __map._M_t; }
    };
}

namespace std
{
  namespace __detail
  {
    template<typename _Container, typename _Predicate>
      typename _Container::size_type
      __erase_nodes_if(_Container& __cont, _Predicate __pred)
      {
 typename _Container::size_type __num = 0;
 for (auto __iter = __cont.begin(), __last = __cont.end();
      __iter != __last;)
   {
     if (__pred(*__iter))
       {
  __iter = __cont.erase(__iter);
  ++__num;
       }
     else
       ++__iter;
   }
 return __num;
      }
  }
}
namespace std __attribute__ ((__visibility__ ("default")))
{
  namespace pmr
  {
    template<typename _Tp> class polymorphic_allocator;
    template<typename _Key, typename _Tp, typename _Cmp = std::less<_Key>>
      using map
 = std::map<_Key, _Tp, _Cmp,
     polymorphic_allocator<pair<const _Key, _Tp>>>;
    template<typename _Key, typename _Tp, typename _Cmp = std::less<_Key>>
      using multimap
 = std::multimap<_Key, _Tp, _Cmp,
   polymorphic_allocator<pair<const _Key, _Tp>>>;
  }
}

extern "C" {
typedef __builtin_va_list __gnuc_va_list;
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
struct _IO_FILE;
typedef struct _IO_FILE __FILE;
struct _IO_FILE;
typedef struct _IO_FILE FILE;
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;
typedef void _IO_lock_t;
struct _IO_FILE
{
  int _flags;
  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;
  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;
  struct _IO_marker *_markers;
  struct _IO_FILE *_chain;
  int _fileno;
  int _flags2;
  __off_t _old_offset;
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];
  _IO_lock_t *_lock;
  __off64_t _offset;
  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;
  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);
typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);
typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);
typedef int cookie_close_function_t (void *__cookie);
typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
typedef __gnuc_va_list va_list;
typedef __fpos_t fpos_t;
typedef __fpos64_t fpos64_t;
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;
extern int remove (const char *__filename) noexcept (true);
extern int rename (const char *__old, const char *__new) noexcept (true);
extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) noexcept (true);
extern int renameat2 (int __oldfd, const char *__old, int __newfd,
        const char *__new, unsigned int __flags) noexcept (true);
extern int fclose (FILE *__stream);
extern FILE *tmpfile (void)
  __attribute__ ((__malloc__)) ;
extern FILE *tmpfile64 (void)
   __attribute__ ((__malloc__)) ;
extern char *tmpnam (char[20]) noexcept (true) ;
extern char *tmpnam_r (char __s[20]) noexcept (true) ;
extern char *tempnam (const char *__dir, const char *__pfx)
   noexcept (true) __attribute__ ((__malloc__)) ;
extern int fflush (FILE *__stream);
extern int fflush_unlocked (FILE *__stream);
extern int fcloseall (void);
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes)
  __attribute__ ((__malloc__)) ;
extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes)
  __attribute__ ((__malloc__)) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;
extern FILE *fdopen (int __fd, const char *__modes) noexcept (true)
  __attribute__ ((__malloc__)) ;
extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) noexcept (true)
  __attribute__ ((__malloc__)) ;
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  noexcept (true) __attribute__ ((__malloc__)) ;
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) noexcept (true)
  __attribute__ ((__malloc__)) ;
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) noexcept (true);
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) noexcept (true);
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) noexcept (true);
extern void setlinebuf (FILE *__stream) noexcept (true);
extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);
extern int printf (const char *__restrict __format, ...);
extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) noexcept (true);
extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);
extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);
extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) noexcept (true);
extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     noexcept (true) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     noexcept (true) __attribute__ ((__format__ (__printf__, 3, 0)));
extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     noexcept (true) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     noexcept (true) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     noexcept (true) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));
extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;
extern int scanf (const char *__restrict __format, ...) ;
extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) noexcept (true);
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) noexcept (true) __asm__ ("" "__isoc99_sscanf");
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     noexcept (true) __attribute__ ((__format__ (__scanf__, 2, 0)));
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) noexcept (true) __asm__ ("" "__isoc99_vsscanf")
     __attribute__ ((__format__ (__scanf__, 2, 0)));
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);
extern int getchar (void);
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);
extern int putchar (int __c);
extern int fputc_unlocked (int __c, FILE *__stream);
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
extern int getw (FILE *__stream);
extern int putw (int __w, FILE *__stream);
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
                                                         ;
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream)
                                                  ;
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) ;
extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) ;
extern int fputs (const char *__restrict __s, FILE *__restrict __stream);
extern int puts (const char *__s);
extern int ungetc (int __c, FILE *__stream);
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);
extern int fseek (FILE *__stream, long int __off, int __whence);
extern long int ftell (FILE *__stream) ;
extern void rewind (FILE *__stream);
extern int fseeko (FILE *__stream, __off_t __off, int __whence);
extern __off_t ftello (FILE *__stream) ;
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
extern int fsetpos (FILE *__stream, const fpos_t *__pos);
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);
extern void clearerr (FILE *__stream) noexcept (true);
extern int feof (FILE *__stream) noexcept (true) ;
extern int ferror (FILE *__stream) noexcept (true) ;
extern void clearerr_unlocked (FILE *__stream) noexcept (true);
extern int feof_unlocked (FILE *__stream) noexcept (true) ;
extern int ferror_unlocked (FILE *__stream) noexcept (true) ;
extern void perror (const char *__s);
extern int fileno (FILE *__stream) noexcept (true) ;
extern int fileno_unlocked (FILE *__stream) noexcept (true) ;
extern int pclose (FILE *__stream);
extern FILE *popen (const char *__command, const char *__modes)
  __attribute__ ((__malloc__)) ;
extern char *ctermid (char *__s) noexcept (true)
                                     ;
extern char *cuserid (char *__s)
                                     ;
struct obstack;
extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     noexcept (true) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     noexcept (true) __attribute__ ((__format__ (__printf__, 2, 0)));
extern void flockfile (FILE *__stream) noexcept (true);
extern int ftrylockfile (FILE *__stream) noexcept (true) ;
extern void funlockfile (FILE *__stream) noexcept (true);
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
}

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize) {
    stringSize = __VERIFIER_nondet_int();
  }
  char *randomString = (char*)calloc(stringSize + 1, sizeof(char));
  if (randomString == __null) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < stringSize; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  randomString[stringSize] = '\0';
  return randomString;
}
unsigned char m_oValue[49] = {0};
unsigned char m_uValue[49] = {0};
unsigned char m_rValue[49] = {0};
char *getKey(std::map<char, char*>* m_Map, const char key) {
  auto it = m_Map->find(key);
  if (it == m_Map->end())
    return nullptr;
  return it->second;
}
void freeMap(std::map<char, char*> *m_Map) {
  for (auto a : *m_Map) {
    if (a.second) {
      free(a.second);
    }
  }
}
int main() {
  std::map<char, char*> m_Map;
  char *data = getRandomString(50, 5000);
  char* datap = (char*)data;
  size_t dataSize = strlen(datap);
  char* dataEnd = data + dataSize;
  while(datap < dataEnd) {
    if (datap + 3 >= dataEnd) {
      printf("malformed data\n");
      free(data);
      freeMap(&m_Map);
      return 1;
    }
    char identifier = datap[1];
    datap += 3;
    if (*datap != '<') {
      printf("malformed data\n");
      free(data);
      freeMap(&m_Map);
      return 1;
    }
    datap += 1;
    char* valueEnd = datap;
    while (valueEnd < dataEnd && *valueEnd != '>') {
      valueEnd++;
    }
    size_t valueSize = valueEnd - datap;
    if (valueSize > 0) {
      char* value = (char*)calloc(valueSize + 1, sizeof(char));
      memcpy(value, datap, valueSize);
      m_Map[identifier] = value;
    }
    datap += valueSize + 1;
  }
  auto oValue = getKey(&m_Map, 'O');
  if (oValue) {
    memcpy(m_oValue, oValue, 48);
    printf("extracted O value: %s\n", m_oValue);
  }
  auto uValue = getKey(&m_Map, 'U');
  if (uValue) {
    memcpy(m_uValue, uValue, 48);
    printf("extracted U value: %s\n", uValue);
  }
  auto rValue = getKey(&m_Map, 'R');
  if (rValue) {
    memcpy(m_rValue, rValue, 48);
    printf("extracted R value: %s\n", rValue);
  }
  freeMap(&m_Map);
  free(data);
}
