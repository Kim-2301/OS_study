#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    if(argc != 2) {
        printf(2, "Usage: trace [0|1]\n");
        exit();
    }

    int enable = atoi(argv[1]);
    if(enable != 0 && enable != 1) {
        printf(2, "Invalid argument. Use 0 to disable or 1 to enable tracing.\n");
        exit();
    }

    // 시스템 콜을 통해 tracing 활성화 또는 비활성화
    trace(enable);

    if(enable)
        printf(1, "Tracing enabled\n");
    else
        printf(1, "Tracing disabled\n");

    exit();
}