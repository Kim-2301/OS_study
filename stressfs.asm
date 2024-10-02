
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	push   -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2b:	68 68 08 00 00       	push   $0x868
  30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 b5 04 00 00       	call   500 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 b5 01 00 00       	call   210 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 28 03 00 00       	call   38b <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  81:	68 7b 08 00 00       	push   $0x87b
  86:	6a 01                	push   $0x1
  88:	e8 73 04 00 00       	call   500 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  8f:	5f                   	pop    %edi
  path[8] += i;
  90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 2b 03 00 00       	call   3d3 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 f4 02 00 00       	call   3b3 <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 eb 02 00 00       	call   3bb <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 85 08 00 00       	push   $0x885
  d7:	6a 01                	push   $0x1
  d9:	e8 22 04 00 00       	call   500 <printf>

  fd = open(path, O_RDONLY);
  de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e4:	59                   	pop    %ecx
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	bb 14 00 00 00       	mov    $0x14,%ebx
  ed:	50                   	push   %eax
  ee:	e8 e0 02 00 00       	call   3d3 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
  f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ff:	00 
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 9c 02 00 00       	call   3ab <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 9b 02 00 00       	call   3bb <close>

  wait();
 120:	e8 76 02 00 00       	call   39b <wait>

  exit();
 125:	e8 69 02 00 00       	call   393 <exit>
  path[8] += i;
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave
 164:	c3                   	ret
 165:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16c:	00 
 16d:	8d 76 00             	lea    0x0(%esi),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 2f                	jne    1b0 <strcmp+0x40>
 181:	eb 4a                	jmp    1cd <strcmp+0x5d>
 183:	eb 1b                	jmp    1a0 <strcmp+0x30>
 185:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18c:	00 
 18d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 194:	00 
 195:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19c:	00 
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1a4:	83 c2 01             	add    $0x1,%edx
 1a7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1aa:	84 c0                	test   %al,%al
 1ac:	74 12                	je     1c0 <strcmp+0x50>
 1ae:	89 d9                	mov    %ebx,%ecx
 1b0:	0f b6 19             	movzbl (%ecx),%ebx
 1b3:	38 c3                	cmp    %al,%bl
 1b5:	74 e9                	je     1a0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 1b7:	29 d8                	sub    %ebx,%eax
}
 1b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bc:	c9                   	leave
 1bd:	c3                   	ret
 1be:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1c4:	31 c0                	xor    %eax,%eax
 1c6:	29 d8                	sub    %ebx,%eax
}
 1c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1cb:	c9                   	leave
 1cc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1cd:	0f b6 19             	movzbl (%ecx),%ebx
 1d0:	31 c0                	xor    %eax,%eax
 1d2:	eb e3                	jmp    1b7 <strcmp+0x47>
 1d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1db:	00 
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1e6:	80 3a 00             	cmpb   $0x0,(%edx)
 1e9:	74 15                	je     200 <strlen+0x20>
 1eb:	31 c0                	xor    %eax,%eax
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c0 01             	add    $0x1,%eax
 1f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1f7:	89 c1                	mov    %eax,%ecx
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	89 c8                	mov    %ecx,%eax
 1fd:	5d                   	pop    %ebp
 1fe:	c3                   	ret
 1ff:	90                   	nop
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret
 206:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20d:	00 
 20e:	66 90                	xchg   %ax,%ax

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld
 220:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 222:	8b 7d fc             	mov    -0x4(%ebp),%edi
 225:	89 d0                	mov    %edx,%eax
 227:	c9                   	leave
 228:	c3                   	ret
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23a:	0f b6 10             	movzbl (%eax),%edx
 23d:	84 d2                	test   %dl,%dl
 23f:	75 1a                	jne    25b <strchr+0x2b>
 241:	eb 25                	jmp    268 <strchr+0x38>
 243:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24a:	00 
 24b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 254:	83 c0 01             	add    $0x1,%eax
 257:	84 d2                	test   %dl,%dl
 259:	74 0d                	je     268 <strchr+0x38>
    if(*s == c)
 25b:	38 d1                	cmp    %dl,%cl
 25d:	75 f1                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 268:	31 c0                	xor    %eax,%eax
}
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 275:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 278:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 279:	31 db                	xor    %ebx,%ebx
{
 27b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 27e:	eb 27                	jmp    2a7 <gets+0x37>
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	6a 01                	push   $0x1
 285:	56                   	push   %esi
 286:	6a 00                	push   $0x0
 288:	e8 1e 01 00 00       	call   3ab <read>
    if(cc < 1)
 28d:	83 c4 10             	add    $0x10,%esp
 290:	85 c0                	test   %eax,%eax
 292:	7e 1d                	jle    2b1 <gets+0x41>
      break;
    buf[i++] = c;
 294:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 298:	8b 55 08             	mov    0x8(%ebp),%edx
 29b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 29f:	3c 0a                	cmp    $0xa,%al
 2a1:	74 10                	je     2b3 <gets+0x43>
 2a3:	3c 0d                	cmp    $0xd,%al
 2a5:	74 0c                	je     2b3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2a7:	89 df                	mov    %ebx,%edi
 2a9:	83 c3 01             	add    $0x1,%ebx
 2ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2af:	7c cf                	jl     280 <gets+0x10>
 2b1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5f                   	pop    %edi
 2c0:	5d                   	pop    %ebp
 2c1:	c3                   	ret
 2c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2c9:	00 
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 f1 00 00 00       	call   3d3 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f4 00 00 00       	call   3eb <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 ba 00 00 00       	call   3bb <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31e:	00 
 31f:	90                   	nop

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33e:	00 
 33f:	90                   	nop
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave
 35b:	c3                   	ret
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	66 90                	xchg   %ax,%ax
 378:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37f:	00 
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <exit>:
SYSCALL(exit)
 393:	b8 02 00 00 00       	mov    $0x2,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <wait>:
SYSCALL(wait)
 39b:	b8 03 00 00 00       	mov    $0x3,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <pipe>:
SYSCALL(pipe)
 3a3:	b8 04 00 00 00       	mov    $0x4,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <read>:
SYSCALL(read)
 3ab:	b8 05 00 00 00       	mov    $0x5,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <write>:
SYSCALL(write)
 3b3:	b8 10 00 00 00       	mov    $0x10,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <close>:
SYSCALL(close)
 3bb:	b8 15 00 00 00       	mov    $0x15,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <kill>:
SYSCALL(kill)
 3c3:	b8 06 00 00 00       	mov    $0x6,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <exec>:
SYSCALL(exec)
 3cb:	b8 07 00 00 00       	mov    $0x7,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <open>:
SYSCALL(open)
 3d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <mknod>:
SYSCALL(mknod)
 3db:	b8 11 00 00 00       	mov    $0x11,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <unlink>:
SYSCALL(unlink)
 3e3:	b8 12 00 00 00       	mov    $0x12,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <fstat>:
SYSCALL(fstat)
 3eb:	b8 08 00 00 00       	mov    $0x8,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <link>:
SYSCALL(link)
 3f3:	b8 13 00 00 00       	mov    $0x13,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret

000003fb <mkdir>:
SYSCALL(mkdir)
 3fb:	b8 14 00 00 00       	mov    $0x14,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret

00000403 <chdir>:
SYSCALL(chdir)
 403:	b8 09 00 00 00       	mov    $0x9,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret

0000040b <dup>:
SYSCALL(dup)
 40b:	b8 0a 00 00 00       	mov    $0xa,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret

00000413 <getpid>:
SYSCALL(getpid)
 413:	b8 0b 00 00 00       	mov    $0xb,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret

0000041b <sbrk>:
SYSCALL(sbrk)
 41b:	b8 0c 00 00 00       	mov    $0xc,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret

00000423 <sleep>:
SYSCALL(sleep)
 423:	b8 0d 00 00 00       	mov    $0xd,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret

0000042b <uptime>:
SYSCALL(uptime)
 42b:	b8 0e 00 00 00       	mov    $0xe,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret

00000433 <ps>:
SYSCALL(ps)
 433:	b8 16 00 00 00       	mov    $0x16,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 448:	89 d1                	mov    %edx,%ecx
{
 44a:	83 ec 3c             	sub    $0x3c,%esp
 44d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 450:	85 d2                	test   %edx,%edx
 452:	0f 89 98 00 00 00    	jns    4f0 <printint+0xb0>
 458:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45c:	0f 84 8e 00 00 00    	je     4f0 <printint+0xb0>
    x = -xx;
 462:	f7 d9                	neg    %ecx
    neg = 1;
 464:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 469:	89 45 c0             	mov    %eax,-0x40(%ebp)
 46c:	31 f6                	xor    %esi,%esi
 46e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 475:	00 
 476:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 47d:	00 
 47e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	31 d2                	xor    %edx,%edx
 484:	89 f7                	mov    %esi,%edi
 486:	f7 f3                	div    %ebx
 488:	8d 76 01             	lea    0x1(%esi),%esi
 48b:	0f b6 92 ec 08 00 00 	movzbl 0x8ec(%edx),%edx
 492:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 496:	89 ca                	mov    %ecx,%edx
 498:	89 c1                	mov    %eax,%ecx
 49a:	39 da                	cmp    %ebx,%edx
 49c:	73 e2                	jae    480 <printint+0x40>
  if(neg)
 49e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 4a1:	85 c0                	test   %eax,%eax
 4a3:	74 07                	je     4ac <printint+0x6c>
    buf[i++] = '-';
 4a5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 4aa:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 4ac:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4af:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 4b2:	01 df                	add    %ebx,%edi
 4b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4bb:	00 
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4c0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4c3:	83 ec 04             	sub    $0x4,%esp
 4c6:	88 45 d7             	mov    %al,-0x29(%ebp)
 4c9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4cc:	6a 01                	push   $0x1
 4ce:	50                   	push   %eax
 4cf:	56                   	push   %esi
 4d0:	e8 de fe ff ff       	call   3b3 <write>
  while(--i >= 0)
 4d5:	89 f8                	mov    %edi,%eax
 4d7:	83 c4 10             	add    $0x10,%esp
 4da:	83 ef 01             	sub    $0x1,%edi
 4dd:	39 d8                	cmp    %ebx,%eax
 4df:	75 df                	jne    4c0 <printint+0x80>
}
 4e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e4:	5b                   	pop    %ebx
 4e5:	5e                   	pop    %esi
 4e6:	5f                   	pop    %edi
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f0:	31 c0                	xor    %eax,%eax
 4f2:	e9 72 ff ff ff       	jmp    469 <printint+0x29>
 4f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4fe:	00 
 4ff:	90                   	nop

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 509:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 50c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 50f:	0f b6 13             	movzbl (%ebx),%edx
 512:	83 c3 01             	add    $0x1,%ebx
 515:	84 d2                	test   %dl,%dl
 517:	0f 84 a0 00 00 00    	je     5bd <printf+0xbd>
 51d:	8d 45 10             	lea    0x10(%ebp),%eax
 520:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 523:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 526:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 529:	eb 28                	jmp    553 <printf+0x53>
 52b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	8d 45 e7             	lea    -0x19(%ebp),%eax
 536:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 539:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 53c:	6a 01                	push   $0x1
 53e:	50                   	push   %eax
 53f:	56                   	push   %esi
 540:	e8 6e fe ff ff       	call   3b3 <write>
  for(i = 0; fmt[i]; i++){
 545:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 549:	83 c4 10             	add    $0x10,%esp
 54c:	84 d2                	test   %dl,%dl
 54e:	74 6d                	je     5bd <printf+0xbd>
    c = fmt[i] & 0xff;
 550:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	75 d8                	jne    530 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 558:	0f b6 13             	movzbl (%ebx),%edx
 55b:	84 d2                	test   %dl,%dl
 55d:	74 5e                	je     5bd <printf+0xbd>
    c = fmt[i] & 0xff;
 55f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 562:	80 fa 25             	cmp    $0x25,%dl
 565:	0f 84 1d 01 00 00    	je     688 <printf+0x188>
 56b:	83 e8 63             	sub    $0x63,%eax
 56e:	83 f8 15             	cmp    $0x15,%eax
 571:	77 0d                	ja     580 <printf+0x80>
 573:	ff 24 85 94 08 00 00 	jmp    *0x894(,%eax,4)
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 586:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 589:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 58d:	6a 01                	push   $0x1
 58f:	51                   	push   %ecx
 590:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 593:	56                   	push   %esi
 594:	e8 1a fe ff ff       	call   3b3 <write>
        putc(fd, c);
 599:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 59d:	83 c4 0c             	add    $0xc,%esp
 5a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5a3:	6a 01                	push   $0x1
 5a5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 5a8:	51                   	push   %ecx
 5a9:	56                   	push   %esi
 5aa:	e8 04 fe ff ff       	call   3b3 <write>
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 5b3:	83 c3 02             	add    $0x2,%ebx
 5b6:	83 c4 10             	add    $0x10,%esp
 5b9:	84 d2                	test   %dl,%dl
 5bb:	75 93                	jne    550 <printf+0x50>
      }
      state = 0;
    }
  }
}
 5bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c0:	5b                   	pop    %ebx
 5c1:	5e                   	pop    %esi
 5c2:	5f                   	pop    %edi
 5c3:	5d                   	pop    %ebp
 5c4:	c3                   	ret
 5c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	8b 17                	mov    (%edi),%edx
 5cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d2:	89 f0                	mov    %esi,%eax
 5d4:	6a 00                	push   $0x0
        ap++;
 5d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 5d9:	e8 62 fe ff ff       	call   440 <printint>
  for(i = 0; fmt[i]; i++){
 5de:	eb cf                	jmp    5af <printf+0xaf>
        s = (char*)*ap;
 5e0:	8b 07                	mov    (%edi),%eax
        ap++;
 5e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 5e5:	85 c0                	test   %eax,%eax
 5e7:	0f 84 b3 00 00 00    	je     6a0 <printf+0x1a0>
        while(*s != 0){
 5ed:	0f b6 10             	movzbl (%eax),%edx
 5f0:	84 d2                	test   %dl,%dl
 5f2:	0f 84 ba 00 00 00    	je     6b2 <printf+0x1b2>
 5f8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5fb:	89 c7                	mov    %eax,%edi
 5fd:	89 d0                	mov    %edx,%eax
 5ff:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 602:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 605:	89 fb                	mov    %edi,%ebx
 607:	89 cf                	mov    %ecx,%edi
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 616:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 619:	6a 01                	push   $0x1
 61b:	57                   	push   %edi
 61c:	56                   	push   %esi
 61d:	e8 91 fd ff ff       	call   3b3 <write>
        while(*s != 0){
 622:	0f b6 03             	movzbl (%ebx),%eax
 625:	83 c4 10             	add    $0x10,%esp
 628:	84 c0                	test   %al,%al
 62a:	75 e4                	jne    610 <printf+0x110>
 62c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 633:	83 c3 02             	add    $0x2,%ebx
 636:	84 d2                	test   %dl,%dl
 638:	0f 85 e5 fe ff ff    	jne    523 <printf+0x23>
 63e:	e9 7a ff ff ff       	jmp    5bd <printf+0xbd>
 643:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 648:	83 ec 0c             	sub    $0xc,%esp
 64b:	8b 17                	mov    (%edi),%edx
 64d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 652:	89 f0                	mov    %esi,%eax
 654:	6a 01                	push   $0x1
        ap++;
 656:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 659:	e8 e2 fd ff ff       	call   440 <printint>
  for(i = 0; fmt[i]; i++){
 65e:	e9 4c ff ff ff       	jmp    5af <printf+0xaf>
 663:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 668:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 66a:	83 ec 04             	sub    $0x4,%esp
 66d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 670:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 673:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 676:	6a 01                	push   $0x1
 678:	51                   	push   %ecx
 679:	56                   	push   %esi
 67a:	e8 34 fd ff ff       	call   3b3 <write>
  for(i = 0; fmt[i]; i++){
 67f:	e9 2b ff ff ff       	jmp    5af <printf+0xaf>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 688:	83 ec 04             	sub    $0x4,%esp
 68b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 68e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 691:	6a 01                	push   $0x1
 693:	e9 10 ff ff ff       	jmp    5a8 <printf+0xa8>
 698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69f:	00 
          s = "(null)";
 6a0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6a3:	b8 28 00 00 00       	mov    $0x28,%eax
 6a8:	bf 8b 08 00 00       	mov    $0x88b,%edi
 6ad:	e9 4d ff ff ff       	jmp    5ff <printf+0xff>
  for(i = 0; fmt[i]; i++){
 6b2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6b6:	83 c3 02             	add    $0x2,%ebx
 6b9:	84 d2                	test   %dl,%dl
 6bb:	0f 85 8f fe ff ff    	jne    550 <printf+0x50>
 6c1:	e9 f7 fe ff ff       	jmp    5bd <printf+0xbd>
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	66 90                	xchg   %ax,%ax
 6d2:	66 90                	xchg   %ax,%ax
 6d4:	66 90                	xchg   %ax,%ax
 6d6:	66 90                	xchg   %ax,%ax
 6d8:	66 90                	xchg   %ax,%ax
 6da:	66 90                	xchg   %ax,%ax
 6dc:	66 90                	xchg   %ax,%ax
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 00 09 00 00       	mov    0x900,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6f8:	00 
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 700:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 702:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 704:	39 ca                	cmp    %ecx,%edx
 706:	73 30                	jae    738 <free+0x58>
 708:	39 c1                	cmp    %eax,%ecx
 70a:	72 04                	jb     710 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70c:	39 c2                	cmp    %eax,%edx
 70e:	72 f0                	jb     700 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 710:	8b 73 fc             	mov    -0x4(%ebx),%esi
 713:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 716:	39 f8                	cmp    %edi,%eax
 718:	74 36                	je     750 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 71a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 71d:	8b 42 04             	mov    0x4(%edx),%eax
 720:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 723:	39 f1                	cmp    %esi,%ecx
 725:	74 40                	je     767 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 727:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 729:	5b                   	pop    %ebx
  freep = p;
 72a:	89 15 00 09 00 00    	mov    %edx,0x900
}
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 738:	39 c2                	cmp    %eax,%edx
 73a:	72 c4                	jb     700 <free+0x20>
 73c:	39 c1                	cmp    %eax,%ecx
 73e:	73 c0                	jae    700 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 746:	39 f8                	cmp    %edi,%eax
 748:	75 d0                	jne    71a <free+0x3a>
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 750:	03 70 04             	add    0x4(%eax),%esi
 753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 02                	mov    (%edx),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 42 04             	mov    0x4(%edx),%eax
 760:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	75 c0                	jne    727 <free+0x47>
    p->s.size += bp->s.size;
 767:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 76a:	89 15 00 09 00 00    	mov    %edx,0x900
    p->s.size += bp->s.size;
 770:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 773:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 776:	89 0a                	mov    %ecx,(%edx)
}
 778:	5b                   	pop    %ebx
 779:	5e                   	pop    %esi
 77a:	5f                   	pop    %edi
 77b:	5d                   	pop    %ebp
 77c:	c3                   	ret
 77d:	8d 76 00             	lea    0x0(%esi),%esi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 00 09 00 00    	mov    0x900,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 8d 00 00 00    	je     830 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 f9                	cmp    %edi,%ecx
 7aa:	73 64                	jae    810 <malloc+0x90>
  if(nu < 4096)
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 df                	cmp    %ebx,%edi
 7b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7bd:	eb 0a                	jmp    7c9 <malloc+0x49>
 7bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c2:	8b 48 04             	mov    0x4(%eax),%ecx
 7c5:	39 f9                	cmp    %edi,%ecx
 7c7:	73 47                	jae    810 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c9:	89 c2                	mov    %eax,%edx
 7cb:	39 05 00 09 00 00    	cmp    %eax,0x900
 7d1:	75 ed                	jne    7c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	56                   	push   %esi
 7d7:	e8 3f fc ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 7dc:	83 c4 10             	add    $0x10,%esp
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 1c                	je     800 <malloc+0x80>
  hp->s.size = nu;
 7e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	83 c0 08             	add    $0x8,%eax
 7ed:	50                   	push   %eax
 7ee:	e8 ed fe ff ff       	call   6e0 <free>
  return freep;
 7f3:	8b 15 00 09 00 00    	mov    0x900,%edx
      if((p = morecore(nunits)) == 0)
 7f9:	83 c4 10             	add    $0x10,%esp
 7fc:	85 d2                	test   %edx,%edx
 7fe:	75 c0                	jne    7c0 <malloc+0x40>
        return 0;
  }
}
 800:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 803:	31 c0                	xor    %eax,%eax
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 4c                	je     860 <malloc+0xe0>
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 81f:	89 15 00 09 00 00    	mov    %edx,0x900
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 00 09 00 00 04 	movl   $0x904,0x900
 837:	09 00 00 
    base.s.size = 0;
 83a:	b8 04 09 00 00       	mov    $0x904,%eax
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 04 09 00 00 04 	movl   $0x904,0x904
 846:	09 00 00 
    base.s.size = 0;
 849:	c7 05 08 09 00 00 00 	movl   $0x0,0x908
 850:	00 00 00 
    if(p->s.size >= nunits){
 853:	e9 54 ff ff ff       	jmp    7ac <malloc+0x2c>
 858:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 85f:	00 
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0x9f>
