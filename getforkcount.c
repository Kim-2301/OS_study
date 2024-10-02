#include "types.h"
#include "user.h"

int
main(void)
{
    int count = getforkcount();
    printf(1,"Initial fork count: %d\n", count);

    // fork 호출
    if (fork() == 0) {
        // 자식 프로세스에서는 exit만 수행
        exit();
    }
    wait();  // 자식 프로세스가 종료될 때까지 대기

    count = getforkcount();
    printf(1,"Fork count after fork: %d\n", count);

    exit();
}