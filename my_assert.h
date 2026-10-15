#ifndef MY_ASSERT_H
#define MY_ASSERT_H
#include <stdio.h>
#include <stdlib.h>

/* glibc 가 제공하는 현재 프로그램 이름 */
extern char *program_invocation_short_name;

#ifdef NDEBUG
#define my_assert(expr) ((void)0)
#else
#define my_assert(expr)                                                   \
    ((expr) ? (void)0                                                     \
            : (void)(fprintf(stderr, "%s: %s:%d: %s: Assertion `%s' failed.\n", \
                       program_invocation_short_name,                     \
                       __FILE__, __LINE__, __func__, #expr),              \
               abort()))
#endif
#endif
