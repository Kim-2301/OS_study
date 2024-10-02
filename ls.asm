
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 27                	jle    4a <main+0x4a>
  23:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2a:	00 
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  36:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  39:	e8 c2 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 eb                	jne    30 <main+0x30>
  exit();
  45:	e8 49 05 00 00       	call   593 <exit>
    ls(".");
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	68 b0 0a 00 00       	push   $0xab0
  52:	e8 a9 00 00 00       	call   100 <ls>
    exit();
  57:	e8 37 05 00 00       	call   593 <exit>
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 6f 03 00 00       	call   3e0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 f0                	cmp    %esi,%eax
  85:	72 0a                	jb     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 46 03 00 00       	call   3e0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 35 03 00 00       	call   3e0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 28 0b 00 00       	push   $0xb28
  b5:	e8 a6 04 00 00       	call   560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 1e 03 00 00       	call   3e0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 28 0b 00 00       	mov    $0xb28,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 0f 03 00 00       	call   3e0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 28 0b 00 00       	add    $0xb28,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 27 03 00 00       	call   410 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret
  f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fc:	00 
  fd:	8d 76 00             	lea    0x0(%esi),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 bc 04 00 00       	call   5d3 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 8e 01 00 00    	js     2b0 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 b7 04 00 00       	call   5eb <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 b1 01 00 00    	js     2f0 <ls+0x1f0>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 54                	je     1a0 <ls+0xa0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	75 37                	jne    189 <ls+0x89>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 158:	83 ec 0c             	sub    $0xc,%esp
 15b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 161:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 167:	57                   	push   %edi
 168:	e8 f3 fe ff ff       	call   60 <fmtname>
 16d:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 173:	59                   	pop    %ecx
 174:	5f                   	pop    %edi
 175:	52                   	push   %edx
 176:	56                   	push   %esi
 177:	6a 02                	push   $0x2
 179:	50                   	push   %eax
 17a:	68 90 0a 00 00       	push   $0xa90
 17f:	6a 01                	push   $0x1
 181:	e8 7a 05 00 00       	call   700 <printf>
    break;
 186:	83 c4 20             	add    $0x20,%esp
  close(fd);
 189:	83 ec 0c             	sub    $0xc,%esp
 18c:	53                   	push   %ebx
 18d:	e8 29 04 00 00       	call   5bb <close>
 192:	83 c4 10             	add    $0x10,%esp
}
 195:	8d 65 f4             	lea    -0xc(%ebp),%esp
 198:	5b                   	pop    %ebx
 199:	5e                   	pop    %esi
 19a:	5f                   	pop    %edi
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1a0:	83 ec 0c             	sub    $0xc,%esp
 1a3:	57                   	push   %edi
 1a4:	e8 37 02 00 00       	call   3e0 <strlen>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	83 c0 10             	add    $0x10,%eax
 1af:	3d 00 02 00 00       	cmp    $0x200,%eax
 1b4:	0f 87 16 01 00 00    	ja     2d0 <ls+0x1d0>
    strcpy(buf, path);
 1ba:	83 ec 08             	sub    $0x8,%esp
 1bd:	57                   	push   %edi
 1be:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1c4:	57                   	push   %edi
 1c5:	e8 76 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1ca:	89 3c 24             	mov    %edi,(%esp)
 1cd:	e8 0e 02 00 00       	call   3e0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1d2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1d5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1d7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1da:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1e0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1e6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1f9:	6a 10                	push   $0x10
 1fb:	50                   	push   %eax
 1fc:	53                   	push   %ebx
 1fd:	e8 a9 03 00 00       	call   5ab <read>
 202:	83 c4 10             	add    $0x10,%esp
 205:	83 f8 10             	cmp    $0x10,%eax
 208:	0f 85 7b ff ff ff    	jne    189 <ls+0x89>
      if(de.inum == 0)
 20e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 215:	00 
 216:	74 d8                	je     1f0 <ls+0xf0>
      memmove(p, de.name, DIRSIZ);
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 221:	6a 0e                	push   $0xe
 223:	50                   	push   %eax
 224:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 22a:	e8 31 03 00 00       	call   560 <memmove>
      p[DIRSIZ] = 0;
 22f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 235:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 239:	58                   	pop    %eax
 23a:	5a                   	pop    %edx
 23b:	56                   	push   %esi
 23c:	57                   	push   %edi
 23d:	e8 8e 02 00 00       	call   4d0 <stat>
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	0f 88 cb 00 00 00    	js     318 <ls+0x218>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 24d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 253:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 259:	83 ec 0c             	sub    $0xc,%esp
 25c:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 263:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 269:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 26f:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 275:	57                   	push   %edi
 276:	e8 e5 fd ff ff       	call   60 <fmtname>
 27b:	5a                   	pop    %edx
 27c:	59                   	pop    %ecx
 27d:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 283:	51                   	push   %ecx
 284:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 28a:	52                   	push   %edx
 28b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 291:	50                   	push   %eax
 292:	68 90 0a 00 00       	push   $0xa90
 297:	6a 01                	push   $0x1
 299:	e8 62 04 00 00       	call   700 <printf>
 29e:	83 c4 20             	add    $0x20,%esp
 2a1:	e9 4a ff ff ff       	jmp    1f0 <ls+0xf0>
 2a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ad:	00 
 2ae:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot open %s\n", path);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	57                   	push   %edi
 2b4:	68 68 0a 00 00       	push   $0xa68
 2b9:	6a 02                	push   $0x2
 2bb:	e8 40 04 00 00       	call   700 <printf>
    return;
 2c0:	83 c4 10             	add    $0x10,%esp
}
 2c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret
 2cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	68 9d 0a 00 00       	push   $0xa9d
 2d8:	6a 01                	push   $0x1
 2da:	e8 21 04 00 00       	call   700 <printf>
      break;
 2df:	83 c4 10             	add    $0x10,%esp
 2e2:	e9 a2 fe ff ff       	jmp    189 <ls+0x89>
 2e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ee:	00 
 2ef:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	57                   	push   %edi
 2f4:	68 7c 0a 00 00       	push   $0xa7c
 2f9:	6a 02                	push   $0x2
 2fb:	e8 00 04 00 00       	call   700 <printf>
    close(fd);
 300:	89 1c 24             	mov    %ebx,(%esp)
 303:	e8 b3 02 00 00       	call   5bb <close>
    return;
 308:	83 c4 10             	add    $0x10,%esp
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret
 313:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 318:	83 ec 04             	sub    $0x4,%esp
 31b:	57                   	push   %edi
 31c:	68 7c 0a 00 00       	push   $0xa7c
 321:	6a 01                	push   $0x1
 323:	e8 d8 03 00 00       	call   700 <printf>
        continue;
 328:	83 c4 10             	add    $0x10,%esp
 32b:	e9 c0 fe ff ff       	jmp    1f0 <ls+0xf0>
 330:	66 90                	xchg   %ax,%ax
 332:	66 90                	xchg   %ax,%ax
 334:	66 90                	xchg   %ax,%ax
 336:	66 90                	xchg   %ax,%ax
 338:	66 90                	xchg   %ax,%ax
 33a:	66 90                	xchg   %ax,%ax
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 c0                	xor    %eax,%eax
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 4d 08             	mov    0x8(%ebp),%ecx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	89 c8                	mov    %ecx,%eax
 363:	c9                   	leave
 364:	c3                   	ret
 365:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 36c:	00 
 36d:	8d 76 00             	lea    0x0(%esi),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 37a:	0f b6 02             	movzbl (%edx),%eax
 37d:	84 c0                	test   %al,%al
 37f:	75 2f                	jne    3b0 <strcmp+0x40>
 381:	eb 4a                	jmp    3cd <strcmp+0x5d>
 383:	eb 1b                	jmp    3a0 <strcmp+0x30>
 385:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 38c:	00 
 38d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 394:	00 
 395:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39c:	00 
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3a4:	83 c2 01             	add    $0x1,%edx
 3a7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3aa:	84 c0                	test   %al,%al
 3ac:	74 12                	je     3c0 <strcmp+0x50>
 3ae:	89 d9                	mov    %ebx,%ecx
 3b0:	0f b6 19             	movzbl (%ecx),%ebx
 3b3:	38 c3                	cmp    %al,%bl
 3b5:	74 e9                	je     3a0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 3b7:	29 d8                	sub    %ebx,%eax
}
 3b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3bc:	c9                   	leave
 3bd:	c3                   	ret
 3be:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 3c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3c4:	31 c0                	xor    %eax,%eax
 3c6:	29 d8                	sub    %ebx,%eax
}
 3c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cb:	c9                   	leave
 3cc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 3cd:	0f b6 19             	movzbl (%ecx),%ebx
 3d0:	31 c0                	xor    %eax,%eax
 3d2:	eb e3                	jmp    3b7 <strcmp+0x47>
 3d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3db:	00 
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <strlen>:

uint
strlen(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3e6:	80 3a 00             	cmpb   $0x0,(%edx)
 3e9:	74 15                	je     400 <strlen+0x20>
 3eb:	31 c0                	xor    %eax,%eax
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
 3f0:	83 c0 01             	add    $0x1,%eax
 3f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3f7:	89 c1                	mov    %eax,%ecx
 3f9:	75 f5                	jne    3f0 <strlen+0x10>
    ;
  return n;
}
 3fb:	89 c8                	mov    %ecx,%eax
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret
 3ff:	90                   	nop
  for(n = 0; s[n]; n++)
 400:	31 c9                	xor    %ecx,%ecx
}
 402:	5d                   	pop    %ebp
 403:	89 c8                	mov    %ecx,%eax
 405:	c3                   	ret
 406:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40d:	00 
 40e:	66 90                	xchg   %ax,%ax

00000410 <memset>:

void*
memset(void *dst, int c, uint n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 417:	8b 4d 10             	mov    0x10(%ebp),%ecx
 41a:	8b 45 0c             	mov    0xc(%ebp),%eax
 41d:	89 d7                	mov    %edx,%edi
 41f:	fc                   	cld
 420:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 422:	8b 7d fc             	mov    -0x4(%ebp),%edi
 425:	89 d0                	mov    %edx,%eax
 427:	c9                   	leave
 428:	c3                   	ret
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <strchr>:

char*
strchr(const char *s, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43a:	0f b6 10             	movzbl (%eax),%edx
 43d:	84 d2                	test   %dl,%dl
 43f:	75 1a                	jne    45b <strchr+0x2b>
 441:	eb 25                	jmp    468 <strchr+0x38>
 443:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 44a:	00 
 44b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 450:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 454:	83 c0 01             	add    $0x1,%eax
 457:	84 d2                	test   %dl,%dl
 459:	74 0d                	je     468 <strchr+0x38>
    if(*s == c)
 45b:	38 d1                	cmp    %dl,%cl
 45d:	75 f1                	jne    450 <strchr+0x20>
      return (char*)s;
  return 0;
}
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 468:	31 c0                	xor    %eax,%eax
}
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 475:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 478:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 479:	31 db                	xor    %ebx,%ebx
{
 47b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 47e:	eb 27                	jmp    4a7 <gets+0x37>
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	6a 01                	push   $0x1
 485:	56                   	push   %esi
 486:	6a 00                	push   $0x0
 488:	e8 1e 01 00 00       	call   5ab <read>
    if(cc < 1)
 48d:	83 c4 10             	add    $0x10,%esp
 490:	85 c0                	test   %eax,%eax
 492:	7e 1d                	jle    4b1 <gets+0x41>
      break;
    buf[i++] = c;
 494:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 498:	8b 55 08             	mov    0x8(%ebp),%edx
 49b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 49f:	3c 0a                	cmp    $0xa,%al
 4a1:	74 10                	je     4b3 <gets+0x43>
 4a3:	3c 0d                	cmp    $0xd,%al
 4a5:	74 0c                	je     4b3 <gets+0x43>
  for(i=0; i+1 < max; ){
 4a7:	89 df                	mov    %ebx,%edi
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4af:	7c cf                	jl     480 <gets+0x10>
 4b1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 4ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bd:	5b                   	pop    %ebx
 4be:	5e                   	pop    %esi
 4bf:	5f                   	pop    %edi
 4c0:	5d                   	pop    %ebp
 4c1:	c3                   	ret
 4c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4c9:	00 
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	push   0x8(%ebp)
 4dd:	e8 f1 00 00 00       	call   5d3 <open>
  if(fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	push   0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 f4 00 00 00       	call   5eb <fstat>
  close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
  close(fd);
 4fc:	e8 ba 00 00 00       	call   5bb <close>
  return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 51e:	00 
 51f:	90                   	nop

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 527:	0f be 02             	movsbl (%edx),%eax
 52a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 52d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 535:	77 1e                	ja     555 <atoi+0x35>
 537:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 53e:	00 
 53f:	90                   	nop
    n = n*10 + *s++ - '0';
 540:	83 c2 01             	add    $0x1,%edx
 543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 54a:	0f be 02             	movsbl (%edx),%eax
 54d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
  return n;
}
 555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 558:	89 c8                	mov    %ecx,%eax
 55a:	c9                   	leave
 55b:	c3                   	ret
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 45 10             	mov    0x10(%ebp),%eax
 567:	8b 55 08             	mov    0x8(%ebp),%edx
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56e:	85 c0                	test   %eax,%eax
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 d0                	add    %edx,%eax
  dst = vdst;
 574:	89 d7                	mov    %edx,%edi
 576:	66 90                	xchg   %ax,%ax
 578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57f:	00 
    *dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 581:	39 f8                	cmp    %edi,%eax
 583:	75 fb                	jne    580 <memmove+0x20>
  return vdst;
}
 585:	5e                   	pop    %esi
 586:	89 d0                	mov    %edx,%eax
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret

0000058b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58b:	b8 01 00 00 00       	mov    $0x1,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret

00000593 <exit>:
SYSCALL(exit)
 593:	b8 02 00 00 00       	mov    $0x2,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret

0000059b <wait>:
SYSCALL(wait)
 59b:	b8 03 00 00 00       	mov    $0x3,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret

000005a3 <pipe>:
SYSCALL(pipe)
 5a3:	b8 04 00 00 00       	mov    $0x4,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret

000005ab <read>:
SYSCALL(read)
 5ab:	b8 05 00 00 00       	mov    $0x5,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret

000005b3 <write>:
SYSCALL(write)
 5b3:	b8 10 00 00 00       	mov    $0x10,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret

000005bb <close>:
SYSCALL(close)
 5bb:	b8 15 00 00 00       	mov    $0x15,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret

000005c3 <kill>:
SYSCALL(kill)
 5c3:	b8 06 00 00 00       	mov    $0x6,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret

000005cb <exec>:
SYSCALL(exec)
 5cb:	b8 07 00 00 00       	mov    $0x7,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret

000005d3 <open>:
SYSCALL(open)
 5d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret

000005db <mknod>:
SYSCALL(mknod)
 5db:	b8 11 00 00 00       	mov    $0x11,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret

000005e3 <unlink>:
SYSCALL(unlink)
 5e3:	b8 12 00 00 00       	mov    $0x12,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret

000005eb <fstat>:
SYSCALL(fstat)
 5eb:	b8 08 00 00 00       	mov    $0x8,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret

000005f3 <link>:
SYSCALL(link)
 5f3:	b8 13 00 00 00       	mov    $0x13,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret

000005fb <mkdir>:
SYSCALL(mkdir)
 5fb:	b8 14 00 00 00       	mov    $0x14,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret

00000603 <chdir>:
SYSCALL(chdir)
 603:	b8 09 00 00 00       	mov    $0x9,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret

0000060b <dup>:
SYSCALL(dup)
 60b:	b8 0a 00 00 00       	mov    $0xa,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret

00000613 <getpid>:
SYSCALL(getpid)
 613:	b8 0b 00 00 00       	mov    $0xb,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret

0000061b <sbrk>:
SYSCALL(sbrk)
 61b:	b8 0c 00 00 00       	mov    $0xc,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret

00000623 <sleep>:
SYSCALL(sleep)
 623:	b8 0d 00 00 00       	mov    $0xd,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret

0000062b <uptime>:
SYSCALL(uptime)
 62b:	b8 0e 00 00 00       	mov    $0xe,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret

00000633 <ps>:
SYSCALL(ps)
 633:	b8 16 00 00 00       	mov    $0x16,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret
 63b:	66 90                	xchg   %ax,%ax
 63d:	66 90                	xchg   %ax,%ax
 63f:	90                   	nop

00000640 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 648:	89 d1                	mov    %edx,%ecx
{
 64a:	83 ec 3c             	sub    $0x3c,%esp
 64d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 650:	85 d2                	test   %edx,%edx
 652:	0f 89 98 00 00 00    	jns    6f0 <printint+0xb0>
 658:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 65c:	0f 84 8e 00 00 00    	je     6f0 <printint+0xb0>
    x = -xx;
 662:	f7 d9                	neg    %ecx
    neg = 1;
 664:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 669:	89 45 c0             	mov    %eax,-0x40(%ebp)
 66c:	31 f6                	xor    %esi,%esi
 66e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 675:	00 
 676:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 67d:	00 
 67e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 680:	89 c8                	mov    %ecx,%eax
 682:	31 d2                	xor    %edx,%edx
 684:	89 f7                	mov    %esi,%edi
 686:	f7 f3                	div    %ebx
 688:	8d 76 01             	lea    0x1(%esi),%esi
 68b:	0f b6 92 14 0b 00 00 	movzbl 0xb14(%edx),%edx
 692:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 696:	89 ca                	mov    %ecx,%edx
 698:	89 c1                	mov    %eax,%ecx
 69a:	39 da                	cmp    %ebx,%edx
 69c:	73 e2                	jae    680 <printint+0x40>
  if(neg)
 69e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 6a1:	85 c0                	test   %eax,%eax
 6a3:	74 07                	je     6ac <printint+0x6c>
    buf[i++] = '-';
 6a5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 6aa:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 6ac:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 6af:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 6b2:	01 df                	add    %ebx,%edi
 6b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6bb:	00 
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 6c0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
 6c6:	88 45 d7             	mov    %al,-0x29(%ebp)
 6c9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 6cc:	6a 01                	push   $0x1
 6ce:	50                   	push   %eax
 6cf:	56                   	push   %esi
 6d0:	e8 de fe ff ff       	call   5b3 <write>
  while(--i >= 0)
 6d5:	89 f8                	mov    %edi,%eax
 6d7:	83 c4 10             	add    $0x10,%esp
 6da:	83 ef 01             	sub    $0x1,%edi
 6dd:	39 d8                	cmp    %ebx,%eax
 6df:	75 df                	jne    6c0 <printint+0x80>
}
 6e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e4:	5b                   	pop    %ebx
 6e5:	5e                   	pop    %esi
 6e6:	5f                   	pop    %edi
 6e7:	5d                   	pop    %ebp
 6e8:	c3                   	ret
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f0:	31 c0                	xor    %eax,%eax
 6f2:	e9 72 ff ff ff       	jmp    669 <printint+0x29>
 6f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6fe:	00 
 6ff:	90                   	nop

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 70c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 70f:	0f b6 13             	movzbl (%ebx),%edx
 712:	83 c3 01             	add    $0x1,%ebx
 715:	84 d2                	test   %dl,%dl
 717:	0f 84 a0 00 00 00    	je     7bd <printf+0xbd>
 71d:	8d 45 10             	lea    0x10(%ebp),%eax
 720:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 723:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 726:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 729:	eb 28                	jmp    753 <printf+0x53>
 72b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	8d 45 e7             	lea    -0x19(%ebp),%eax
 736:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 739:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 73c:	6a 01                	push   $0x1
 73e:	50                   	push   %eax
 73f:	56                   	push   %esi
 740:	e8 6e fe ff ff       	call   5b3 <write>
  for(i = 0; fmt[i]; i++){
 745:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 749:	83 c4 10             	add    $0x10,%esp
 74c:	84 d2                	test   %dl,%dl
 74e:	74 6d                	je     7bd <printf+0xbd>
    c = fmt[i] & 0xff;
 750:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 753:	83 f8 25             	cmp    $0x25,%eax
 756:	75 d8                	jne    730 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 758:	0f b6 13             	movzbl (%ebx),%edx
 75b:	84 d2                	test   %dl,%dl
 75d:	74 5e                	je     7bd <printf+0xbd>
    c = fmt[i] & 0xff;
 75f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 762:	80 fa 25             	cmp    $0x25,%dl
 765:	0f 84 1d 01 00 00    	je     888 <printf+0x188>
 76b:	83 e8 63             	sub    $0x63,%eax
 76e:	83 f8 15             	cmp    $0x15,%eax
 771:	77 0d                	ja     780 <printf+0x80>
 773:	ff 24 85 bc 0a 00 00 	jmp    *0xabc(,%eax,4)
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
 783:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 786:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 789:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 78d:	6a 01                	push   $0x1
 78f:	51                   	push   %ecx
 790:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 793:	56                   	push   %esi
 794:	e8 1a fe ff ff       	call   5b3 <write>
        putc(fd, c);
 799:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 79d:	83 c4 0c             	add    $0xc,%esp
 7a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7a3:	6a 01                	push   $0x1
 7a5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 7a8:	51                   	push   %ecx
 7a9:	56                   	push   %esi
 7aa:	e8 04 fe ff ff       	call   5b3 <write>
  for(i = 0; fmt[i]; i++){
 7af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 7b3:	83 c3 02             	add    $0x2,%ebx
 7b6:	83 c4 10             	add    $0x10,%esp
 7b9:	84 d2                	test   %dl,%dl
 7bb:	75 93                	jne    750 <printf+0x50>
      }
      state = 0;
    }
  }
}
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c0:	5b                   	pop    %ebx
 7c1:	5e                   	pop    %esi
 7c2:	5f                   	pop    %edi
 7c3:	5d                   	pop    %ebp
 7c4:	c3                   	ret
 7c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7c8:	83 ec 0c             	sub    $0xc,%esp
 7cb:	8b 17                	mov    (%edi),%edx
 7cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d2:	89 f0                	mov    %esi,%eax
 7d4:	6a 00                	push   $0x0
        ap++;
 7d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 7d9:	e8 62 fe ff ff       	call   640 <printint>
  for(i = 0; fmt[i]; i++){
 7de:	eb cf                	jmp    7af <printf+0xaf>
        s = (char*)*ap;
 7e0:	8b 07                	mov    (%edi),%eax
        ap++;
 7e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 7e5:	85 c0                	test   %eax,%eax
 7e7:	0f 84 b3 00 00 00    	je     8a0 <printf+0x1a0>
        while(*s != 0){
 7ed:	0f b6 10             	movzbl (%eax),%edx
 7f0:	84 d2                	test   %dl,%dl
 7f2:	0f 84 ba 00 00 00    	je     8b2 <printf+0x1b2>
 7f8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7fb:	89 c7                	mov    %eax,%edi
 7fd:	89 d0                	mov    %edx,%eax
 7ff:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 802:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 805:	89 fb                	mov    %edi,%ebx
 807:	89 cf                	mov    %ecx,%edi
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 810:	83 ec 04             	sub    $0x4,%esp
 813:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 816:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 819:	6a 01                	push   $0x1
 81b:	57                   	push   %edi
 81c:	56                   	push   %esi
 81d:	e8 91 fd ff ff       	call   5b3 <write>
        while(*s != 0){
 822:	0f b6 03             	movzbl (%ebx),%eax
 825:	83 c4 10             	add    $0x10,%esp
 828:	84 c0                	test   %al,%al
 82a:	75 e4                	jne    810 <printf+0x110>
 82c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 82f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 833:	83 c3 02             	add    $0x2,%ebx
 836:	84 d2                	test   %dl,%dl
 838:	0f 85 e5 fe ff ff    	jne    723 <printf+0x23>
 83e:	e9 7a ff ff ff       	jmp    7bd <printf+0xbd>
 843:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 848:	83 ec 0c             	sub    $0xc,%esp
 84b:	8b 17                	mov    (%edi),%edx
 84d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 852:	89 f0                	mov    %esi,%eax
 854:	6a 01                	push   $0x1
        ap++;
 856:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 859:	e8 e2 fd ff ff       	call   640 <printint>
  for(i = 0; fmt[i]; i++){
 85e:	e9 4c ff ff ff       	jmp    7af <printf+0xaf>
 863:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 868:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 86a:	83 ec 04             	sub    $0x4,%esp
 86d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 870:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 873:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 876:	6a 01                	push   $0x1
 878:	51                   	push   %ecx
 879:	56                   	push   %esi
 87a:	e8 34 fd ff ff       	call   5b3 <write>
  for(i = 0; fmt[i]; i++){
 87f:	e9 2b ff ff ff       	jmp    7af <printf+0xaf>
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 888:	83 ec 04             	sub    $0x4,%esp
 88b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 88e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 891:	6a 01                	push   $0x1
 893:	e9 10 ff ff ff       	jmp    7a8 <printf+0xa8>
 898:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 89f:	00 
          s = "(null)";
 8a0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8a3:	b8 28 00 00 00       	mov    $0x28,%eax
 8a8:	bf b2 0a 00 00       	mov    $0xab2,%edi
 8ad:	e9 4d ff ff ff       	jmp    7ff <printf+0xff>
  for(i = 0; fmt[i]; i++){
 8b2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 8b6:	83 c3 02             	add    $0x2,%ebx
 8b9:	84 d2                	test   %dl,%dl
 8bb:	0f 85 8f fe ff ff    	jne    750 <printf+0x50>
 8c1:	e9 f7 fe ff ff       	jmp    7bd <printf+0xbd>
 8c6:	66 90                	xchg   %ax,%ax
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax
 8d0:	66 90                	xchg   %ax,%ax
 8d2:	66 90                	xchg   %ax,%ax
 8d4:	66 90                	xchg   %ax,%ax
 8d6:	66 90                	xchg   %ax,%ax
 8d8:	66 90                	xchg   %ax,%ax
 8da:	66 90                	xchg   %ax,%ax
 8dc:	66 90                	xchg   %ax,%ax
 8de:	66 90                	xchg   %ax,%ax

000008e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e1:	a1 38 0b 00 00       	mov    0xb38,%eax
{
 8e6:	89 e5                	mov    %esp,%ebp
 8e8:	57                   	push   %edi
 8e9:	56                   	push   %esi
 8ea:	53                   	push   %ebx
 8eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8f8:	00 
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 900:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 902:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 904:	39 ca                	cmp    %ecx,%edx
 906:	73 30                	jae    938 <free+0x58>
 908:	39 c1                	cmp    %eax,%ecx
 90a:	72 04                	jb     910 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90c:	39 c2                	cmp    %eax,%edx
 90e:	72 f0                	jb     900 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 910:	8b 73 fc             	mov    -0x4(%ebx),%esi
 913:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 916:	39 f8                	cmp    %edi,%eax
 918:	74 36                	je     950 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 91a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 91d:	8b 42 04             	mov    0x4(%edx),%eax
 920:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 923:	39 f1                	cmp    %esi,%ecx
 925:	74 40                	je     967 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 927:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 929:	5b                   	pop    %ebx
  freep = p;
 92a:	89 15 38 0b 00 00    	mov    %edx,0xb38
}
 930:	5e                   	pop    %esi
 931:	5f                   	pop    %edi
 932:	5d                   	pop    %ebp
 933:	c3                   	ret
 934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 938:	39 c2                	cmp    %eax,%edx
 93a:	72 c4                	jb     900 <free+0x20>
 93c:	39 c1                	cmp    %eax,%ecx
 93e:	73 c0                	jae    900 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 940:	8b 73 fc             	mov    -0x4(%ebx),%esi
 943:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 946:	39 f8                	cmp    %edi,%eax
 948:	75 d0                	jne    91a <free+0x3a>
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 950:	03 70 04             	add    0x4(%eax),%esi
 953:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 956:	8b 02                	mov    (%edx),%eax
 958:	8b 00                	mov    (%eax),%eax
 95a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 95d:	8b 42 04             	mov    0x4(%edx),%eax
 960:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 963:	39 f1                	cmp    %esi,%ecx
 965:	75 c0                	jne    927 <free+0x47>
    p->s.size += bp->s.size;
 967:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 96a:	89 15 38 0b 00 00    	mov    %edx,0xb38
    p->s.size += bp->s.size;
 970:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 973:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 976:	89 0a                	mov    %ecx,(%edx)
}
 978:	5b                   	pop    %ebx
 979:	5e                   	pop    %esi
 97a:	5f                   	pop    %edi
 97b:	5d                   	pop    %ebp
 97c:	c3                   	ret
 97d:	8d 76 00             	lea    0x0(%esi),%esi

00000980 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	57                   	push   %edi
 984:	56                   	push   %esi
 985:	53                   	push   %ebx
 986:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 989:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 98c:	8b 15 38 0b 00 00    	mov    0xb38,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 992:	8d 78 07             	lea    0x7(%eax),%edi
 995:	c1 ef 03             	shr    $0x3,%edi
 998:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 99b:	85 d2                	test   %edx,%edx
 99d:	0f 84 8d 00 00 00    	je     a30 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9a5:	8b 48 04             	mov    0x4(%eax),%ecx
 9a8:	39 f9                	cmp    %edi,%ecx
 9aa:	73 64                	jae    a10 <malloc+0x90>
  if(nu < 4096)
 9ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9b1:	39 df                	cmp    %ebx,%edi
 9b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9bd:	eb 0a                	jmp    9c9 <malloc+0x49>
 9bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9c2:	8b 48 04             	mov    0x4(%eax),%ecx
 9c5:	39 f9                	cmp    %edi,%ecx
 9c7:	73 47                	jae    a10 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9c9:	89 c2                	mov    %eax,%edx
 9cb:	39 05 38 0b 00 00    	cmp    %eax,0xb38
 9d1:	75 ed                	jne    9c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 9d3:	83 ec 0c             	sub    $0xc,%esp
 9d6:	56                   	push   %esi
 9d7:	e8 3f fc ff ff       	call   61b <sbrk>
  if(p == (char*)-1)
 9dc:	83 c4 10             	add    $0x10,%esp
 9df:	83 f8 ff             	cmp    $0xffffffff,%eax
 9e2:	74 1c                	je     a00 <malloc+0x80>
  hp->s.size = nu;
 9e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9e7:	83 ec 0c             	sub    $0xc,%esp
 9ea:	83 c0 08             	add    $0x8,%eax
 9ed:	50                   	push   %eax
 9ee:	e8 ed fe ff ff       	call   8e0 <free>
  return freep;
 9f3:	8b 15 38 0b 00 00    	mov    0xb38,%edx
      if((p = morecore(nunits)) == 0)
 9f9:	83 c4 10             	add    $0x10,%esp
 9fc:	85 d2                	test   %edx,%edx
 9fe:	75 c0                	jne    9c0 <malloc+0x40>
        return 0;
  }
}
 a00:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a03:	31 c0                	xor    %eax,%eax
}
 a05:	5b                   	pop    %ebx
 a06:	5e                   	pop    %esi
 a07:	5f                   	pop    %edi
 a08:	5d                   	pop    %ebp
 a09:	c3                   	ret
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a10:	39 cf                	cmp    %ecx,%edi
 a12:	74 4c                	je     a60 <malloc+0xe0>
        p->s.size -= nunits;
 a14:	29 f9                	sub    %edi,%ecx
 a16:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a19:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a1c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a1f:	89 15 38 0b 00 00    	mov    %edx,0xb38
}
 a25:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a28:	83 c0 08             	add    $0x8,%eax
}
 a2b:	5b                   	pop    %ebx
 a2c:	5e                   	pop    %esi
 a2d:	5f                   	pop    %edi
 a2e:	5d                   	pop    %ebp
 a2f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 a30:	c7 05 38 0b 00 00 3c 	movl   $0xb3c,0xb38
 a37:	0b 00 00 
    base.s.size = 0;
 a3a:	b8 3c 0b 00 00       	mov    $0xb3c,%eax
    base.s.ptr = freep = prevp = &base;
 a3f:	c7 05 3c 0b 00 00 3c 	movl   $0xb3c,0xb3c
 a46:	0b 00 00 
    base.s.size = 0;
 a49:	c7 05 40 0b 00 00 00 	movl   $0x0,0xb40
 a50:	00 00 00 
    if(p->s.size >= nunits){
 a53:	e9 54 ff ff ff       	jmp    9ac <malloc+0x2c>
 a58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a5f:	00 
        prevp->s.ptr = p->s.ptr;
 a60:	8b 08                	mov    (%eax),%ecx
 a62:	89 0a                	mov    %ecx,(%edx)
 a64:	eb b9                	jmp    a1f <malloc+0x9f>
