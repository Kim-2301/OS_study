
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 71 04             	mov    0x4(%ecx),%esi
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	7e 58                	jle    7e <main+0x7e>
  26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2d:	00 
  2e:	66 90                	xchg   %ax,%ax
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 34 be             	push   (%esi,%edi,4)
  38:	e8 d6 03 00 00       	call   413 <open>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	89 c3                	mov    %eax,%ebx
      printf(1, "wc: cannot open %s\n", argv[i]);
  42:	8b 04 be             	mov    (%esi,%edi,4),%eax
    if((fd = open(argv[i], 0)) < 0){
  45:	85 db                	test   %ebx,%ebx
  47:	78 22                	js     6b <main+0x6b>
      exit();
    }
    wc(fd, argv[i]);
  49:	83 ec 08             	sub    $0x8,%esp
  for(i = 1; i < argc; i++){
  4c:	83 c7 01             	add    $0x1,%edi
    wc(fd, argv[i]);
  4f:	50                   	push   %eax
  50:	53                   	push   %ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 1c 24             	mov    %ebx,(%esp)
  59:	e8 9d 03 00 00       	call   3fb <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 68 03 00 00       	call   3d3 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	52                   	push   %edx
  6c:	50                   	push   %eax
  6d:	68 cb 08 00 00       	push   $0x8cb
  72:	6a 01                	push   $0x1
  74:	e8 c7 04 00 00       	call   540 <printf>
      exit();
  79:	e8 55 03 00 00       	call   3d3 <exit>
    wc(0, "");
  7e:	51                   	push   %ecx
  7f:	51                   	push   %ecx
  80:	68 bd 08 00 00       	push   $0x8bd
  85:	6a 00                	push   $0x0
  87:	e8 14 00 00 00       	call   a0 <wc>
    exit();
  8c:	e8 42 03 00 00       	call   3d3 <exit>
  91:	66 90                	xchg   %ax,%ax
  93:	66 90                	xchg   %ax,%ax
  95:	66 90                	xchg   %ax,%ax
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  l = w = c = 0;
  a1:	31 d2                	xor    %edx,%edx
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	57                   	push   %edi
  a6:	56                   	push   %esi
  inword = 0;
  a7:	31 f6                	xor    %esi,%esi
{
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 60 09 00 00       	push   $0x960
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 16 03 00 00       	call   3eb <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c1                	mov    %eax,%ecx
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  e1:	31 ff                	xor    %edi,%edi
  e3:	eb 0d                	jmp    f2 <wc+0x52>
  e5:	8d 76 00             	lea    0x0(%esi),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3e                	je     130 <wc+0x90>
      if(buf[i] == '\n')
  f2:	0f be 87 60 09 00 00 	movsbl 0x960(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
        l++;
 104:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 106:	68 a8 08 00 00       	push   $0x8a8
 10b:	e8 60 01 00 00       	call   270 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 cf                	jne    ea <wc+0x4a>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 11f:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 124:	83 c7 01             	add    $0x1,%edi
 127:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 133:	01 4d dc             	add    %ecx,-0x24(%ebp)
 136:	eb 88                	jmp    c0 <wc+0x20>
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 
  if(n < 0){
 140:	8b 55 dc             	mov    -0x24(%ebp),%edx
 143:	75 22                	jne    167 <wc+0xc7>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 145:	83 ec 08             	sub    $0x8,%esp
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	52                   	push   %edx
 14c:	ff 75 e0             	push   -0x20(%ebp)
 14f:	53                   	push   %ebx
 150:	68 be 08 00 00       	push   $0x8be
 155:	6a 01                	push   $0x1
 157:	e8 e4 03 00 00       	call   540 <printf>
}
 15c:	83 c4 20             	add    $0x20,%esp
 15f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 162:	5b                   	pop    %ebx
 163:	5e                   	pop    %esi
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret
    printf(1, "wc: read error\n");
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 ae 08 00 00       	push   $0x8ae
 16e:	6a 01                	push   $0x1
 170:	e8 cb 03 00 00       	call   540 <printf>
    exit();
 175:	e8 59 02 00 00       	call   3d3 <exit>
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave
 1a4:	c3                   	ret
 1a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ac:	00 
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 2f                	jne    1f0 <strcmp+0x40>
 1c1:	eb 4a                	jmp    20d <strcmp+0x5d>
 1c3:	eb 1b                	jmp    1e0 <strcmp+0x30>
 1c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cc:	00 
 1cd:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1d4:	00 
 1d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dc:	00 
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1e4:	83 c2 01             	add    $0x1,%edx
 1e7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1ea:	84 c0                	test   %al,%al
 1ec:	74 12                	je     200 <strcmp+0x50>
 1ee:	89 d9                	mov    %ebx,%ecx
 1f0:	0f b6 19             	movzbl (%ecx),%ebx
 1f3:	38 c3                	cmp    %al,%bl
 1f5:	74 e9                	je     1e0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 1f7:	29 d8                	sub    %ebx,%eax
}
 1f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fc:	c9                   	leave
 1fd:	c3                   	ret
 1fe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 200:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 204:	31 c0                	xor    %eax,%eax
 206:	29 d8                	sub    %ebx,%eax
}
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave
 20c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	31 c0                	xor    %eax,%eax
 212:	eb e3                	jmp    1f7 <strcmp+0x47>
 214:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21b:	00 
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 3a 00             	cmpb   $0x0,(%edx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 c0                	xor    %eax,%eax
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c0 01             	add    $0x1,%eax
 233:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 237:	89 c1                	mov    %eax,%ecx
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	89 c8                	mov    %ecx,%eax
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret
 23f:	90                   	nop
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret
 246:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24d:	00 
 24e:	66 90                	xchg   %ax,%ax

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	8b 7d fc             	mov    -0x4(%ebp),%edi
 265:	89 d0                	mov    %edx,%eax
 267:	c9                   	leave
 268:	c3                   	ret
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 1a                	jne    29b <strchr+0x2b>
 281:	eb 25                	jmp    2a8 <strchr+0x38>
 283:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28a:	00 
 28b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2b5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 2b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2b9:	31 db                	xor    %ebx,%ebx
{
 2bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2be:	eb 27                	jmp    2e7 <gets+0x37>
    cc = read(0, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	56                   	push   %esi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 1e 01 00 00       	call   3eb <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2df:	3c 0a                	cmp    $0xa,%al
 2e1:	74 10                	je     2f3 <gets+0x43>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 0c                	je     2f3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2e7:	89 df                	mov    %ebx,%edi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
 2f1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fd:	5b                   	pop    %ebx
 2fe:	5e                   	pop    %esi
 2ff:	5f                   	pop    %edi
 300:	5d                   	pop    %ebp
 301:	c3                   	ret
 302:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 309:	00 
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	push   0x8(%ebp)
 31d:	e8 f1 00 00 00       	call   413 <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 f4 00 00 00       	call   42b <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 ba 00 00 00       	call   3fb <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35e:	00 
 35f:	90                   	nop

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37e:	00 
 37f:	90                   	nop
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave
 39b:	c3                   	ret
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	66 90                	xchg   %ax,%ax
 3b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bf:	00 
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret

000003cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3cb:	b8 01 00 00 00       	mov    $0x1,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <exit>:
SYSCALL(exit)
 3d3:	b8 02 00 00 00       	mov    $0x2,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <wait>:
SYSCALL(wait)
 3db:	b8 03 00 00 00       	mov    $0x3,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <pipe>:
SYSCALL(pipe)
 3e3:	b8 04 00 00 00       	mov    $0x4,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <read>:
SYSCALL(read)
 3eb:	b8 05 00 00 00       	mov    $0x5,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <write>:
SYSCALL(write)
 3f3:	b8 10 00 00 00       	mov    $0x10,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret

000003fb <close>:
SYSCALL(close)
 3fb:	b8 15 00 00 00       	mov    $0x15,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret

00000403 <kill>:
SYSCALL(kill)
 403:	b8 06 00 00 00       	mov    $0x6,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret

0000040b <exec>:
SYSCALL(exec)
 40b:	b8 07 00 00 00       	mov    $0x7,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret

00000413 <open>:
SYSCALL(open)
 413:	b8 0f 00 00 00       	mov    $0xf,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret

0000041b <mknod>:
SYSCALL(mknod)
 41b:	b8 11 00 00 00       	mov    $0x11,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret

00000423 <unlink>:
SYSCALL(unlink)
 423:	b8 12 00 00 00       	mov    $0x12,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret

0000042b <fstat>:
SYSCALL(fstat)
 42b:	b8 08 00 00 00       	mov    $0x8,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret

00000433 <link>:
SYSCALL(link)
 433:	b8 13 00 00 00       	mov    $0x13,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret

0000043b <mkdir>:
SYSCALL(mkdir)
 43b:	b8 14 00 00 00       	mov    $0x14,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret

00000443 <chdir>:
SYSCALL(chdir)
 443:	b8 09 00 00 00       	mov    $0x9,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret

0000044b <dup>:
SYSCALL(dup)
 44b:	b8 0a 00 00 00       	mov    $0xa,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret

00000453 <getpid>:
SYSCALL(getpid)
 453:	b8 0b 00 00 00       	mov    $0xb,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret

0000045b <sbrk>:
SYSCALL(sbrk)
 45b:	b8 0c 00 00 00       	mov    $0xc,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret

00000463 <sleep>:
SYSCALL(sleep)
 463:	b8 0d 00 00 00       	mov    $0xd,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret

0000046b <uptime>:
SYSCALL(uptime)
 46b:	b8 0e 00 00 00       	mov    $0xe,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret

00000473 <ps>:
SYSCALL(ps)
 473:	b8 16 00 00 00       	mov    $0x16,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret
 47b:	66 90                	xchg   %ax,%ax
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 488:	89 d1                	mov    %edx,%ecx
{
 48a:	83 ec 3c             	sub    $0x3c,%esp
 48d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 490:	85 d2                	test   %edx,%edx
 492:	0f 89 98 00 00 00    	jns    530 <printint+0xb0>
 498:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 49c:	0f 84 8e 00 00 00    	je     530 <printint+0xb0>
    x = -xx;
 4a2:	f7 d9                	neg    %ecx
    neg = 1;
 4a4:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4a9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4ac:	31 f6                	xor    %esi,%esi
 4ae:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4b5:	00 
 4b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4bd:	00 
 4be:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 4c0:	89 c8                	mov    %ecx,%eax
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	89 f7                	mov    %esi,%edi
 4c6:	f7 f3                	div    %ebx
 4c8:	8d 76 01             	lea    0x1(%esi),%esi
 4cb:	0f b6 92 40 09 00 00 	movzbl 0x940(%edx),%edx
 4d2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4d6:	89 ca                	mov    %ecx,%edx
 4d8:	89 c1                	mov    %eax,%ecx
 4da:	39 da                	cmp    %ebx,%edx
 4dc:	73 e2                	jae    4c0 <printint+0x40>
  if(neg)
 4de:	8b 45 c0             	mov    -0x40(%ebp),%eax
 4e1:	85 c0                	test   %eax,%eax
 4e3:	74 07                	je     4ec <printint+0x6c>
    buf[i++] = '-';
 4e5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 4ea:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 4ec:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4ef:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 4f2:	01 df                	add    %ebx,%edi
 4f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4fb:	00 
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 500:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 503:	83 ec 04             	sub    $0x4,%esp
 506:	88 45 d7             	mov    %al,-0x29(%ebp)
 509:	8d 45 d7             	lea    -0x29(%ebp),%eax
 50c:	6a 01                	push   $0x1
 50e:	50                   	push   %eax
 50f:	56                   	push   %esi
 510:	e8 de fe ff ff       	call   3f3 <write>
  while(--i >= 0)
 515:	89 f8                	mov    %edi,%eax
 517:	83 c4 10             	add    $0x10,%esp
 51a:	83 ef 01             	sub    $0x1,%edi
 51d:	39 d8                	cmp    %ebx,%eax
 51f:	75 df                	jne    500 <printint+0x80>
}
 521:	8d 65 f4             	lea    -0xc(%ebp),%esp
 524:	5b                   	pop    %ebx
 525:	5e                   	pop    %esi
 526:	5f                   	pop    %edi
 527:	5d                   	pop    %ebp
 528:	c3                   	ret
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 530:	31 c0                	xor    %eax,%eax
 532:	e9 72 ff ff ff       	jmp    4a9 <printint+0x29>
 537:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 53e:	00 
 53f:	90                   	nop

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 54c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 54f:	0f b6 13             	movzbl (%ebx),%edx
 552:	83 c3 01             	add    $0x1,%ebx
 555:	84 d2                	test   %dl,%dl
 557:	0f 84 a0 00 00 00    	je     5fd <printf+0xbd>
 55d:	8d 45 10             	lea    0x10(%ebp),%eax
 560:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 563:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 566:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 569:	eb 28                	jmp    593 <printf+0x53>
 56b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	8d 45 e7             	lea    -0x19(%ebp),%eax
 576:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 579:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 57c:	6a 01                	push   $0x1
 57e:	50                   	push   %eax
 57f:	56                   	push   %esi
 580:	e8 6e fe ff ff       	call   3f3 <write>
  for(i = 0; fmt[i]; i++){
 585:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 589:	83 c4 10             	add    $0x10,%esp
 58c:	84 d2                	test   %dl,%dl
 58e:	74 6d                	je     5fd <printf+0xbd>
    c = fmt[i] & 0xff;
 590:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 593:	83 f8 25             	cmp    $0x25,%eax
 596:	75 d8                	jne    570 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 598:	0f b6 13             	movzbl (%ebx),%edx
 59b:	84 d2                	test   %dl,%dl
 59d:	74 5e                	je     5fd <printf+0xbd>
    c = fmt[i] & 0xff;
 59f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 5a2:	80 fa 25             	cmp    $0x25,%dl
 5a5:	0f 84 1d 01 00 00    	je     6c8 <printf+0x188>
 5ab:	83 e8 63             	sub    $0x63,%eax
 5ae:	83 f8 15             	cmp    $0x15,%eax
 5b1:	77 0d                	ja     5c0 <printf+0x80>
 5b3:	ff 24 85 e8 08 00 00 	jmp    *0x8e8(,%eax,4)
 5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5c6:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5c9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 5cd:	6a 01                	push   $0x1
 5cf:	51                   	push   %ecx
 5d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5d3:	56                   	push   %esi
 5d4:	e8 1a fe ff ff       	call   3f3 <write>
        putc(fd, c);
 5d9:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 5dd:	83 c4 0c             	add    $0xc,%esp
 5e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5e3:	6a 01                	push   $0x1
 5e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 5e8:	51                   	push   %ecx
 5e9:	56                   	push   %esi
 5ea:	e8 04 fe ff ff       	call   3f3 <write>
  for(i = 0; fmt[i]; i++){
 5ef:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 5f3:	83 c3 02             	add    $0x2,%ebx
 5f6:	83 c4 10             	add    $0x10,%esp
 5f9:	84 d2                	test   %dl,%dl
 5fb:	75 93                	jne    590 <printf+0x50>
      }
      state = 0;
    }
  }
}
 5fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 600:	5b                   	pop    %ebx
 601:	5e                   	pop    %esi
 602:	5f                   	pop    %edi
 603:	5d                   	pop    %ebp
 604:	c3                   	ret
 605:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 608:	83 ec 0c             	sub    $0xc,%esp
 60b:	8b 17                	mov    (%edi),%edx
 60d:	b9 10 00 00 00       	mov    $0x10,%ecx
 612:	89 f0                	mov    %esi,%eax
 614:	6a 00                	push   $0x0
        ap++;
 616:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 619:	e8 62 fe ff ff       	call   480 <printint>
  for(i = 0; fmt[i]; i++){
 61e:	eb cf                	jmp    5ef <printf+0xaf>
        s = (char*)*ap;
 620:	8b 07                	mov    (%edi),%eax
        ap++;
 622:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 625:	85 c0                	test   %eax,%eax
 627:	0f 84 b3 00 00 00    	je     6e0 <printf+0x1a0>
        while(*s != 0){
 62d:	0f b6 10             	movzbl (%eax),%edx
 630:	84 d2                	test   %dl,%dl
 632:	0f 84 ba 00 00 00    	je     6f2 <printf+0x1b2>
 638:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 63b:	89 c7                	mov    %eax,%edi
 63d:	89 d0                	mov    %edx,%eax
 63f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 642:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 645:	89 fb                	mov    %edi,%ebx
 647:	89 cf                	mov    %ecx,%edi
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 656:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	57                   	push   %edi
 65c:	56                   	push   %esi
 65d:	e8 91 fd ff ff       	call   3f3 <write>
        while(*s != 0){
 662:	0f b6 03             	movzbl (%ebx),%eax
 665:	83 c4 10             	add    $0x10,%esp
 668:	84 c0                	test   %al,%al
 66a:	75 e4                	jne    650 <printf+0x110>
 66c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 66f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 673:	83 c3 02             	add    $0x2,%ebx
 676:	84 d2                	test   %dl,%dl
 678:	0f 85 e5 fe ff ff    	jne    563 <printf+0x23>
 67e:	e9 7a ff ff ff       	jmp    5fd <printf+0xbd>
 683:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	8b 17                	mov    (%edi),%edx
 68d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 692:	89 f0                	mov    %esi,%eax
 694:	6a 01                	push   $0x1
        ap++;
 696:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 699:	e8 e2 fd ff ff       	call   480 <printint>
  for(i = 0; fmt[i]; i++){
 69e:	e9 4c ff ff ff       	jmp    5ef <printf+0xaf>
 6a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6a8:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 6aa:	83 ec 04             	sub    $0x4,%esp
 6ad:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 6b0:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 6b3:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b6:	6a 01                	push   $0x1
 6b8:	51                   	push   %ecx
 6b9:	56                   	push   %esi
 6ba:	e8 34 fd ff ff       	call   3f3 <write>
  for(i = 0; fmt[i]; i++){
 6bf:	e9 2b ff ff ff       	jmp    5ef <printf+0xaf>
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6c8:	83 ec 04             	sub    $0x4,%esp
 6cb:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6ce:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6d1:	6a 01                	push   $0x1
 6d3:	e9 10 ff ff ff       	jmp    5e8 <printf+0xa8>
 6d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6df:	00 
          s = "(null)";
 6e0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6e3:	b8 28 00 00 00       	mov    $0x28,%eax
 6e8:	bf df 08 00 00       	mov    $0x8df,%edi
 6ed:	e9 4d ff ff ff       	jmp    63f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 6f2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6f6:	83 c3 02             	add    $0x2,%ebx
 6f9:	84 d2                	test   %dl,%dl
 6fb:	0f 85 8f fe ff ff    	jne    590 <printf+0x50>
 701:	e9 f7 fe ff ff       	jmp    5fd <printf+0xbd>
 706:	66 90                	xchg   %ax,%ax
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax
 710:	66 90                	xchg   %ax,%ax
 712:	66 90                	xchg   %ax,%ax
 714:	66 90                	xchg   %ax,%ax
 716:	66 90                	xchg   %ax,%ax
 718:	66 90                	xchg   %ax,%ax
 71a:	66 90                	xchg   %ax,%ax
 71c:	66 90                	xchg   %ax,%ax
 71e:	66 90                	xchg   %ax,%ax

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 60 0b 00 00       	mov    0xb60,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 72e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 738:	00 
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 740:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 742:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 744:	39 ca                	cmp    %ecx,%edx
 746:	73 30                	jae    778 <free+0x58>
 748:	39 c1                	cmp    %eax,%ecx
 74a:	72 04                	jb     750 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74c:	39 c2                	cmp    %eax,%edx
 74e:	72 f0                	jb     740 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 750:	8b 73 fc             	mov    -0x4(%ebx),%esi
 753:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 756:	39 f8                	cmp    %edi,%eax
 758:	74 36                	je     790 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 75a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 75d:	8b 42 04             	mov    0x4(%edx),%eax
 760:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	74 40                	je     7a7 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 767:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 769:	5b                   	pop    %ebx
  freep = p;
 76a:	89 15 60 0b 00 00    	mov    %edx,0xb60
}
 770:	5e                   	pop    %esi
 771:	5f                   	pop    %edi
 772:	5d                   	pop    %ebp
 773:	c3                   	ret
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 778:	39 c2                	cmp    %eax,%edx
 77a:	72 c4                	jb     740 <free+0x20>
 77c:	39 c1                	cmp    %eax,%ecx
 77e:	73 c0                	jae    740 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 780:	8b 73 fc             	mov    -0x4(%ebx),%esi
 783:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 786:	39 f8                	cmp    %edi,%eax
 788:	75 d0                	jne    75a <free+0x3a>
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 790:	03 70 04             	add    0x4(%eax),%esi
 793:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 796:	8b 02                	mov    (%edx),%eax
 798:	8b 00                	mov    (%eax),%eax
 79a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 79d:	8b 42 04             	mov    0x4(%edx),%eax
 7a0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7a3:	39 f1                	cmp    %esi,%ecx
 7a5:	75 c0                	jne    767 <free+0x47>
    p->s.size += bp->s.size;
 7a7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7aa:	89 15 60 0b 00 00    	mov    %edx,0xb60
    p->s.size += bp->s.size;
 7b0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7b3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7b6:	89 0a                	mov    %ecx,(%edx)
}
 7b8:	5b                   	pop    %ebx
 7b9:	5e                   	pop    %esi
 7ba:	5f                   	pop    %edi
 7bb:	5d                   	pop    %ebp
 7bc:	c3                   	ret
 7bd:	8d 76 00             	lea    0x0(%esi),%esi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 15 60 0b 00 00    	mov    0xb60,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 78 07             	lea    0x7(%eax),%edi
 7d5:	c1 ef 03             	shr    $0x3,%edi
 7d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7db:	85 d2                	test   %edx,%edx
 7dd:	0f 84 8d 00 00 00    	je     870 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e5:	8b 48 04             	mov    0x4(%eax),%ecx
 7e8:	39 f9                	cmp    %edi,%ecx
 7ea:	73 64                	jae    850 <malloc+0x90>
  if(nu < 4096)
 7ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f1:	39 df                	cmp    %ebx,%edi
 7f3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7f6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7fd:	eb 0a                	jmp    809 <malloc+0x49>
 7ff:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 800:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 802:	8b 48 04             	mov    0x4(%eax),%ecx
 805:	39 f9                	cmp    %edi,%ecx
 807:	73 47                	jae    850 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 809:	89 c2                	mov    %eax,%edx
 80b:	39 05 60 0b 00 00    	cmp    %eax,0xb60
 811:	75 ed                	jne    800 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 813:	83 ec 0c             	sub    $0xc,%esp
 816:	56                   	push   %esi
 817:	e8 3f fc ff ff       	call   45b <sbrk>
  if(p == (char*)-1)
 81c:	83 c4 10             	add    $0x10,%esp
 81f:	83 f8 ff             	cmp    $0xffffffff,%eax
 822:	74 1c                	je     840 <malloc+0x80>
  hp->s.size = nu;
 824:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 827:	83 ec 0c             	sub    $0xc,%esp
 82a:	83 c0 08             	add    $0x8,%eax
 82d:	50                   	push   %eax
 82e:	e8 ed fe ff ff       	call   720 <free>
  return freep;
 833:	8b 15 60 0b 00 00    	mov    0xb60,%edx
      if((p = morecore(nunits)) == 0)
 839:	83 c4 10             	add    $0x10,%esp
 83c:	85 d2                	test   %edx,%edx
 83e:	75 c0                	jne    800 <malloc+0x40>
        return 0;
  }
}
 840:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 843:	31 c0                	xor    %eax,%eax
}
 845:	5b                   	pop    %ebx
 846:	5e                   	pop    %esi
 847:	5f                   	pop    %edi
 848:	5d                   	pop    %ebp
 849:	c3                   	ret
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 850:	39 cf                	cmp    %ecx,%edi
 852:	74 4c                	je     8a0 <malloc+0xe0>
        p->s.size -= nunits;
 854:	29 f9                	sub    %edi,%ecx
 856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 85c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 85f:	89 15 60 0b 00 00    	mov    %edx,0xb60
}
 865:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
}
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 870:	c7 05 60 0b 00 00 64 	movl   $0xb64,0xb60
 877:	0b 00 00 
    base.s.size = 0;
 87a:	b8 64 0b 00 00       	mov    $0xb64,%eax
    base.s.ptr = freep = prevp = &base;
 87f:	c7 05 64 0b 00 00 64 	movl   $0xb64,0xb64
 886:	0b 00 00 
    base.s.size = 0;
 889:	c7 05 68 0b 00 00 00 	movl   $0x0,0xb68
 890:	00 00 00 
    if(p->s.size >= nunits){
 893:	e9 54 ff ff ff       	jmp    7ec <malloc+0x2c>
 898:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 89f:	00 
        prevp->s.ptr = p->s.ptr;
 8a0:	8b 08                	mov    (%eax),%ecx
 8a2:	89 0a                	mov    %ecx,(%edx)
 8a4:	eb b9                	jmp    85f <malloc+0x9f>
