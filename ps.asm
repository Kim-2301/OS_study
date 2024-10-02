
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int 
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
    ps();
   6:	e8 08 03 00 00       	call   313 <ps>
    exit();
   b:	e8 63 02 00 00       	call   273 <exit>
  10:	66 90                	xchg   %ax,%ax
  12:	66 90                	xchg   %ax,%ax
  14:	66 90                	xchg   %ax,%ax
  16:	66 90                	xchg   %ax,%ax
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  20:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  21:	31 c0                	xor    %eax,%eax
{
  23:	89 e5                	mov    %esp,%ebp
  25:	53                   	push   %ebx
  26:	8b 4d 08             	mov    0x8(%ebp),%ecx
  29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  37:	83 c0 01             	add    $0x1,%eax
  3a:	84 d2                	test   %dl,%dl
  3c:	75 f2                	jne    30 <strcpy+0x10>
    ;
  return os;
}
  3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  41:	89 c8                	mov    %ecx,%eax
  43:	c9                   	leave
  44:	c3                   	ret
  45:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  4c:	00 
  4d:	8d 76 00             	lea    0x0(%esi),%esi

00000050 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  54:	8b 55 08             	mov    0x8(%ebp),%edx
  57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  5a:	0f b6 02             	movzbl (%edx),%eax
  5d:	84 c0                	test   %al,%al
  5f:	75 2f                	jne    90 <strcmp+0x40>
  61:	eb 4a                	jmp    ad <strcmp+0x5d>
  63:	eb 1b                	jmp    80 <strcmp+0x30>
  65:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6c:	00 
  6d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  74:	00 
  75:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  7c:	00 
  7d:	8d 76 00             	lea    0x0(%esi),%esi
  80:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  84:	83 c2 01             	add    $0x1,%edx
  87:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  8a:	84 c0                	test   %al,%al
  8c:	74 12                	je     a0 <strcmp+0x50>
  8e:	89 d9                	mov    %ebx,%ecx
  90:	0f b6 19             	movzbl (%ecx),%ebx
  93:	38 c3                	cmp    %al,%bl
  95:	74 e9                	je     80 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  97:	29 d8                	sub    %ebx,%eax
}
  99:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  9c:	c9                   	leave
  9d:	c3                   	ret
  9e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave
  ac:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb e3                	jmp    97 <strcmp+0x47>
  b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bb:	00 
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret
  e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ed:	00 
  ee:	66 90                	xchg   %ax,%ax

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave
 108:	c3                   	ret
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 1a                	jne    13b <strchr+0x2b>
 121:	eb 25                	jmp    148 <strchr+0x38>
 123:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12a:	00 
 12b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 130:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 134:	83 c0 01             	add    $0x1,%eax
 137:	84 d2                	test   %dl,%dl
 139:	74 0d                	je     148 <strchr+0x38>
    if(*s == c)
 13b:	38 d1                	cmp    %dl,%cl
 13d:	75 f1                	jne    130 <strchr+0x20>
      return (char*)s;
  return 0;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret
 141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 148:	31 c0                	xor    %eax,%eax
}
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 155:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 159:	31 db                	xor    %ebx,%ebx
{
 15b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 15e:	eb 27                	jmp    187 <gets+0x37>
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	6a 01                	push   $0x1
 165:	56                   	push   %esi
 166:	6a 00                	push   $0x0
 168:	e8 1e 01 00 00       	call   28b <read>
    if(cc < 1)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	7e 1d                	jle    191 <gets+0x41>
      break;
    buf[i++] = c;
 174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 178:	8b 55 08             	mov    0x8(%ebp),%edx
 17b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17f:	3c 0a                	cmp    $0xa,%al
 181:	74 10                	je     193 <gets+0x43>
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 0c                	je     193 <gets+0x43>
  for(i=0; i+1 < max; ){
 187:	89 df                	mov    %ebx,%edi
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 18f:	7c cf                	jl     160 <gets+0x10>
 191:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 19a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5f                   	pop    %edi
 1a0:	5d                   	pop    %ebp
 1a1:	c3                   	ret
 1a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1a9:	00 
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 00                	push   $0x0
 1ba:	ff 75 08             	push   0x8(%ebp)
 1bd:	e8 f1 00 00 00       	call   2b3 <open>
  if(fd < 0)
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 27                	js     1f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	ff 75 0c             	push   0xc(%ebp)
 1cf:	89 c3                	mov    %eax,%ebx
 1d1:	50                   	push   %eax
 1d2:	e8 f4 00 00 00       	call   2cb <fstat>
  close(fd);
 1d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1da:	89 c6                	mov    %eax,%esi
  close(fd);
 1dc:	e8 ba 00 00 00       	call   29b <close>
  return r;
 1e1:	83 c4 10             	add    $0x10,%esp
}
 1e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e7:	89 f0                	mov    %esi,%eax
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f5:	eb ed                	jmp    1e4 <stat+0x34>
 1f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fe:	00 
 1ff:	90                   	nop

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 207:	0f be 02             	movsbl (%edx),%eax
 20a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 20d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 210:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 215:	77 1e                	ja     235 <atoi+0x35>
 217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21e:	00 
 21f:	90                   	nop
    n = n*10 + *s++ - '0';
 220:	83 c2 01             	add    $0x1,%edx
 223:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 226:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 22a:	0f be 02             	movsbl (%edx),%eax
 22d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 230:	80 fb 09             	cmp    $0x9,%bl
 233:	76 eb                	jbe    220 <atoi+0x20>
  return n;
}
 235:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 238:	89 c8                	mov    %ecx,%eax
 23a:	c9                   	leave
 23b:	c3                   	ret
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 45 10             	mov    0x10(%ebp),%eax
 247:	8b 55 08             	mov    0x8(%ebp),%edx
 24a:	56                   	push   %esi
 24b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 24e:	85 c0                	test   %eax,%eax
 250:	7e 13                	jle    265 <memmove+0x25>
 252:	01 d0                	add    %edx,%eax
  dst = vdst;
 254:	89 d7                	mov    %edx,%edi
 256:	66 90                	xchg   %ax,%ax
 258:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25f:	00 
    *dst++ = *src++;
 260:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 261:	39 f8                	cmp    %edi,%eax
 263:	75 fb                	jne    260 <memmove+0x20>
  return vdst;
}
 265:	5e                   	pop    %esi
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret

0000026b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret

00000273 <exit>:
SYSCALL(exit)
 273:	b8 02 00 00 00       	mov    $0x2,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret

0000027b <wait>:
SYSCALL(wait)
 27b:	b8 03 00 00 00       	mov    $0x3,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret

00000283 <pipe>:
SYSCALL(pipe)
 283:	b8 04 00 00 00       	mov    $0x4,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret

0000028b <read>:
SYSCALL(read)
 28b:	b8 05 00 00 00       	mov    $0x5,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret

00000293 <write>:
SYSCALL(write)
 293:	b8 10 00 00 00       	mov    $0x10,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret

0000029b <close>:
SYSCALL(close)
 29b:	b8 15 00 00 00       	mov    $0x15,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret

000002a3 <kill>:
SYSCALL(kill)
 2a3:	b8 06 00 00 00       	mov    $0x6,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret

000002ab <exec>:
SYSCALL(exec)
 2ab:	b8 07 00 00 00       	mov    $0x7,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <open>:
SYSCALL(open)
 2b3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <mknod>:
SYSCALL(mknod)
 2bb:	b8 11 00 00 00       	mov    $0x11,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <unlink>:
SYSCALL(unlink)
 2c3:	b8 12 00 00 00       	mov    $0x12,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <fstat>:
SYSCALL(fstat)
 2cb:	b8 08 00 00 00       	mov    $0x8,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <link>:
SYSCALL(link)
 2d3:	b8 13 00 00 00       	mov    $0x13,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <mkdir>:
SYSCALL(mkdir)
 2db:	b8 14 00 00 00       	mov    $0x14,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <chdir>:
SYSCALL(chdir)
 2e3:	b8 09 00 00 00       	mov    $0x9,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <dup>:
SYSCALL(dup)
 2eb:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <getpid>:
SYSCALL(getpid)
 2f3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <sbrk>:
SYSCALL(sbrk)
 2fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <sleep>:
SYSCALL(sleep)
 303:	b8 0d 00 00 00       	mov    $0xd,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <uptime>:
SYSCALL(uptime)
 30b:	b8 0e 00 00 00       	mov    $0xe,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <ps>:
SYSCALL(ps)
 313:	b8 16 00 00 00       	mov    $0x16,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret
 31b:	66 90                	xchg   %ax,%ax
 31d:	66 90                	xchg   %ax,%ax
 31f:	90                   	nop

00000320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 328:	89 d1                	mov    %edx,%ecx
{
 32a:	83 ec 3c             	sub    $0x3c,%esp
 32d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 330:	85 d2                	test   %edx,%edx
 332:	0f 89 98 00 00 00    	jns    3d0 <printint+0xb0>
 338:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 33c:	0f 84 8e 00 00 00    	je     3d0 <printint+0xb0>
    x = -xx;
 342:	f7 d9                	neg    %ecx
    neg = 1;
 344:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 349:	89 45 c0             	mov    %eax,-0x40(%ebp)
 34c:	31 f6                	xor    %esi,%esi
 34e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 355:	00 
 356:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35d:	00 
 35e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 360:	89 c8                	mov    %ecx,%eax
 362:	31 d2                	xor    %edx,%edx
 364:	89 f7                	mov    %esi,%edi
 366:	f7 f3                	div    %ebx
 368:	8d 76 01             	lea    0x1(%esi),%esi
 36b:	0f b6 92 a8 07 00 00 	movzbl 0x7a8(%edx),%edx
 372:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 376:	89 ca                	mov    %ecx,%edx
 378:	89 c1                	mov    %eax,%ecx
 37a:	39 da                	cmp    %ebx,%edx
 37c:	73 e2                	jae    360 <printint+0x40>
  if(neg)
 37e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 381:	85 c0                	test   %eax,%eax
 383:	74 07                	je     38c <printint+0x6c>
    buf[i++] = '-';
 385:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 38a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 38c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 38f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 392:	01 df                	add    %ebx,%edi
 394:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39b:	00 
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3a0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3a3:	83 ec 04             	sub    $0x4,%esp
 3a6:	88 45 d7             	mov    %al,-0x29(%ebp)
 3a9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3ac:	6a 01                	push   $0x1
 3ae:	50                   	push   %eax
 3af:	56                   	push   %esi
 3b0:	e8 de fe ff ff       	call   293 <write>
  while(--i >= 0)
 3b5:	89 f8                	mov    %edi,%eax
 3b7:	83 c4 10             	add    $0x10,%esp
 3ba:	83 ef 01             	sub    $0x1,%edi
 3bd:	39 d8                	cmp    %ebx,%eax
 3bf:	75 df                	jne    3a0 <printint+0x80>
}
 3c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c4:	5b                   	pop    %ebx
 3c5:	5e                   	pop    %esi
 3c6:	5f                   	pop    %edi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3d0:	31 c0                	xor    %eax,%eax
 3d2:	e9 72 ff ff ff       	jmp    349 <printint+0x29>
 3d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3de:	00 
 3df:	90                   	nop

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 3ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 3ef:	0f b6 13             	movzbl (%ebx),%edx
 3f2:	83 c3 01             	add    $0x1,%ebx
 3f5:	84 d2                	test   %dl,%dl
 3f7:	0f 84 a0 00 00 00    	je     49d <printf+0xbd>
 3fd:	8d 45 10             	lea    0x10(%ebp),%eax
 400:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 403:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 406:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 409:	eb 28                	jmp    433 <printf+0x53>
 40b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 410:	83 ec 04             	sub    $0x4,%esp
 413:	8d 45 e7             	lea    -0x19(%ebp),%eax
 416:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 419:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 41c:	6a 01                	push   $0x1
 41e:	50                   	push   %eax
 41f:	56                   	push   %esi
 420:	e8 6e fe ff ff       	call   293 <write>
  for(i = 0; fmt[i]; i++){
 425:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 429:	83 c4 10             	add    $0x10,%esp
 42c:	84 d2                	test   %dl,%dl
 42e:	74 6d                	je     49d <printf+0xbd>
    c = fmt[i] & 0xff;
 430:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 433:	83 f8 25             	cmp    $0x25,%eax
 436:	75 d8                	jne    410 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 438:	0f b6 13             	movzbl (%ebx),%edx
 43b:	84 d2                	test   %dl,%dl
 43d:	74 5e                	je     49d <printf+0xbd>
    c = fmt[i] & 0xff;
 43f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 442:	80 fa 25             	cmp    $0x25,%dl
 445:	0f 84 1d 01 00 00    	je     568 <printf+0x188>
 44b:	83 e8 63             	sub    $0x63,%eax
 44e:	83 f8 15             	cmp    $0x15,%eax
 451:	77 0d                	ja     460 <printf+0x80>
 453:	ff 24 85 50 07 00 00 	jmp    *0x750(,%eax,4)
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 460:	83 ec 04             	sub    $0x4,%esp
 463:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 466:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 469:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 46d:	6a 01                	push   $0x1
 46f:	51                   	push   %ecx
 470:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 473:	56                   	push   %esi
 474:	e8 1a fe ff ff       	call   293 <write>
        putc(fd, c);
 479:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 47d:	83 c4 0c             	add    $0xc,%esp
 480:	88 55 e7             	mov    %dl,-0x19(%ebp)
 483:	6a 01                	push   $0x1
 485:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 488:	51                   	push   %ecx
 489:	56                   	push   %esi
 48a:	e8 04 fe ff ff       	call   293 <write>
  for(i = 0; fmt[i]; i++){
 48f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 493:	83 c3 02             	add    $0x2,%ebx
 496:	83 c4 10             	add    $0x10,%esp
 499:	84 d2                	test   %dl,%dl
 49b:	75 93                	jne    430 <printf+0x50>
      }
      state = 0;
    }
  }
}
 49d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a0:	5b                   	pop    %ebx
 4a1:	5e                   	pop    %esi
 4a2:	5f                   	pop    %edi
 4a3:	5d                   	pop    %ebp
 4a4:	c3                   	ret
 4a5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4a8:	83 ec 0c             	sub    $0xc,%esp
 4ab:	8b 17                	mov    (%edi),%edx
 4ad:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b2:	89 f0                	mov    %esi,%eax
 4b4:	6a 00                	push   $0x0
        ap++;
 4b6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 4b9:	e8 62 fe ff ff       	call   320 <printint>
  for(i = 0; fmt[i]; i++){
 4be:	eb cf                	jmp    48f <printf+0xaf>
        s = (char*)*ap;
 4c0:	8b 07                	mov    (%edi),%eax
        ap++;
 4c2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 4c5:	85 c0                	test   %eax,%eax
 4c7:	0f 84 b3 00 00 00    	je     580 <printf+0x1a0>
        while(*s != 0){
 4cd:	0f b6 10             	movzbl (%eax),%edx
 4d0:	84 d2                	test   %dl,%dl
 4d2:	0f 84 ba 00 00 00    	je     592 <printf+0x1b2>
 4d8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4db:	89 c7                	mov    %eax,%edi
 4dd:	89 d0                	mov    %edx,%eax
 4df:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 4e2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4e5:	89 fb                	mov    %edi,%ebx
 4e7:	89 cf                	mov    %ecx,%edi
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 4f6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4f9:	6a 01                	push   $0x1
 4fb:	57                   	push   %edi
 4fc:	56                   	push   %esi
 4fd:	e8 91 fd ff ff       	call   293 <write>
        while(*s != 0){
 502:	0f b6 03             	movzbl (%ebx),%eax
 505:	83 c4 10             	add    $0x10,%esp
 508:	84 c0                	test   %al,%al
 50a:	75 e4                	jne    4f0 <printf+0x110>
 50c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 50f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 513:	83 c3 02             	add    $0x2,%ebx
 516:	84 d2                	test   %dl,%dl
 518:	0f 85 e5 fe ff ff    	jne    403 <printf+0x23>
 51e:	e9 7a ff ff ff       	jmp    49d <printf+0xbd>
 523:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 528:	83 ec 0c             	sub    $0xc,%esp
 52b:	8b 17                	mov    (%edi),%edx
 52d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 532:	89 f0                	mov    %esi,%eax
 534:	6a 01                	push   $0x1
        ap++;
 536:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 539:	e8 e2 fd ff ff       	call   320 <printint>
  for(i = 0; fmt[i]; i++){
 53e:	e9 4c ff ff ff       	jmp    48f <printf+0xaf>
 543:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 548:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 54a:	83 ec 04             	sub    $0x4,%esp
 54d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 550:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 553:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 556:	6a 01                	push   $0x1
 558:	51                   	push   %ecx
 559:	56                   	push   %esi
 55a:	e8 34 fd ff ff       	call   293 <write>
  for(i = 0; fmt[i]; i++){
 55f:	e9 2b ff ff ff       	jmp    48f <printf+0xaf>
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 568:	83 ec 04             	sub    $0x4,%esp
 56b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 56e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 571:	6a 01                	push   $0x1
 573:	e9 10 ff ff ff       	jmp    488 <printf+0xa8>
 578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57f:	00 
          s = "(null)";
 580:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 583:	b8 28 00 00 00       	mov    $0x28,%eax
 588:	bf 48 07 00 00       	mov    $0x748,%edi
 58d:	e9 4d ff ff ff       	jmp    4df <printf+0xff>
  for(i = 0; fmt[i]; i++){
 592:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 596:	83 c3 02             	add    $0x2,%ebx
 599:	84 d2                	test   %dl,%dl
 59b:	0f 85 8f fe ff ff    	jne    430 <printf+0x50>
 5a1:	e9 f7 fe ff ff       	jmp    49d <printf+0xbd>
 5a6:	66 90                	xchg   %ax,%ax
 5a8:	66 90                	xchg   %ax,%ax
 5aa:	66 90                	xchg   %ax,%ax
 5ac:	66 90                	xchg   %ax,%ax
 5ae:	66 90                	xchg   %ax,%ax
 5b0:	66 90                	xchg   %ax,%ax
 5b2:	66 90                	xchg   %ax,%ax
 5b4:	66 90                	xchg   %ax,%ax
 5b6:	66 90                	xchg   %ax,%ax
 5b8:	66 90                	xchg   %ax,%ax
 5ba:	66 90                	xchg   %ax,%ax
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 bc 07 00 00       	mov    0x7bc,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5d8:	00 
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e0:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e2:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e4:	39 ca                	cmp    %ecx,%edx
 5e6:	73 30                	jae    618 <free+0x58>
 5e8:	39 c1                	cmp    %eax,%ecx
 5ea:	72 04                	jb     5f0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ec:	39 c2                	cmp    %eax,%edx
 5ee:	72 f0                	jb     5e0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f6:	39 f8                	cmp    %edi,%eax
 5f8:	74 36                	je     630 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5fa:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5fd:	8b 42 04             	mov    0x4(%edx),%eax
 600:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 603:	39 f1                	cmp    %esi,%ecx
 605:	74 40                	je     647 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 607:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 609:	5b                   	pop    %ebx
  freep = p;
 60a:	89 15 bc 07 00 00    	mov    %edx,0x7bc
}
 610:	5e                   	pop    %esi
 611:	5f                   	pop    %edi
 612:	5d                   	pop    %ebp
 613:	c3                   	ret
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 618:	39 c2                	cmp    %eax,%edx
 61a:	72 c4                	jb     5e0 <free+0x20>
 61c:	39 c1                	cmp    %eax,%ecx
 61e:	73 c0                	jae    5e0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 620:	8b 73 fc             	mov    -0x4(%ebx),%esi
 623:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 626:	39 f8                	cmp    %edi,%eax
 628:	75 d0                	jne    5fa <free+0x3a>
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 630:	03 70 04             	add    0x4(%eax),%esi
 633:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 636:	8b 02                	mov    (%edx),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 63d:	8b 42 04             	mov    0x4(%edx),%eax
 640:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 643:	39 f1                	cmp    %esi,%ecx
 645:	75 c0                	jne    607 <free+0x47>
    p->s.size += bp->s.size;
 647:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 64a:	89 15 bc 07 00 00    	mov    %edx,0x7bc
    p->s.size += bp->s.size;
 650:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 653:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 656:	89 0a                	mov    %ecx,(%edx)
}
 658:	5b                   	pop    %ebx
 659:	5e                   	pop    %esi
 65a:	5f                   	pop    %edi
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 66c:	8b 15 bc 07 00 00    	mov    0x7bc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 672:	8d 78 07             	lea    0x7(%eax),%edi
 675:	c1 ef 03             	shr    $0x3,%edi
 678:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 67b:	85 d2                	test   %edx,%edx
 67d:	0f 84 8d 00 00 00    	je     710 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 683:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 685:	8b 48 04             	mov    0x4(%eax),%ecx
 688:	39 f9                	cmp    %edi,%ecx
 68a:	73 64                	jae    6f0 <malloc+0x90>
  if(nu < 4096)
 68c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 691:	39 df                	cmp    %ebx,%edi
 693:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 696:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 69d:	eb 0a                	jmp    6a9 <malloc+0x49>
 69f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6a2:	8b 48 04             	mov    0x4(%eax),%ecx
 6a5:	39 f9                	cmp    %edi,%ecx
 6a7:	73 47                	jae    6f0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a9:	89 c2                	mov    %eax,%edx
 6ab:	39 05 bc 07 00 00    	cmp    %eax,0x7bc
 6b1:	75 ed                	jne    6a0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 6b3:	83 ec 0c             	sub    $0xc,%esp
 6b6:	56                   	push   %esi
 6b7:	e8 3f fc ff ff       	call   2fb <sbrk>
  if(p == (char*)-1)
 6bc:	83 c4 10             	add    $0x10,%esp
 6bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c2:	74 1c                	je     6e0 <malloc+0x80>
  hp->s.size = nu;
 6c4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c7:	83 ec 0c             	sub    $0xc,%esp
 6ca:	83 c0 08             	add    $0x8,%eax
 6cd:	50                   	push   %eax
 6ce:	e8 ed fe ff ff       	call   5c0 <free>
  return freep;
 6d3:	8b 15 bc 07 00 00    	mov    0x7bc,%edx
      if((p = morecore(nunits)) == 0)
 6d9:	83 c4 10             	add    $0x10,%esp
 6dc:	85 d2                	test   %edx,%edx
 6de:	75 c0                	jne    6a0 <malloc+0x40>
        return 0;
  }
}
 6e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6e3:	31 c0                	xor    %eax,%eax
}
 6e5:	5b                   	pop    %ebx
 6e6:	5e                   	pop    %esi
 6e7:	5f                   	pop    %edi
 6e8:	5d                   	pop    %ebp
 6e9:	c3                   	ret
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6f0:	39 cf                	cmp    %ecx,%edi
 6f2:	74 4c                	je     740 <malloc+0xe0>
        p->s.size -= nunits;
 6f4:	29 f9                	sub    %edi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6fc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6ff:	89 15 bc 07 00 00    	mov    %edx,0x7bc
}
 705:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 708:	83 c0 08             	add    $0x8,%eax
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 bc 07 00 00 c0 	movl   $0x7c0,0x7bc
 717:	07 00 00 
    base.s.size = 0;
 71a:	b8 c0 07 00 00       	mov    $0x7c0,%eax
    base.s.ptr = freep = prevp = &base;
 71f:	c7 05 c0 07 00 00 c0 	movl   $0x7c0,0x7c0
 726:	07 00 00 
    base.s.size = 0;
 729:	c7 05 c4 07 00 00 00 	movl   $0x0,0x7c4
 730:	00 00 00 
    if(p->s.size >= nunits){
 733:	e9 54 ff ff ff       	jmp    68c <malloc+0x2c>
 738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 73f:	00 
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b9                	jmp    6ff <malloc+0x9f>
