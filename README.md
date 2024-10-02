# OS_study
OS study with XV6

### 현재 살아있는 프로세스의 실행 상태를 알려주는 시스템 콜 ps
사용법 : ps
결과 설명 : 프로세스의 이름(역할)과 프로세스 아이디, 프로세스 상태를 띄워줌


### fork 시스템 콜 발생 횟수를 세주는 시스템 콜 getforkcount
사용법 : getforkcount
결과 설명 : getforkcount 호출 시점을 기준으로 fork가 발생한 횟수를 알려줌.
          시스템 콜 내부에서 fork 호출 후, 다시 횟수를 알려줌

### 시스템 콜이 발생할 때마다 시스템 콜 종류와 프로세스 정보를 출력해주는 시스템 콜 trace
사용법 :  trace 1 -> 기능 on  / trace 0 -> 기능 off
결과 설명 : 프로세스 이름, 프로세스 아이디, 시스템 콜 넘버를 알려줌. write 시스템콜의 경우 write한 글자가 옆에 같이 뜸
