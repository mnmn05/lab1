#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
int main(void) {
    void *handle = dlopen("./lib/libcalc.so", RTLD_LAZY);
    if (!handle) { fprintf(stderr, "dlopen 실패: %s\n", dlerror()); return 1; }
    int    (*add)(int, int)      = dlsym(handle, "add");
    int    (*subtract)(int, int) = dlsym(handle, "subtract");
    int    (*multiply)(int, int) = dlsym(handle, "multiply");
    double (*divide)(int, int)   = dlsym(handle, "divide");
    if (!add || !subtract || !multiply || !divide) {
        fprintf(stderr, "dlsym 실패: %s\n", dlerror());
        dlclose(handle);
        return 1;
    }
    int a = 20, b = 4;
    printf("[동적 로딩] %d + %d = %d\n", a, b, add(a, b));
    printf("[동적 로딩] %d - %d = %d\n", a, b, subtract(a, b));
    printf("[동적 로딩] %d * %d = %d\n", a, b, multiply(a, b));
    printf("[동적 로딩] %d / %d = %.2f\n", a, b, divide(a, b));
    dlclose(handle);
    return 0;
}
