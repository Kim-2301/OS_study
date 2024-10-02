
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	74 6e                	je     a3 <main+0xa3>
  35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3c:	00 
  3d:	8d 76 00             	lea    0x0(%esi),%esi
    if((fd = open(argv[i], 0)) < 0){
  40:	83 ec 08             	sub    $0x8,%esp
  43:	6a 00                	push   $0x0
  45:	ff 33                	push   (%ebx)
  47:	e8 07 06 00 00       	call   653 <open>
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	89 c7                	mov    %eax,%edi
  51:	85 c0                	test   %eax,%eax
  53:	78 27                	js     7c <main+0x7c>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  55:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  58:	83 c6 01             	add    $0x1,%esi
  5b:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  5e:	50                   	push   %eax
  5f:	ff 75 e0             	push   -0x20(%ebp)
  62:	e8 a9 01 00 00       	call   210 <grep>
    close(fd);
  67:	89 3c 24             	mov    %edi,(%esp)
  6a:	e8 cc 05 00 00       	call   63b <close>
  for(i = 2; i < argc; i++){
  6f:	83 c4 10             	add    $0x10,%esp
  72:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  75:	7f c9                	jg     40 <main+0x40>
  }
  exit();
  77:	e8 97 05 00 00       	call   613 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  7c:	50                   	push   %eax
  7d:	ff 33                	push   (%ebx)
  7f:	68 08 0b 00 00       	push   $0xb08
  84:	6a 01                	push   $0x1
  86:	e8 f5 06 00 00       	call   780 <printf>
      exit();
  8b:	e8 83 05 00 00       	call   613 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 e8 0a 00 00       	push   $0xae8
  97:	6a 02                	push   $0x2
  99:	e8 e2 06 00 00       	call   780 <printf>
    exit();
  9e:	e8 70 05 00 00       	call   613 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 63 01 00 00       	call   210 <grep>
    exit();
  ad:	e8 61 05 00 00       	call   613 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 1c             	sub    $0x1c,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '\0')
  cf:	0f b6 16             	movzbl (%esi),%edx
  d2:	84 d2                	test   %dl,%dl
  d4:	0f 84 a6 00 00 00    	je     180 <matchhere+0xc0>
    return 1;
  if(re[1] == '*')
  da:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  de:	3c 2a                	cmp    $0x2a,%al
  e0:	74 3f                	je     121 <matchhere+0x61>
  e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  e9:	00 
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  f0:	0f b6 0b             	movzbl (%ebx),%ecx
  if(re[0] == '$' && re[1] == '\0')
  f3:	80 fa 24             	cmp    $0x24,%dl
  f6:	74 68                	je     160 <matchhere+0xa0>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  f8:	84 c9                	test   %cl,%cl
  fa:	0f 84 90 00 00 00    	je     190 <matchhere+0xd0>
 100:	80 fa 2e             	cmp    $0x2e,%dl
 103:	74 08                	je     10d <matchhere+0x4d>
 105:	38 d1                	cmp    %dl,%cl
 107:	0f 85 83 00 00 00    	jne    190 <matchhere+0xd0>
    return matchhere(re+1, text+1);
 10d:	83 c3 01             	add    $0x1,%ebx
 110:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
 113:	84 c0                	test   %al,%al
 115:	74 69                	je     180 <matchhere+0xc0>
{
 117:	89 c2                	mov    %eax,%edx
  if(re[1] == '*')
 119:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 11d:	3c 2a                	cmp    $0x2a,%al
 11f:	75 cf                	jne    f0 <matchhere+0x30>
    return matchstar(re[0], re+2, text);
 121:	83 c6 02             	add    $0x2,%esi
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 124:	80 fa 2e             	cmp    $0x2e,%dl
 127:	0f 94 c0             	sete   %al
 12a:	89 c7                	mov    %eax,%edi
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(matchhere(re, text))
 130:	83 ec 08             	sub    $0x8,%esp
 133:	88 55 e7             	mov    %dl,-0x19(%ebp)
 136:	53                   	push   %ebx
 137:	56                   	push   %esi
 138:	e8 83 ff ff ff       	call   c0 <matchhere>
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	75 41                	jne    185 <matchhere+0xc5>
  }while(*text!='\0' && (*text++==c || c=='.'));
 144:	0f b6 0b             	movzbl (%ebx),%ecx
 147:	84 c9                	test   %cl,%cl
 149:	74 3a                	je     185 <matchhere+0xc5>
 14b:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
 14f:	83 c3 01             	add    $0x1,%ebx
 152:	38 d1                	cmp    %dl,%cl
 154:	74 da                	je     130 <matchhere+0x70>
 156:	89 f9                	mov    %edi,%ecx
 158:	84 c9                	test   %cl,%cl
 15a:	75 d4                	jne    130 <matchhere+0x70>
 15c:	eb 27                	jmp    185 <matchhere+0xc5>
 15e:	66 90                	xchg   %ax,%ax
  if(re[0] == '$' && re[1] == '\0')
 160:	84 c0                	test   %al,%al
 162:	74 36                	je     19a <matchhere+0xda>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 164:	84 c9                	test   %cl,%cl
 166:	74 28                	je     190 <matchhere+0xd0>
 168:	80 f9 24             	cmp    $0x24,%cl
 16b:	75 23                	jne    190 <matchhere+0xd0>
    return matchhere(re+1, text+1);
 16d:	83 c3 01             	add    $0x1,%ebx
 170:	83 c6 01             	add    $0x1,%esi
{
 173:	89 c2                	mov    %eax,%edx
 175:	eb a2                	jmp    119 <matchhere+0x59>
 177:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17e:	00 
 17f:	90                   	nop
    return 1;
 180:	b8 01 00 00 00       	mov    $0x1,%eax
}
 185:	8d 65 f4             	lea    -0xc(%ebp),%esp
 188:	5b                   	pop    %ebx
 189:	5e                   	pop    %esi
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 193:	31 c0                	xor    %eax,%eax
}
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret
    return *text == '\0';
 19a:	31 c0                	xor    %eax,%eax
 19c:	84 c9                	test   %cl,%cl
 19e:	0f 94 c0             	sete   %al
 1a1:	eb e2                	jmp    185 <matchhere+0xc5>
 1a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1aa:	00 
 1ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000001b0 <match>:
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 1bb:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 1be:	75 11                	jne    1d1 <match+0x21>
 1c0:	eb 2e                	jmp    1f0 <match+0x40>
 1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1c8:	83 c6 01             	add    $0x1,%esi
 1cb:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1cf:	74 11                	je     1e2 <match+0x32>
    if(matchhere(re, text))
 1d1:	83 ec 08             	sub    $0x8,%esp
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	e8 e5 fe ff ff       	call   c0 <matchhere>
 1db:	83 c4 10             	add    $0x10,%esp
 1de:	85 c0                	test   %eax,%eax
 1e0:	74 e6                	je     1c8 <match+0x18>
}
 1e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e5:	5b                   	pop    %ebx
 1e6:	5e                   	pop    %esi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 1f0:	83 c3 01             	add    $0x1,%ebx
 1f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1fc:	e9 bf fe ff ff       	jmp    c0 <matchhere>
 201:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 208:	00 
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <grep>:
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
  m = 0;
 214:	31 ff                	xor    %edi,%edi
{
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
 218:	83 ec 1c             	sub    $0x1c,%esp
 21b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 21e:	89 7d e0             	mov    %edi,-0x20(%ebp)
    return matchhere(re+1, text);
 221:	8d 43 01             	lea    0x1(%ebx),%eax
 224:	89 45 dc             	mov    %eax,-0x24(%ebp)
 227:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22e:	00 
 22f:	90                   	nop
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 230:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 233:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 238:	83 ec 04             	sub    $0x4,%esp
 23b:	29 c8                	sub    %ecx,%eax
 23d:	50                   	push   %eax
 23e:	8d 81 a0 0b 00 00    	lea    0xba0(%ecx),%eax
 244:	50                   	push   %eax
 245:	ff 75 0c             	push   0xc(%ebp)
 248:	e8 de 03 00 00       	call   62b <read>
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	0f 8e fd 00 00 00    	jle    355 <grep+0x145>
    m += n;
 258:	01 45 e0             	add    %eax,-0x20(%ebp)
 25b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    buf[m] = '\0';
 25e:	bf a0 0b 00 00       	mov    $0xba0,%edi
 263:	89 de                	mov    %ebx,%esi
 265:	c6 81 a0 0b 00 00 00 	movb   $0x0,0xba0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 270:	83 ec 08             	sub    $0x8,%esp
 273:	6a 0a                	push   $0xa
 275:	57                   	push   %edi
 276:	e8 35 02 00 00       	call   4b0 <strchr>
 27b:	83 c4 10             	add    $0x10,%esp
 27e:	89 c2                	mov    %eax,%edx
 280:	85 c0                	test   %eax,%eax
 282:	0f 84 88 00 00 00    	je     310 <grep+0x100>
      *q = 0;
 288:	c6 02 00             	movb   $0x0,(%edx)
  if(re[0] == '^')
 28b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 28e:	74 58                	je     2e8 <grep+0xd8>
 290:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 293:	89 d3                	mov    %edx,%ebx
 295:	eb 12                	jmp    2a9 <grep+0x99>
 297:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29e:	00 
 29f:	90                   	nop
  }while(*text++ != '\0');
 2a0:	83 c7 01             	add    $0x1,%edi
 2a3:	80 7f ff 00          	cmpb   $0x0,-0x1(%edi)
 2a7:	74 37                	je     2e0 <grep+0xd0>
    if(matchhere(re, text))
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	57                   	push   %edi
 2ad:	56                   	push   %esi
 2ae:	e8 0d fe ff ff       	call   c0 <matchhere>
 2b3:	83 c4 10             	add    $0x10,%esp
 2b6:	85 c0                	test   %eax,%eax
 2b8:	74 e6                	je     2a0 <grep+0x90>
        write(1, p, q+1 - p);
 2ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2bd:	89 da                	mov    %ebx,%edx
 2bf:	8d 5b 01             	lea    0x1(%ebx),%ebx
 2c2:	89 d8                	mov    %ebx,%eax
 2c4:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2c7:	c6 02 0a             	movb   $0xa,(%edx)
        write(1, p, q+1 - p);
 2ca:	29 f8                	sub    %edi,%eax
 2cc:	50                   	push   %eax
 2cd:	57                   	push   %edi
 2ce:	89 df                	mov    %ebx,%edi
 2d0:	6a 01                	push   $0x1
 2d2:	e8 5c 03 00 00       	call   633 <write>
 2d7:	83 c4 10             	add    $0x10,%esp
 2da:	eb 94                	jmp    270 <grep+0x60>
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e0:	8d 7b 01             	lea    0x1(%ebx),%edi
      p = q+1;
 2e3:	eb 8b                	jmp    270 <grep+0x60>
 2e5:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 2e8:	83 ec 08             	sub    $0x8,%esp
 2eb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 2ee:	57                   	push   %edi
 2ef:	ff 75 dc             	push   -0x24(%ebp)
 2f2:	e8 c9 fd ff ff       	call   c0 <matchhere>
        write(1, p, q+1 - p);
 2f7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    return matchhere(re+1, text);
 2fa:	83 c4 10             	add    $0x10,%esp
        write(1, p, q+1 - p);
 2fd:	8d 5a 01             	lea    0x1(%edx),%ebx
      if(match(pattern, p)){
 300:	85 c0                	test   %eax,%eax
 302:	75 be                	jne    2c2 <grep+0xb2>
        write(1, p, q+1 - p);
 304:	89 df                	mov    %ebx,%edi
 306:	e9 65 ff ff ff       	jmp    270 <grep+0x60>
 30b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(p == buf)
 310:	89 f3                	mov    %esi,%ebx
 312:	81 ff a0 0b 00 00    	cmp    $0xba0,%edi
 318:	74 2f                	je     349 <grep+0x139>
    if(m > 0){
 31a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 31d:	85 c0                	test   %eax,%eax
 31f:	0f 8e 0b ff ff ff    	jle    230 <grep+0x20>
      m -= p - buf;
 325:	89 f8                	mov    %edi,%eax
      memmove(buf, p, m);
 327:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 32a:	2d a0 0b 00 00       	sub    $0xba0,%eax
 32f:	29 45 e0             	sub    %eax,-0x20(%ebp)
 332:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      memmove(buf, p, m);
 335:	51                   	push   %ecx
 336:	57                   	push   %edi
 337:	68 a0 0b 00 00       	push   $0xba0
 33c:	e8 9f 02 00 00       	call   5e0 <memmove>
 341:	83 c4 10             	add    $0x10,%esp
 344:	e9 e7 fe ff ff       	jmp    230 <grep+0x20>
      m = 0;
 349:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 350:	e9 db fe ff ff       	jmp    230 <grep+0x20>
}
 355:	8d 65 f4             	lea    -0xc(%ebp),%esp
 358:	5b                   	pop    %ebx
 359:	5e                   	pop    %esi
 35a:	5f                   	pop    %edi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <matchstar>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 1c             	sub    $0x1c,%esp
 369:	8b 5d 08             	mov    0x8(%ebp),%ebx
 36c:	8b 75 0c             	mov    0xc(%ebp),%esi
 36f:	8b 7d 10             	mov    0x10(%ebp),%edi
  }while(*text!='\0' && (*text++==c || c=='.'));
 372:	83 fb 2e             	cmp    $0x2e,%ebx
 375:	0f 94 45 e7          	sete   -0x19(%ebp)
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(matchhere(re, text))
 380:	83 ec 08             	sub    $0x8,%esp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	e8 36 fd ff ff       	call   c0 <matchhere>
 38a:	83 c4 10             	add    $0x10,%esp
 38d:	89 c1                	mov    %eax,%ecx
 38f:	85 c0                	test   %eax,%eax
 391:	75 14                	jne    3a7 <matchstar+0x47>
  }while(*text!='\0' && (*text++==c || c=='.'));
 393:	0f be 07             	movsbl (%edi),%eax
 396:	84 c0                	test   %al,%al
 398:	74 0d                	je     3a7 <matchstar+0x47>
 39a:	83 c7 01             	add    $0x1,%edi
 39d:	39 d8                	cmp    %ebx,%eax
 39f:	74 df                	je     380 <matchstar+0x20>
 3a1:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 3a5:	75 d9                	jne    380 <matchstar+0x20>
}
 3a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3aa:	89 c8                	mov    %ecx,%eax
 3ac:	5b                   	pop    %ebx
 3ad:	5e                   	pop    %esi
 3ae:	5f                   	pop    %edi
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret
 3b1:	66 90                	xchg   %ax,%ax
 3b3:	66 90                	xchg   %ax,%ax
 3b5:	66 90                	xchg   %ax,%ax
 3b7:	66 90                	xchg   %ax,%ax
 3b9:	66 90                	xchg   %ax,%ax
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c1:	31 c0                	xor    %eax,%eax
{
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	53                   	push   %ebx
 3c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3d7:	83 c0 01             	add    $0x1,%eax
 3da:	84 d2                	test   %dl,%dl
 3dc:	75 f2                	jne    3d0 <strcpy+0x10>
    ;
  return os;
}
 3de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e1:	89 c8                	mov    %ecx,%eax
 3e3:	c9                   	leave
 3e4:	c3                   	ret
 3e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ec:	00 
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
 3f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3fa:	0f b6 02             	movzbl (%edx),%eax
 3fd:	84 c0                	test   %al,%al
 3ff:	75 2f                	jne    430 <strcmp+0x40>
 401:	eb 4a                	jmp    44d <strcmp+0x5d>
 403:	eb 1b                	jmp    420 <strcmp+0x30>
 405:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40c:	00 
 40d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 414:	00 
 415:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41c:	00 
 41d:	8d 76 00             	lea    0x0(%esi),%esi
 420:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 424:	83 c2 01             	add    $0x1,%edx
 427:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 42a:	84 c0                	test   %al,%al
 42c:	74 12                	je     440 <strcmp+0x50>
 42e:	89 d9                	mov    %ebx,%ecx
 430:	0f b6 19             	movzbl (%ecx),%ebx
 433:	38 c3                	cmp    %al,%bl
 435:	74 e9                	je     420 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 437:	29 d8                	sub    %ebx,%eax
}
 439:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 43c:	c9                   	leave
 43d:	c3                   	ret
 43e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 440:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 444:	31 c0                	xor    %eax,%eax
 446:	29 d8                	sub    %ebx,%eax
}
 448:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44b:	c9                   	leave
 44c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 44d:	0f b6 19             	movzbl (%ecx),%ebx
 450:	31 c0                	xor    %eax,%eax
 452:	eb e3                	jmp    437 <strcmp+0x47>
 454:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45b:	00 
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <strlen>:

uint
strlen(const char *s)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 466:	80 3a 00             	cmpb   $0x0,(%edx)
 469:	74 15                	je     480 <strlen+0x20>
 46b:	31 c0                	xor    %eax,%eax
 46d:	8d 76 00             	lea    0x0(%esi),%esi
 470:	83 c0 01             	add    $0x1,%eax
 473:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 477:	89 c1                	mov    %eax,%ecx
 479:	75 f5                	jne    470 <strlen+0x10>
    ;
  return n;
}
 47b:	89 c8                	mov    %ecx,%eax
 47d:	5d                   	pop    %ebp
 47e:	c3                   	ret
 47f:	90                   	nop
  for(n = 0; s[n]; n++)
 480:	31 c9                	xor    %ecx,%ecx
}
 482:	5d                   	pop    %ebp
 483:	89 c8                	mov    %ecx,%eax
 485:	c3                   	ret
 486:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 48d:	00 
 48e:	66 90                	xchg   %ax,%ax

00000490 <memset>:

void*
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49a:	8b 45 0c             	mov    0xc(%ebp),%eax
 49d:	89 d7                	mov    %edx,%edi
 49f:	fc                   	cld
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a5:	89 d0                	mov    %edx,%eax
 4a7:	c9                   	leave
 4a8:	c3                   	ret
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004b0 <strchr>:

char*
strchr(const char *s, char c)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4ba:	0f b6 10             	movzbl (%eax),%edx
 4bd:	84 d2                	test   %dl,%dl
 4bf:	75 1a                	jne    4db <strchr+0x2b>
 4c1:	eb 25                	jmp    4e8 <strchr+0x38>
 4c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ca:	00 
 4cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 4d0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4d4:	83 c0 01             	add    $0x1,%eax
 4d7:	84 d2                	test   %dl,%dl
 4d9:	74 0d                	je     4e8 <strchr+0x38>
    if(*s == c)
 4db:	38 d1                	cmp    %dl,%cl
 4dd:	75 f1                	jne    4d0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4e8:	31 c0                	xor    %eax,%eax
}
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <gets>:

char*
gets(char *buf, int max)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4f5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 4f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4f9:	31 db                	xor    %ebx,%ebx
{
 4fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4fe:	eb 27                	jmp    527 <gets+0x37>
    cc = read(0, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	6a 01                	push   $0x1
 505:	56                   	push   %esi
 506:	6a 00                	push   $0x0
 508:	e8 1e 01 00 00       	call   62b <read>
    if(cc < 1)
 50d:	83 c4 10             	add    $0x10,%esp
 510:	85 c0                	test   %eax,%eax
 512:	7e 1d                	jle    531 <gets+0x41>
      break;
    buf[i++] = c;
 514:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 518:	8b 55 08             	mov    0x8(%ebp),%edx
 51b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 51f:	3c 0a                	cmp    $0xa,%al
 521:	74 10                	je     533 <gets+0x43>
 523:	3c 0d                	cmp    $0xd,%al
 525:	74 0c                	je     533 <gets+0x43>
  for(i=0; i+1 < max; ){
 527:	89 df                	mov    %ebx,%edi
 529:	83 c3 01             	add    $0x1,%ebx
 52c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 52f:	7c cf                	jl     500 <gets+0x10>
 531:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 53a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53d:	5b                   	pop    %ebx
 53e:	5e                   	pop    %esi
 53f:	5f                   	pop    %edi
 540:	5d                   	pop    %ebp
 541:	c3                   	ret
 542:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 549:	00 
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000550 <stat>:

int
stat(const char *n, struct stat *st)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 555:	83 ec 08             	sub    $0x8,%esp
 558:	6a 00                	push   $0x0
 55a:	ff 75 08             	push   0x8(%ebp)
 55d:	e8 f1 00 00 00       	call   653 <open>
  if(fd < 0)
 562:	83 c4 10             	add    $0x10,%esp
 565:	85 c0                	test   %eax,%eax
 567:	78 27                	js     590 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 569:	83 ec 08             	sub    $0x8,%esp
 56c:	ff 75 0c             	push   0xc(%ebp)
 56f:	89 c3                	mov    %eax,%ebx
 571:	50                   	push   %eax
 572:	e8 f4 00 00 00       	call   66b <fstat>
  close(fd);
 577:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 57a:	89 c6                	mov    %eax,%esi
  close(fd);
 57c:	e8 ba 00 00 00       	call   63b <close>
  return r;
 581:	83 c4 10             	add    $0x10,%esp
}
 584:	8d 65 f8             	lea    -0x8(%ebp),%esp
 587:	89 f0                	mov    %esi,%eax
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 590:	be ff ff ff ff       	mov    $0xffffffff,%esi
 595:	eb ed                	jmp    584 <stat+0x34>
 597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59e:	00 
 59f:	90                   	nop

000005a0 <atoi>:

int
atoi(const char *s)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a7:	0f be 02             	movsbl (%edx),%eax
 5aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5b5:	77 1e                	ja     5d5 <atoi+0x35>
 5b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5be:	00 
 5bf:	90                   	nop
    n = n*10 + *s++ - '0';
 5c0:	83 c2 01             	add    $0x1,%edx
 5c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ca:	0f be 02             	movsbl (%edx),%eax
 5cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5d0:	80 fb 09             	cmp    $0x9,%bl
 5d3:	76 eb                	jbe    5c0 <atoi+0x20>
  return n;
}
 5d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d8:	89 c8                	mov    %ecx,%eax
 5da:	c9                   	leave
 5db:	c3                   	ret
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
 5e7:	8b 55 08             	mov    0x8(%ebp),%edx
 5ea:	56                   	push   %esi
 5eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ee:	85 c0                	test   %eax,%eax
 5f0:	7e 13                	jle    605 <memmove+0x25>
 5f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5f4:	89 d7                	mov    %edx,%edi
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ff:	00 
    *dst++ = *src++;
 600:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 601:	39 f8                	cmp    %edi,%eax
 603:	75 fb                	jne    600 <memmove+0x20>
  return vdst;
}
 605:	5e                   	pop    %esi
 606:	89 d0                	mov    %edx,%eax
 608:	5f                   	pop    %edi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret

0000060b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 60b:	b8 01 00 00 00       	mov    $0x1,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret

00000613 <exit>:
SYSCALL(exit)
 613:	b8 02 00 00 00       	mov    $0x2,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret

0000061b <wait>:
SYSCALL(wait)
 61b:	b8 03 00 00 00       	mov    $0x3,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret

00000623 <pipe>:
SYSCALL(pipe)
 623:	b8 04 00 00 00       	mov    $0x4,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret

0000062b <read>:
SYSCALL(read)
 62b:	b8 05 00 00 00       	mov    $0x5,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret

00000633 <write>:
SYSCALL(write)
 633:	b8 10 00 00 00       	mov    $0x10,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret

0000063b <close>:
SYSCALL(close)
 63b:	b8 15 00 00 00       	mov    $0x15,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret

00000643 <kill>:
SYSCALL(kill)
 643:	b8 06 00 00 00       	mov    $0x6,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret

0000064b <exec>:
SYSCALL(exec)
 64b:	b8 07 00 00 00       	mov    $0x7,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret

00000653 <open>:
SYSCALL(open)
 653:	b8 0f 00 00 00       	mov    $0xf,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret

0000065b <mknod>:
SYSCALL(mknod)
 65b:	b8 11 00 00 00       	mov    $0x11,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret

00000663 <unlink>:
SYSCALL(unlink)
 663:	b8 12 00 00 00       	mov    $0x12,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret

0000066b <fstat>:
SYSCALL(fstat)
 66b:	b8 08 00 00 00       	mov    $0x8,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret

00000673 <link>:
SYSCALL(link)
 673:	b8 13 00 00 00       	mov    $0x13,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret

0000067b <mkdir>:
SYSCALL(mkdir)
 67b:	b8 14 00 00 00       	mov    $0x14,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret

00000683 <chdir>:
SYSCALL(chdir)
 683:	b8 09 00 00 00       	mov    $0x9,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret

0000068b <dup>:
SYSCALL(dup)
 68b:	b8 0a 00 00 00       	mov    $0xa,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret

00000693 <getpid>:
SYSCALL(getpid)
 693:	b8 0b 00 00 00       	mov    $0xb,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret

0000069b <sbrk>:
SYSCALL(sbrk)
 69b:	b8 0c 00 00 00       	mov    $0xc,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret

000006a3 <sleep>:
SYSCALL(sleep)
 6a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret

000006ab <uptime>:
SYSCALL(uptime)
 6ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret

000006b3 <ps>:
SYSCALL(ps)
 6b3:	b8 16 00 00 00       	mov    $0x16,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret
 6bb:	66 90                	xchg   %ax,%ax
 6bd:	66 90                	xchg   %ax,%ax
 6bf:	90                   	nop

000006c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6c8:	89 d1                	mov    %edx,%ecx
{
 6ca:	83 ec 3c             	sub    $0x3c,%esp
 6cd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 6d0:	85 d2                	test   %edx,%edx
 6d2:	0f 89 98 00 00 00    	jns    770 <printint+0xb0>
 6d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6dc:	0f 84 8e 00 00 00    	je     770 <printint+0xb0>
    x = -xx;
 6e2:	f7 d9                	neg    %ecx
    neg = 1;
 6e4:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 6e9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6ec:	31 f6                	xor    %esi,%esi
 6ee:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6f5:	00 
 6f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6fd:	00 
 6fe:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 700:	89 c8                	mov    %ecx,%eax
 702:	31 d2                	xor    %edx,%edx
 704:	89 f7                	mov    %esi,%edi
 706:	f7 f3                	div    %ebx
 708:	8d 76 01             	lea    0x1(%esi),%esi
 70b:	0f b6 92 80 0b 00 00 	movzbl 0xb80(%edx),%edx
 712:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 716:	89 ca                	mov    %ecx,%edx
 718:	89 c1                	mov    %eax,%ecx
 71a:	39 da                	cmp    %ebx,%edx
 71c:	73 e2                	jae    700 <printint+0x40>
  if(neg)
 71e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 721:	85 c0                	test   %eax,%eax
 723:	74 07                	je     72c <printint+0x6c>
    buf[i++] = '-';
 725:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 72a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 72c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 72f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 732:	01 df                	add    %ebx,%edi
 734:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 73b:	00 
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 740:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
 746:	88 45 d7             	mov    %al,-0x29(%ebp)
 749:	8d 45 d7             	lea    -0x29(%ebp),%eax
 74c:	6a 01                	push   $0x1
 74e:	50                   	push   %eax
 74f:	56                   	push   %esi
 750:	e8 de fe ff ff       	call   633 <write>
  while(--i >= 0)
 755:	89 f8                	mov    %edi,%eax
 757:	83 c4 10             	add    $0x10,%esp
 75a:	83 ef 01             	sub    $0x1,%edi
 75d:	39 d8                	cmp    %ebx,%eax
 75f:	75 df                	jne    740 <printint+0x80>
}
 761:	8d 65 f4             	lea    -0xc(%ebp),%esp
 764:	5b                   	pop    %ebx
 765:	5e                   	pop    %esi
 766:	5f                   	pop    %edi
 767:	5d                   	pop    %ebp
 768:	c3                   	ret
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 770:	31 c0                	xor    %eax,%eax
 772:	e9 72 ff ff ff       	jmp    6e9 <printint+0x29>
 777:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 77e:	00 
 77f:	90                   	nop

00000780 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 789:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 78c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 78f:	0f b6 13             	movzbl (%ebx),%edx
 792:	83 c3 01             	add    $0x1,%ebx
 795:	84 d2                	test   %dl,%dl
 797:	0f 84 a0 00 00 00    	je     83d <printf+0xbd>
 79d:	8d 45 10             	lea    0x10(%ebp),%eax
 7a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 7a3:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 7a6:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 7a9:	eb 28                	jmp    7d3 <printf+0x53>
 7ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
 7b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7b6:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 7b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7bc:	6a 01                	push   $0x1
 7be:	50                   	push   %eax
 7bf:	56                   	push   %esi
 7c0:	e8 6e fe ff ff       	call   633 <write>
  for(i = 0; fmt[i]; i++){
 7c5:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 7c9:	83 c4 10             	add    $0x10,%esp
 7cc:	84 d2                	test   %dl,%dl
 7ce:	74 6d                	je     83d <printf+0xbd>
    c = fmt[i] & 0xff;
 7d0:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 7d3:	83 f8 25             	cmp    $0x25,%eax
 7d6:	75 d8                	jne    7b0 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 7d8:	0f b6 13             	movzbl (%ebx),%edx
 7db:	84 d2                	test   %dl,%dl
 7dd:	74 5e                	je     83d <printf+0xbd>
    c = fmt[i] & 0xff;
 7df:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 7e2:	80 fa 25             	cmp    $0x25,%dl
 7e5:	0f 84 1d 01 00 00    	je     908 <printf+0x188>
 7eb:	83 e8 63             	sub    $0x63,%eax
 7ee:	83 f8 15             	cmp    $0x15,%eax
 7f1:	77 0d                	ja     800 <printf+0x80>
 7f3:	ff 24 85 28 0b 00 00 	jmp    *0xb28(,%eax,4)
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 800:	83 ec 04             	sub    $0x4,%esp
 803:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 806:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 809:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 80d:	6a 01                	push   $0x1
 80f:	51                   	push   %ecx
 810:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 813:	56                   	push   %esi
 814:	e8 1a fe ff ff       	call   633 <write>
        putc(fd, c);
 819:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 81d:	83 c4 0c             	add    $0xc,%esp
 820:	88 55 e7             	mov    %dl,-0x19(%ebp)
 823:	6a 01                	push   $0x1
 825:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 828:	51                   	push   %ecx
 829:	56                   	push   %esi
 82a:	e8 04 fe ff ff       	call   633 <write>
  for(i = 0; fmt[i]; i++){
 82f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 833:	83 c3 02             	add    $0x2,%ebx
 836:	83 c4 10             	add    $0x10,%esp
 839:	84 d2                	test   %dl,%dl
 83b:	75 93                	jne    7d0 <printf+0x50>
      }
      state = 0;
    }
  }
}
 83d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 840:	5b                   	pop    %ebx
 841:	5e                   	pop    %esi
 842:	5f                   	pop    %edi
 843:	5d                   	pop    %ebp
 844:	c3                   	ret
 845:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 848:	83 ec 0c             	sub    $0xc,%esp
 84b:	8b 17                	mov    (%edi),%edx
 84d:	b9 10 00 00 00       	mov    $0x10,%ecx
 852:	89 f0                	mov    %esi,%eax
 854:	6a 00                	push   $0x0
        ap++;
 856:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 859:	e8 62 fe ff ff       	call   6c0 <printint>
  for(i = 0; fmt[i]; i++){
 85e:	eb cf                	jmp    82f <printf+0xaf>
        s = (char*)*ap;
 860:	8b 07                	mov    (%edi),%eax
        ap++;
 862:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 865:	85 c0                	test   %eax,%eax
 867:	0f 84 b3 00 00 00    	je     920 <printf+0x1a0>
        while(*s != 0){
 86d:	0f b6 10             	movzbl (%eax),%edx
 870:	84 d2                	test   %dl,%dl
 872:	0f 84 ba 00 00 00    	je     932 <printf+0x1b2>
 878:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 87b:	89 c7                	mov    %eax,%edi
 87d:	89 d0                	mov    %edx,%eax
 87f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 882:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 885:	89 fb                	mov    %edi,%ebx
 887:	89 cf                	mov    %ecx,%edi
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
 893:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 896:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 899:	6a 01                	push   $0x1
 89b:	57                   	push   %edi
 89c:	56                   	push   %esi
 89d:	e8 91 fd ff ff       	call   633 <write>
        while(*s != 0){
 8a2:	0f b6 03             	movzbl (%ebx),%eax
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	84 c0                	test   %al,%al
 8aa:	75 e4                	jne    890 <printf+0x110>
 8ac:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 8af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 8b3:	83 c3 02             	add    $0x2,%ebx
 8b6:	84 d2                	test   %dl,%dl
 8b8:	0f 85 e5 fe ff ff    	jne    7a3 <printf+0x23>
 8be:	e9 7a ff ff ff       	jmp    83d <printf+0xbd>
 8c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 8c8:	83 ec 0c             	sub    $0xc,%esp
 8cb:	8b 17                	mov    (%edi),%edx
 8cd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8d2:	89 f0                	mov    %esi,%eax
 8d4:	6a 01                	push   $0x1
        ap++;
 8d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 8d9:	e8 e2 fd ff ff       	call   6c0 <printint>
  for(i = 0; fmt[i]; i++){
 8de:	e9 4c ff ff ff       	jmp    82f <printf+0xaf>
 8e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 8e8:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 8ea:	83 ec 04             	sub    $0x4,%esp
 8ed:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 8f0:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 8f3:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8f6:	6a 01                	push   $0x1
 8f8:	51                   	push   %ecx
 8f9:	56                   	push   %esi
 8fa:	e8 34 fd ff ff       	call   633 <write>
  for(i = 0; fmt[i]; i++){
 8ff:	e9 2b ff ff ff       	jmp    82f <printf+0xaf>
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 908:	83 ec 04             	sub    $0x4,%esp
 90b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 90e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 911:	6a 01                	push   $0x1
 913:	e9 10 ff ff ff       	jmp    828 <printf+0xa8>
 918:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 91f:	00 
          s = "(null)";
 920:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 923:	b8 28 00 00 00       	mov    $0x28,%eax
 928:	bf 1e 0b 00 00       	mov    $0xb1e,%edi
 92d:	e9 4d ff ff ff       	jmp    87f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 932:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 936:	83 c3 02             	add    $0x2,%ebx
 939:	84 d2                	test   %dl,%dl
 93b:	0f 85 8f fe ff ff    	jne    7d0 <printf+0x50>
 941:	e9 f7 fe ff ff       	jmp    83d <printf+0xbd>
 946:	66 90                	xchg   %ax,%ax
 948:	66 90                	xchg   %ax,%ax
 94a:	66 90                	xchg   %ax,%ax
 94c:	66 90                	xchg   %ax,%ax
 94e:	66 90                	xchg   %ax,%ax
 950:	66 90                	xchg   %ax,%ax
 952:	66 90                	xchg   %ax,%ax
 954:	66 90                	xchg   %ax,%ax
 956:	66 90                	xchg   %ax,%ax
 958:	66 90                	xchg   %ax,%ax
 95a:	66 90                	xchg   %ax,%ax
 95c:	66 90                	xchg   %ax,%ax
 95e:	66 90                	xchg   %ax,%ax

00000960 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 960:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	a1 a0 0f 00 00       	mov    0xfa0,%eax
{
 966:	89 e5                	mov    %esp,%ebp
 968:	57                   	push   %edi
 969:	56                   	push   %esi
 96a:	53                   	push   %ebx
 96b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 96e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 971:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 978:	00 
 979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 980:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 982:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 984:	39 ca                	cmp    %ecx,%edx
 986:	73 30                	jae    9b8 <free+0x58>
 988:	39 c1                	cmp    %eax,%ecx
 98a:	72 04                	jb     990 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98c:	39 c2                	cmp    %eax,%edx
 98e:	72 f0                	jb     980 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 990:	8b 73 fc             	mov    -0x4(%ebx),%esi
 993:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 996:	39 f8                	cmp    %edi,%eax
 998:	74 36                	je     9d0 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 99a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 99d:	8b 42 04             	mov    0x4(%edx),%eax
 9a0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9a3:	39 f1                	cmp    %esi,%ecx
 9a5:	74 40                	je     9e7 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9a7:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9a9:	5b                   	pop    %ebx
  freep = p;
 9aa:	89 15 a0 0f 00 00    	mov    %edx,0xfa0
}
 9b0:	5e                   	pop    %esi
 9b1:	5f                   	pop    %edi
 9b2:	5d                   	pop    %ebp
 9b3:	c3                   	ret
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b8:	39 c2                	cmp    %eax,%edx
 9ba:	72 c4                	jb     980 <free+0x20>
 9bc:	39 c1                	cmp    %eax,%ecx
 9be:	73 c0                	jae    980 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 9c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9c6:	39 f8                	cmp    %edi,%eax
 9c8:	75 d0                	jne    99a <free+0x3a>
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 9d0:	03 70 04             	add    0x4(%eax),%esi
 9d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d6:	8b 02                	mov    (%edx),%eax
 9d8:	8b 00                	mov    (%eax),%eax
 9da:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9dd:	8b 42 04             	mov    0x4(%edx),%eax
 9e0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9e3:	39 f1                	cmp    %esi,%ecx
 9e5:	75 c0                	jne    9a7 <free+0x47>
    p->s.size += bp->s.size;
 9e7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9ea:	89 15 a0 0f 00 00    	mov    %edx,0xfa0
    p->s.size += bp->s.size;
 9f0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9f3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9f6:	89 0a                	mov    %ecx,(%edx)
}
 9f8:	5b                   	pop    %ebx
 9f9:	5e                   	pop    %esi
 9fa:	5f                   	pop    %edi
 9fb:	5d                   	pop    %ebp
 9fc:	c3                   	ret
 9fd:	8d 76 00             	lea    0x0(%esi),%esi

00000a00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	57                   	push   %edi
 a04:	56                   	push   %esi
 a05:	53                   	push   %ebx
 a06:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a0c:	8b 15 a0 0f 00 00    	mov    0xfa0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a12:	8d 78 07             	lea    0x7(%eax),%edi
 a15:	c1 ef 03             	shr    $0x3,%edi
 a18:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a1b:	85 d2                	test   %edx,%edx
 a1d:	0f 84 8d 00 00 00    	je     ab0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a23:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a25:	8b 48 04             	mov    0x4(%eax),%ecx
 a28:	39 f9                	cmp    %edi,%ecx
 a2a:	73 64                	jae    a90 <malloc+0x90>
  if(nu < 4096)
 a2c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a31:	39 df                	cmp    %ebx,%edi
 a33:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 a36:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a3d:	eb 0a                	jmp    a49 <malloc+0x49>
 a3f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a40:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a42:	8b 48 04             	mov    0x4(%eax),%ecx
 a45:	39 f9                	cmp    %edi,%ecx
 a47:	73 47                	jae    a90 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a49:	89 c2                	mov    %eax,%edx
 a4b:	39 05 a0 0f 00 00    	cmp    %eax,0xfa0
 a51:	75 ed                	jne    a40 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 a53:	83 ec 0c             	sub    $0xc,%esp
 a56:	56                   	push   %esi
 a57:	e8 3f fc ff ff       	call   69b <sbrk>
  if(p == (char*)-1)
 a5c:	83 c4 10             	add    $0x10,%esp
 a5f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a62:	74 1c                	je     a80 <malloc+0x80>
  hp->s.size = nu;
 a64:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a67:	83 ec 0c             	sub    $0xc,%esp
 a6a:	83 c0 08             	add    $0x8,%eax
 a6d:	50                   	push   %eax
 a6e:	e8 ed fe ff ff       	call   960 <free>
  return freep;
 a73:	8b 15 a0 0f 00 00    	mov    0xfa0,%edx
      if((p = morecore(nunits)) == 0)
 a79:	83 c4 10             	add    $0x10,%esp
 a7c:	85 d2                	test   %edx,%edx
 a7e:	75 c0                	jne    a40 <malloc+0x40>
        return 0;
  }
}
 a80:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a83:	31 c0                	xor    %eax,%eax
}
 a85:	5b                   	pop    %ebx
 a86:	5e                   	pop    %esi
 a87:	5f                   	pop    %edi
 a88:	5d                   	pop    %ebp
 a89:	c3                   	ret
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a90:	39 cf                	cmp    %ecx,%edi
 a92:	74 4c                	je     ae0 <malloc+0xe0>
        p->s.size -= nunits;
 a94:	29 f9                	sub    %edi,%ecx
 a96:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a99:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a9c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a9f:	89 15 a0 0f 00 00    	mov    %edx,0xfa0
}
 aa5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 aa8:	83 c0 08             	add    $0x8,%eax
}
 aab:	5b                   	pop    %ebx
 aac:	5e                   	pop    %esi
 aad:	5f                   	pop    %edi
 aae:	5d                   	pop    %ebp
 aaf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 ab0:	c7 05 a0 0f 00 00 a4 	movl   $0xfa4,0xfa0
 ab7:	0f 00 00 
    base.s.size = 0;
 aba:	b8 a4 0f 00 00       	mov    $0xfa4,%eax
    base.s.ptr = freep = prevp = &base;
 abf:	c7 05 a4 0f 00 00 a4 	movl   $0xfa4,0xfa4
 ac6:	0f 00 00 
    base.s.size = 0;
 ac9:	c7 05 a8 0f 00 00 00 	movl   $0x0,0xfa8
 ad0:	00 00 00 
    if(p->s.size >= nunits){
 ad3:	e9 54 ff ff ff       	jmp    a2c <malloc+0x2c>
 ad8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 adf:	00 
        prevp->s.ptr = p->s.ptr;
 ae0:	8b 08                	mov    (%eax),%ecx
 ae2:	89 0a                	mov    %ecx,(%edx)
 ae4:	eb b9                	jmp    a9f <malloc+0x9f>
