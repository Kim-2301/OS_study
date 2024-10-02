
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  if(argc != 3){
   f:	83 39 03             	cmpl   $0x3,(%ecx)
{
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 88 07 00 00       	push   $0x788
  1e:	6a 02                	push   $0x2
  20:	e8 fb 03 00 00       	call   420 <printf>
    exit();
  25:	e8 89 02 00 00       	call   2b3 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	push   0x8(%ebx)
  2f:	ff 73 04             	push   0x4(%ebx)
  32:	e8 dc 02 00 00       	call   313 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 70 02 00 00       	call   2b3 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	push   0x8(%ebx)
  46:	ff 73 04             	push   0x4(%ebx)
  49:	68 9b 07 00 00       	push   $0x79b
  4e:	6a 02                	push   $0x2
  50:	e8 cb 03 00 00       	call   420 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave
  84:	c3                   	ret
  85:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8c:	00 
  8d:	8d 76 00             	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 2f                	jne    d0 <strcmp+0x40>
  a1:	eb 4a                	jmp    ed <strcmp+0x5d>
  a3:	eb 1b                	jmp    c0 <strcmp+0x30>
  a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ac:	00 
  ad:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  b4:	00 
  b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bc:	00 
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  c4:	83 c2 01             	add    $0x1,%edx
  c7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  ca:	84 c0                	test   %al,%al
  cc:	74 12                	je     e0 <strcmp+0x50>
  ce:	89 d9                	mov    %ebx,%ecx
  d0:	0f b6 19             	movzbl (%ecx),%ebx
  d3:	38 c3                	cmp    %al,%bl
  d5:	74 e9                	je     c0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  d7:	29 d8                	sub    %ebx,%eax
}
  d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  dc:	c9                   	leave
  dd:	c3                   	ret
  de:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave
  ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb e3                	jmp    d7 <strcmp+0x47>
  f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fb:	00 
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret
 126:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12d:	00 
 12e:	66 90                	xchg   %ax,%ax

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave
 148:	c3                   	ret
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 1a                	jne    17b <strchr+0x2b>
 161:	eb 25                	jmp    188 <strchr+0x38>
 163:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16a:	00 
 16b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 174:	83 c0 01             	add    $0x1,%eax
 177:	84 d2                	test   %dl,%dl
 179:	74 0d                	je     188 <strchr+0x38>
    if(*s == c)
 17b:	38 d1                	cmp    %dl,%cl
 17d:	75 f1                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 188:	31 c0                	xor    %eax,%eax
}
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	56                   	push   %esi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 1e 01 00 00       	call   2cb <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 10                	je     1d3 <gets+0x43>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 0c                	je     1d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1c7:	89 df                	mov    %ebx,%edi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
 1d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dd:	5b                   	pop    %ebx
 1de:	5e                   	pop    %esi
 1df:	5f                   	pop    %edi
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret
 1e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e9:	00 
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23e:	00 
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25e:	00 
 25f:	90                   	nop
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave
 27b:	c3                   	ret
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	66 90                	xchg   %ax,%ax
 298:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29f:	00 
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <ps>:
SYSCALL(ps)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 368:	89 d1                	mov    %edx,%ecx
{
 36a:	83 ec 3c             	sub    $0x3c,%esp
 36d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 370:	85 d2                	test   %edx,%edx
 372:	0f 89 98 00 00 00    	jns    410 <printint+0xb0>
 378:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37c:	0f 84 8e 00 00 00    	je     410 <printint+0xb0>
    x = -xx;
 382:	f7 d9                	neg    %ecx
    neg = 1;
 384:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 389:	89 45 c0             	mov    %eax,-0x40(%ebp)
 38c:	31 f6                	xor    %esi,%esi
 38e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 395:	00 
 396:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39d:	00 
 39e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 f7                	mov    %esi,%edi
 3a6:	f7 f3                	div    %ebx
 3a8:	8d 76 01             	lea    0x1(%esi),%esi
 3ab:	0f b6 92 10 08 00 00 	movzbl 0x810(%edx),%edx
 3b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3b6:	89 ca                	mov    %ecx,%edx
 3b8:	89 c1                	mov    %eax,%ecx
 3ba:	39 da                	cmp    %ebx,%edx
 3bc:	73 e2                	jae    3a0 <printint+0x40>
  if(neg)
 3be:	8b 45 c0             	mov    -0x40(%ebp),%eax
 3c1:	85 c0                	test   %eax,%eax
 3c3:	74 07                	je     3cc <printint+0x6c>
    buf[i++] = '-';
 3c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 3ca:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 3cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3cf:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 3d2:	01 df                	add    %ebx,%edi
 3d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3db:	00 
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3e0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3e3:	83 ec 04             	sub    $0x4,%esp
 3e6:	88 45 d7             	mov    %al,-0x29(%ebp)
 3e9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3ec:	6a 01                	push   $0x1
 3ee:	50                   	push   %eax
 3ef:	56                   	push   %esi
 3f0:	e8 de fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 3f5:	89 f8                	mov    %edi,%eax
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	83 ef 01             	sub    $0x1,%edi
 3fd:	39 d8                	cmp    %ebx,%eax
 3ff:	75 df                	jne    3e0 <printint+0x80>
}
 401:	8d 65 f4             	lea    -0xc(%ebp),%esp
 404:	5b                   	pop    %ebx
 405:	5e                   	pop    %esi
 406:	5f                   	pop    %edi
 407:	5d                   	pop    %ebp
 408:	c3                   	ret
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 410:	31 c0                	xor    %eax,%eax
 412:	e9 72 ff ff ff       	jmp    389 <printint+0x29>
 417:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41e:	00 
 41f:	90                   	nop

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 42c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 42f:	0f b6 13             	movzbl (%ebx),%edx
 432:	83 c3 01             	add    $0x1,%ebx
 435:	84 d2                	test   %dl,%dl
 437:	0f 84 a0 00 00 00    	je     4dd <printf+0xbd>
 43d:	8d 45 10             	lea    0x10(%ebp),%eax
 440:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 443:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 446:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 449:	eb 28                	jmp    473 <printf+0x53>
 44b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 450:	83 ec 04             	sub    $0x4,%esp
 453:	8d 45 e7             	lea    -0x19(%ebp),%eax
 456:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 459:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 45c:	6a 01                	push   $0x1
 45e:	50                   	push   %eax
 45f:	56                   	push   %esi
 460:	e8 6e fe ff ff       	call   2d3 <write>
  for(i = 0; fmt[i]; i++){
 465:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 469:	83 c4 10             	add    $0x10,%esp
 46c:	84 d2                	test   %dl,%dl
 46e:	74 6d                	je     4dd <printf+0xbd>
    c = fmt[i] & 0xff;
 470:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 473:	83 f8 25             	cmp    $0x25,%eax
 476:	75 d8                	jne    450 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 478:	0f b6 13             	movzbl (%ebx),%edx
 47b:	84 d2                	test   %dl,%dl
 47d:	74 5e                	je     4dd <printf+0xbd>
    c = fmt[i] & 0xff;
 47f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 482:	80 fa 25             	cmp    $0x25,%dl
 485:	0f 84 1d 01 00 00    	je     5a8 <printf+0x188>
 48b:	83 e8 63             	sub    $0x63,%eax
 48e:	83 f8 15             	cmp    $0x15,%eax
 491:	77 0d                	ja     4a0 <printf+0x80>
 493:	ff 24 85 b8 07 00 00 	jmp    *0x7b8(,%eax,4)
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 4a6:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4a9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 4ad:	6a 01                	push   $0x1
 4af:	51                   	push   %ecx
 4b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4b3:	56                   	push   %esi
 4b4:	e8 1a fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4b9:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 4bd:	83 c4 0c             	add    $0xc,%esp
 4c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4c3:	6a 01                	push   $0x1
 4c5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4c8:	51                   	push   %ecx
 4c9:	56                   	push   %esi
 4ca:	e8 04 fe ff ff       	call   2d3 <write>
  for(i = 0; fmt[i]; i++){
 4cf:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 4d3:	83 c3 02             	add    $0x2,%ebx
 4d6:	83 c4 10             	add    $0x10,%esp
 4d9:	84 d2                	test   %dl,%dl
 4db:	75 93                	jne    470 <printf+0x50>
      }
      state = 0;
    }
  }
}
 4dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5f                   	pop    %edi
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4e8:	83 ec 0c             	sub    $0xc,%esp
 4eb:	8b 17                	mov    (%edi),%edx
 4ed:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f2:	89 f0                	mov    %esi,%eax
 4f4:	6a 00                	push   $0x0
        ap++;
 4f6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 4f9:	e8 62 fe ff ff       	call   360 <printint>
  for(i = 0; fmt[i]; i++){
 4fe:	eb cf                	jmp    4cf <printf+0xaf>
        s = (char*)*ap;
 500:	8b 07                	mov    (%edi),%eax
        ap++;
 502:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 505:	85 c0                	test   %eax,%eax
 507:	0f 84 b3 00 00 00    	je     5c0 <printf+0x1a0>
        while(*s != 0){
 50d:	0f b6 10             	movzbl (%eax),%edx
 510:	84 d2                	test   %dl,%dl
 512:	0f 84 ba 00 00 00    	je     5d2 <printf+0x1b2>
 518:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 51b:	89 c7                	mov    %eax,%edi
 51d:	89 d0                	mov    %edx,%eax
 51f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 522:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 525:	89 fb                	mov    %edi,%ebx
 527:	89 cf                	mov    %ecx,%edi
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 536:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 539:	6a 01                	push   $0x1
 53b:	57                   	push   %edi
 53c:	56                   	push   %esi
 53d:	e8 91 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 542:	0f b6 03             	movzbl (%ebx),%eax
 545:	83 c4 10             	add    $0x10,%esp
 548:	84 c0                	test   %al,%al
 54a:	75 e4                	jne    530 <printf+0x110>
 54c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 54f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 553:	83 c3 02             	add    $0x2,%ebx
 556:	84 d2                	test   %dl,%dl
 558:	0f 85 e5 fe ff ff    	jne    443 <printf+0x23>
 55e:	e9 7a ff ff ff       	jmp    4dd <printf+0xbd>
 563:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 568:	83 ec 0c             	sub    $0xc,%esp
 56b:	8b 17                	mov    (%edi),%edx
 56d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 572:	89 f0                	mov    %esi,%eax
 574:	6a 01                	push   $0x1
        ap++;
 576:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 579:	e8 e2 fd ff ff       	call   360 <printint>
  for(i = 0; fmt[i]; i++){
 57e:	e9 4c ff ff ff       	jmp    4cf <printf+0xaf>
 583:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 588:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 58a:	83 ec 04             	sub    $0x4,%esp
 58d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 590:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 593:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 596:	6a 01                	push   $0x1
 598:	51                   	push   %ecx
 599:	56                   	push   %esi
 59a:	e8 34 fd ff ff       	call   2d3 <write>
  for(i = 0; fmt[i]; i++){
 59f:	e9 2b ff ff ff       	jmp    4cf <printf+0xaf>
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5a8:	83 ec 04             	sub    $0x4,%esp
 5ab:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5ae:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5b1:	6a 01                	push   $0x1
 5b3:	e9 10 ff ff ff       	jmp    4c8 <printf+0xa8>
 5b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5bf:	00 
          s = "(null)";
 5c0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5c3:	b8 28 00 00 00       	mov    $0x28,%eax
 5c8:	bf af 07 00 00       	mov    $0x7af,%edi
 5cd:	e9 4d ff ff ff       	jmp    51f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 5d2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 5d6:	83 c3 02             	add    $0x2,%ebx
 5d9:	84 d2                	test   %dl,%dl
 5db:	0f 85 8f fe ff ff    	jne    470 <printf+0x50>
 5e1:	e9 f7 fe ff ff       	jmp    4dd <printf+0xbd>
 5e6:	66 90                	xchg   %ax,%ax
 5e8:	66 90                	xchg   %ax,%ax
 5ea:	66 90                	xchg   %ax,%ax
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax
 5f0:	66 90                	xchg   %ax,%ax
 5f2:	66 90                	xchg   %ax,%ax
 5f4:	66 90                	xchg   %ax,%ax
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	66 90                	xchg   %ax,%ax
 5fa:	66 90                	xchg   %ax,%ax
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 24 08 00 00       	mov    0x824,%eax
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 60e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 618:	00 
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 620:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 622:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 624:	39 ca                	cmp    %ecx,%edx
 626:	73 30                	jae    658 <free+0x58>
 628:	39 c1                	cmp    %eax,%ecx
 62a:	72 04                	jb     630 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62c:	39 c2                	cmp    %eax,%edx
 62e:	72 f0                	jb     620 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 73 fc             	mov    -0x4(%ebx),%esi
 633:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 636:	39 f8                	cmp    %edi,%eax
 638:	74 36                	je     670 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 63a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 63d:	8b 42 04             	mov    0x4(%edx),%eax
 640:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 643:	39 f1                	cmp    %esi,%ecx
 645:	74 40                	je     687 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 647:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 649:	5b                   	pop    %ebx
  freep = p;
 64a:	89 15 24 08 00 00    	mov    %edx,0x824
}
 650:	5e                   	pop    %esi
 651:	5f                   	pop    %edi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 658:	39 c2                	cmp    %eax,%edx
 65a:	72 c4                	jb     620 <free+0x20>
 65c:	39 c1                	cmp    %eax,%ecx
 65e:	73 c0                	jae    620 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 660:	8b 73 fc             	mov    -0x4(%ebx),%esi
 663:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 666:	39 f8                	cmp    %edi,%eax
 668:	75 d0                	jne    63a <free+0x3a>
 66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 670:	03 70 04             	add    0x4(%eax),%esi
 673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 676:	8b 02                	mov    (%edx),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 67d:	8b 42 04             	mov    0x4(%edx),%eax
 680:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 683:	39 f1                	cmp    %esi,%ecx
 685:	75 c0                	jne    647 <free+0x47>
    p->s.size += bp->s.size;
 687:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 68a:	89 15 24 08 00 00    	mov    %edx,0x824
    p->s.size += bp->s.size;
 690:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 693:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 696:	89 0a                	mov    %ecx,(%edx)
}
 698:	5b                   	pop    %ebx
 699:	5e                   	pop    %esi
 69a:	5f                   	pop    %edi
 69b:	5d                   	pop    %ebp
 69c:	c3                   	ret
 69d:	8d 76 00             	lea    0x0(%esi),%esi

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ac:	8b 15 24 08 00 00    	mov    0x824,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8d 78 07             	lea    0x7(%eax),%edi
 6b5:	c1 ef 03             	shr    $0x3,%edi
 6b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6bb:	85 d2                	test   %edx,%edx
 6bd:	0f 84 8d 00 00 00    	je     750 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6c5:	8b 48 04             	mov    0x4(%eax),%ecx
 6c8:	39 f9                	cmp    %edi,%ecx
 6ca:	73 64                	jae    730 <malloc+0x90>
  if(nu < 4096)
 6cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6d1:	39 df                	cmp    %ebx,%edi
 6d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6dd:	eb 0a                	jmp    6e9 <malloc+0x49>
 6df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6e2:	8b 48 04             	mov    0x4(%eax),%ecx
 6e5:	39 f9                	cmp    %edi,%ecx
 6e7:	73 47                	jae    730 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6e9:	89 c2                	mov    %eax,%edx
 6eb:	39 05 24 08 00 00    	cmp    %eax,0x824
 6f1:	75 ed                	jne    6e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 6f3:	83 ec 0c             	sub    $0xc,%esp
 6f6:	56                   	push   %esi
 6f7:	e8 3f fc ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 6fc:	83 c4 10             	add    $0x10,%esp
 6ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 702:	74 1c                	je     720 <malloc+0x80>
  hp->s.size = nu;
 704:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 707:	83 ec 0c             	sub    $0xc,%esp
 70a:	83 c0 08             	add    $0x8,%eax
 70d:	50                   	push   %eax
 70e:	e8 ed fe ff ff       	call   600 <free>
  return freep;
 713:	8b 15 24 08 00 00    	mov    0x824,%edx
      if((p = morecore(nunits)) == 0)
 719:	83 c4 10             	add    $0x10,%esp
 71c:	85 d2                	test   %edx,%edx
 71e:	75 c0                	jne    6e0 <malloc+0x40>
        return 0;
  }
}
 720:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 723:	31 c0                	xor    %eax,%eax
}
 725:	5b                   	pop    %ebx
 726:	5e                   	pop    %esi
 727:	5f                   	pop    %edi
 728:	5d                   	pop    %ebp
 729:	c3                   	ret
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 730:	39 cf                	cmp    %ecx,%edi
 732:	74 4c                	je     780 <malloc+0xe0>
        p->s.size -= nunits;
 734:	29 f9                	sub    %edi,%ecx
 736:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 739:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 73c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 73f:	89 15 24 08 00 00    	mov    %edx,0x824
}
 745:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 748:	83 c0 08             	add    $0x8,%eax
}
 74b:	5b                   	pop    %ebx
 74c:	5e                   	pop    %esi
 74d:	5f                   	pop    %edi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 750:	c7 05 24 08 00 00 28 	movl   $0x828,0x824
 757:	08 00 00 
    base.s.size = 0;
 75a:	b8 28 08 00 00       	mov    $0x828,%eax
    base.s.ptr = freep = prevp = &base;
 75f:	c7 05 28 08 00 00 28 	movl   $0x828,0x828
 766:	08 00 00 
    base.s.size = 0;
 769:	c7 05 2c 08 00 00 00 	movl   $0x0,0x82c
 770:	00 00 00 
    if(p->s.size >= nunits){
 773:	e9 54 ff ff ff       	jmp    6cc <malloc+0x2c>
 778:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 77f:	00 
        prevp->s.ptr = p->s.ptr;
 780:	8b 08                	mov    (%eax),%ecx
 782:	89 0a                	mov    %ecx,(%edx)
 784:	eb b9                	jmp    73f <malloc+0x9f>
