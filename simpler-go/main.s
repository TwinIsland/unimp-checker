main.change_type2_name STEXT size=76 args=0x8 locals=0x8 funcid=0x0 align=0x0
	0x0000 00000 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	TEXT	main.change_type2_name(SB), ABIInternal, $8-8
	0x0000 00000 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	CMPQ	SP, 16(R14)
	0x0004 00004 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PCDATA	$0, $-2
	0x0004 00004 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	JLS	56
	0x0006 00006 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PCDATA	$0, $-1
	0x0006 00006 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PUSHQ	BP
	0x0007 00007 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	MOVQ	SP, BP
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	FUNCDATA	$0, gclocals路wgcWObbY2HYnK2SU/U22lA==(SB)
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	FUNCDATA	$1, gclocals路J5F+7Qw7O7ve2QcWC7DpeQ==(SB)
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	FUNCDATA	$5, main.change_type2_name.arginfo1(SB)
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	FUNCDATA	$6, main.change_type2_name.argliveinfo(SB)
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PCDATA	$3, $1
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	8(AX), AX
	0x000e 00014 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	$5, 16(AX)
	0x0016 00022 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	PCDATA	$0, $-2
	0x0016 00022 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	CMPL	runtime.writeBarrier(SB), $0
	0x001d 00029 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	JEQ	43
	0x001f 00031 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	8(AX), CX
	0x0023 00035 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	CALL	runtime.gcWriteBarrier1(SB)
	0x0028 00040 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	CX, (R11)
	0x002b 00043 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	LEAQ	go:string."name2"(SB), CX
	0x0032 00050 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	CX, 8(AX)
	0x0036 00054 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:25)	POPQ	BP
	0x0037 00055 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:25)	RET
	0x0038 00056 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:25)	NOP
	0x0038 00056 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PCDATA	$1, $-1
	0x0038 00056 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PCDATA	$0, $-2
	0x0038 00056 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	MOVQ	AX, 8(SP)
	0x003d 00061 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	NOP
	0x0040 00064 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	CALL	runtime.morestack_noctxt(SB)
	0x0045 00069 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	MOVQ	8(SP), AX
	0x004a 00074 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	PCDATA	$0, $-1
	0x004a 00074 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:23)	JMP	0
	0x0000 49 3b 66 10 76 32 55 48 89 e5 48 8b 40 08 48 c7  I;f.v2UH..H.@.H.
	0x0010 40 10 05 00 00 00 83 3d 00 00 00 00 00 74 0c 48  @......=.....t.H
	0x0020 8b 48 08 e8 00 00 00 00 49 89 0b 48 8d 0d 00 00  .H......I..H....
	0x0030 00 00 48 89 48 08 5d c3 48 89 44 24 08 0f 1f 00  ..H.H.].H.D$....
	0x0040 e8 00 00 00 00 48 8b 44 24 08 eb b4              .....H.D$...
	rel 24+4 t=14 runtime.writeBarrier+-1
	rel 36+4 t=7 runtime.gcWriteBarrier1+0
	rel 46+4 t=14 go:string."name2"+0
	rel 65+4 t=7 runtime.morestack_noctxt+0
main.main STEXT size=122 args=0x0 locals=0x28 funcid=0x0 align=0x0
	0x0000 00000 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	TEXT	main.main(SB), ABIInternal, $40-0
	0x0000 00000 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	CMPQ	SP, 16(R14)
	0x0004 00004 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	PCDATA	$0, $-2
	0x0004 00004 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	JLS	115
	0x0006 00006 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	PCDATA	$0, $-1
	0x0006 00006 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	PUSHQ	BP
	0x0007 00007 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	MOVQ	SP, BP
	0x000a 00010 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	SUBQ	$32, SP
	0x000e 00014 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	FUNCDATA	$0, gclocals路g2BeySu+wFnoycgXfElmcg==(SB)
	0x000e 00014 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	FUNCDATA	$1, gclocals路e2OAQw7RTI8D9/LnocWHCg==(SB)
	0x000e 00014 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	FUNCDATA	$2, main.main.stkobj(SB)
	0x000e 00014 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:32)	MOVUPS	X15, main..autotmp_9(SP)
	0x0013 00019 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:32)	MOVQ	$0, main..autotmp_9+16(SP)
	0x001c 00028 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:32)	MOVB	$0, main..autotmp_9+24(SP)
	0x0021 00033 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:32)	MOVQ	$0, main..autotmp_9+16(SP)
	0x002a 00042 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:32)	MOVB	$0, main..autotmp_9+24(SP)
	0x002f 00047 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:32)	MOVQ	$0, main..autotmp_9+8(SP)
	0x0038 00056 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:33)	MOVQ	$2, main..autotmp_9(SP)
	0x0040 00064 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:36)	XCHGL	AX, AX
	0x0041 00065 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	LEAQ	main..autotmp_9(SP), AX
	0x0045 00069 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	$5, 16(AX)
	0x004d 00077 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	PCDATA	$0, $-2
	0x004d 00077 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	CMPL	runtime.writeBarrier(SB), $0
	0x0054 00084 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	JEQ	98
	0x0056 00086 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	8(AX), CX
	0x005a 00090 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	CALL	runtime.gcWriteBarrier1(SB)
	0x005f 00095 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	CX, (R11)
	0x0062 00098 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	LEAQ	go:string."name2"(SB), CX
	0x0069 00105 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:24)	MOVQ	CX, 8(AX)
	0x006d 00109 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:46)	ADDQ	$32, SP
	0x0071 00113 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:46)	POPQ	BP
	0x0072 00114 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:46)	RET
	0x0073 00115 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:46)	NOP
	0x0073 00115 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	PCDATA	$1, $-1
	0x0073 00115 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	PCDATA	$0, $-2
	0x0073 00115 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	CALL	runtime.morestack_noctxt(SB)
	0x0078 00120 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	PCDATA	$0, $-1
	0x0078 00120 (C:/Users/TwinIsland/Desktop/unimp-checker/simpler-go/main.go:27)	JMP	0
	0x0000 49 3b 66 10 76 6d 55 48 89 e5 48 83 ec 20 44 0f  I;f.vmUH..H.. D.
	0x0010 11 3c 24 48 c7 44 24 10 00 00 00 00 c6 44 24 18  .<$H.D$......D$.
	0x0020 00 48 c7 44 24 10 00 00 00 00 c6 44 24 18 00 48  .H.D$......D$..H
	0x0030 c7 44 24 08 00 00 00 00 48 c7 04 24 02 00 00 00  .D$.....H..$....
	0x0040 90 48 8d 04 24 48 c7 40 10 05 00 00 00 83 3d 00  .H..$H.@......=.
	0x0050 00 00 00 00 74 0c 48 8b 48 08 e8 00 00 00 00 49  ....t.H.H......I
	0x0060 89 0b 48 8d 0d 00 00 00 00 48 89 48 08 48 83 c4  ..H......H.H.H..
	0x0070 20 5d c3 e8 00 00 00 00 eb 86                     ]........
	rel 79+4 t=14 runtime.writeBarrier+-1
	rel 91+4 t=7 runtime.gcWriteBarrier1+0
	rel 101+4 t=14 go:string."name2"+0
	rel 116+4 t=7 runtime.morestack_noctxt+0
type:.eq.main.MySubType STEXT dupok size=86 args=0x10 locals=0x20 funcid=0x0 align=0x0
	0x0000 00000 (<autogenerated>:1)	TEXT	type:.eq.main.MySubType(SB), DUPOK|ABIInternal, $32-16
	0x0000 00000 (<autogenerated>:1)	CMPQ	SP, 16(R14)
	0x0004 00004 (<autogenerated>:1)	PCDATA	$0, $-2
	0x0004 00004 (<autogenerated>:1)	JLS	59
	0x0006 00006 (<autogenerated>:1)	PCDATA	$0, $-1
	0x0006 00006 (<autogenerated>:1)	PUSHQ	BP
	0x0007 00007 (<autogenerated>:1)	MOVQ	SP, BP
	0x000a 00010 (<autogenerated>:1)	SUBQ	$24, SP
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$0, gclocals路TjPuuCwdlCpTaRQGRKTrYw==(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$1, gclocals路J5F+7Qw7O7ve2QcWC7DpeQ==(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$5, type:.eq.main.MySubType.arginfo1(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$6, type:.eq.main.MySubType.argliveinfo(SB)
	0x000e 00014 (<autogenerated>:1)	PCDATA	$3, $1
	0x000e 00014 (<autogenerated>:1)	MOVQ	8(AX), CX
	0x0012 00018 (<autogenerated>:1)	CMPQ	8(BX), CX
	0x0016 00022 (<autogenerated>:1)	JNE	51
	0x0018 00024 (<autogenerated>:1)	MOVQ	16(AX), DX
	0x001c 00028 (<autogenerated>:1)	NOP
	0x0020 00032 (<autogenerated>:1)	CMPQ	16(BX), DX
	0x0024 00036 (<autogenerated>:1)	JNE	51
	0x0026 00038 (<autogenerated>:1)	MOVQ	(BX), BX
	0x0029 00041 (<autogenerated>:1)	MOVQ	(AX), AX
	0x002c 00044 (<autogenerated>:1)	PCDATA	$1, $1
	0x002c 00044 (<autogenerated>:1)	CALL	runtime.memequal(SB)
	0x0031 00049 (<autogenerated>:1)	JMP	53
	0x0033 00051 (<autogenerated>:1)	XORL	AX, AX
	0x0035 00053 (<autogenerated>:1)	PCDATA	$1, $-1
	0x0035 00053 (<autogenerated>:1)	ADDQ	$24, SP
	0x0039 00057 (<autogenerated>:1)	POPQ	BP
	0x003a 00058 (<autogenerated>:1)	RET
	0x003b 00059 (<autogenerated>:1)	NOP
	0x003b 00059 (<autogenerated>:1)	PCDATA	$1, $-1
	0x003b 00059 (<autogenerated>:1)	PCDATA	$0, $-2
	0x003b 00059 (<autogenerated>:1)	MOVQ	AX, 8(SP)
	0x0040 00064 (<autogenerated>:1)	MOVQ	BX, 16(SP)
	0x0045 00069 (<autogenerated>:1)	CALL	runtime.morestack_noctxt(SB)
	0x004a 00074 (<autogenerated>:1)	MOVQ	8(SP), AX
	0x004f 00079 (<autogenerated>:1)	MOVQ	16(SP), BX
	0x0054 00084 (<autogenerated>:1)	PCDATA	$0, $-1
	0x0054 00084 (<autogenerated>:1)	JMP	0
	0x0000 49 3b 66 10 76 35 55 48 89 e5 48 83 ec 18 48 8b  I;f.v5UH..H...H.
	0x0010 48 08 48 39 4b 08 75 1b 48 8b 50 10 0f 1f 40 00  H.H9K.u.H.P...@.
	0x0020 48 39 53 10 75 0d 48 8b 1b 48 8b 00 e8 00 00 00  H9S.u.H..H......
	0x0030 00 eb 02 31 c0 48 83 c4 18 5d c3 48 89 44 24 08  ...1.H...].H.D$.
	0x0040 48 89 5c 24 10 e8 00 00 00 00 48 8b 44 24 08 48  H.\$......H.D$.H
	0x0050 8b 5c 24 10 eb aa                                .\$...
	rel 45+4 t=7 runtime.memequal+0
	rel 70+4 t=7 runtime.morestack_noctxt+0
type:.eq.main.MyType STEXT dupok size=90 args=0x10 locals=0x20 funcid=0x0 align=0x0
	0x0000 00000 (<autogenerated>:1)	TEXT	type:.eq.main.MyType(SB), DUPOK|ABIInternal, $32-16
	0x0000 00000 (<autogenerated>:1)	CMPQ	SP, 16(R14)
	0x0004 00004 (<autogenerated>:1)	PCDATA	$0, $-2
	0x0004 00004 (<autogenerated>:1)	JLS	63
	0x0006 00006 (<autogenerated>:1)	PCDATA	$0, $-1
	0x0006 00006 (<autogenerated>:1)	PUSHQ	BP
	0x0007 00007 (<autogenerated>:1)	MOVQ	SP, BP
	0x000a 00010 (<autogenerated>:1)	SUBQ	$24, SP
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$0, gclocals路TjPuuCwdlCpTaRQGRKTrYw==(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$1, gclocals路J5F+7Qw7O7ve2QcWC7DpeQ==(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$5, type:.eq.main.MyType.arginfo1(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$6, type:.eq.main.MyType.argliveinfo(SB)
	0x000e 00014 (<autogenerated>:1)	PCDATA	$3, $1
	0x000e 00014 (<autogenerated>:1)	MOVQ	8(AX), CX
	0x0012 00018 (<autogenerated>:1)	CMPQ	8(BX), CX
	0x0016 00022 (<autogenerated>:1)	JNE	55
	0x0018 00024 (<autogenerated>:1)	MOVQ	16(AX), DX
	0x001c 00028 (<autogenerated>:1)	NOP
	0x0020 00032 (<autogenerated>:1)	CMPQ	16(BX), DX
	0x0024 00036 (<autogenerated>:1)	JEQ	42
	0x0026 00038 (<autogenerated>:1)	XORL	AX, AX
	0x0028 00040 (<autogenerated>:1)	JMP	57
	0x002a 00042 (<autogenerated>:1)	MOVQ	(BX), BX
	0x002d 00045 (<autogenerated>:1)	MOVQ	(AX), AX
	0x0030 00048 (<autogenerated>:1)	PCDATA	$1, $1
	0x0030 00048 (<autogenerated>:1)	CALL	runtime.memequal(SB)
	0x0035 00053 (<autogenerated>:1)	JMP	57
	0x0037 00055 (<autogenerated>:1)	XORL	AX, AX
	0x0039 00057 (<autogenerated>:1)	PCDATA	$1, $-1
	0x0039 00057 (<autogenerated>:1)	ADDQ	$24, SP
	0x003d 00061 (<autogenerated>:1)	POPQ	BP
	0x003e 00062 (<autogenerated>:1)	RET
	0x003f 00063 (<autogenerated>:1)	NOP
	0x003f 00063 (<autogenerated>:1)	PCDATA	$1, $-1
	0x003f 00063 (<autogenerated>:1)	PCDATA	$0, $-2
	0x003f 00063 (<autogenerated>:1)	MOVQ	AX, 8(SP)
	0x0044 00068 (<autogenerated>:1)	MOVQ	BX, 16(SP)
	0x0049 00073 (<autogenerated>:1)	CALL	runtime.morestack_noctxt(SB)
	0x004e 00078 (<autogenerated>:1)	MOVQ	8(SP), AX
	0x0053 00083 (<autogenerated>:1)	MOVQ	16(SP), BX
	0x0058 00088 (<autogenerated>:1)	PCDATA	$0, $-1
	0x0058 00088 (<autogenerated>:1)	JMP	0
	0x0000 49 3b 66 10 76 39 55 48 89 e5 48 83 ec 18 48 8b  I;f.v9UH..H...H.
	0x0010 48 08 48 39 4b 08 75 1f 48 8b 50 10 0f 1f 40 00  H.H9K.u.H.P...@.
	0x0020 48 39 53 10 74 04 31 c0 eb 0f 48 8b 1b 48 8b 00  H9S.t.1...H..H..
	0x0030 e8 00 00 00 00 eb 02 31 c0 48 83 c4 18 5d c3 48  .......1.H...].H
	0x0040 89 44 24 08 48 89 5c 24 10 e8 00 00 00 00 48 8b  .D$.H.\$......H.
	0x0050 44 24 08 48 8b 5c 24 10 eb a6                    D$.H.\$...
	rel 49+4 t=7 runtime.memequal+0
	rel 74+4 t=7 runtime.morestack_noctxt+0
type:.eq.main.MyType2 STEXT dupok size=98 args=0x10 locals=0x20 funcid=0x0 align=0x0
	0x0000 00000 (<autogenerated>:1)	TEXT	type:.eq.main.MyType2(SB), DUPOK|ABIInternal, $32-16
	0x0000 00000 (<autogenerated>:1)	CMPQ	SP, 16(R14)
	0x0004 00004 (<autogenerated>:1)	PCDATA	$0, $-2
	0x0004 00004 (<autogenerated>:1)	JLS	70
	0x0006 00006 (<autogenerated>:1)	PCDATA	$0, $-1
	0x0006 00006 (<autogenerated>:1)	PUSHQ	BP
	0x0007 00007 (<autogenerated>:1)	MOVQ	SP, BP
	0x000a 00010 (<autogenerated>:1)	SUBQ	$24, SP
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$0, gclocals路TjPuuCwdlCpTaRQGRKTrYw==(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$1, gclocals路J5F+7Qw7O7ve2QcWC7DpeQ==(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$5, type:.eq.main.MyType2.arginfo1(SB)
	0x000e 00014 (<autogenerated>:1)	FUNCDATA	$6, type:.eq.main.MyType2.argliveinfo(SB)
	0x000e 00014 (<autogenerated>:1)	PCDATA	$3, $1
	0x000e 00014 (<autogenerated>:1)	MOVQ	(AX), DX
	0x0011 00017 (<autogenerated>:1)	CMPQ	(BX), DX
	0x0014 00020 (<autogenerated>:1)	JNE	62
	0x0016 00022 (<autogenerated>:1)	MOVQ	16(AX), CX
	0x001a 00026 (<autogenerated>:1)	NOP
	0x0020 00032 (<autogenerated>:1)	CMPQ	16(BX), CX
	0x0024 00036 (<autogenerated>:1)	JNE	62
	0x0026 00038 (<autogenerated>:1)	MOVBLZX	24(AX), DX
	0x002a 00042 (<autogenerated>:1)	CMPB	24(BX), DL
	0x002d 00045 (<autogenerated>:1)	JNE	62
	0x002f 00047 (<autogenerated>:1)	MOVQ	8(BX), BX
	0x0033 00051 (<autogenerated>:1)	MOVQ	8(AX), AX
	0x0037 00055 (<autogenerated>:1)	PCDATA	$1, $1
	0x0037 00055 (<autogenerated>:1)	CALL	runtime.memequal(SB)
	0x003c 00060 (<autogenerated>:1)	JMP	64
	0x003e 00062 (<autogenerated>:1)	XORL	AX, AX
	0x0040 00064 (<autogenerated>:1)	PCDATA	$1, $-1
	0x0040 00064 (<autogenerated>:1)	ADDQ	$24, SP
	0x0044 00068 (<autogenerated>:1)	POPQ	BP
	0x0045 00069 (<autogenerated>:1)	RET
	0x0046 00070 (<autogenerated>:1)	NOP
	0x0046 00070 (<autogenerated>:1)	PCDATA	$1, $-1
	0x0046 00070 (<autogenerated>:1)	PCDATA	$0, $-2
	0x0046 00070 (<autogenerated>:1)	MOVQ	AX, 8(SP)
	0x004b 00075 (<autogenerated>:1)	MOVQ	BX, 16(SP)
	0x0050 00080 (<autogenerated>:1)	CALL	runtime.morestack_noctxt(SB)
	0x0055 00085 (<autogenerated>:1)	MOVQ	8(SP), AX
	0x005a 00090 (<autogenerated>:1)	MOVQ	16(SP), BX
	0x005f 00095 (<autogenerated>:1)	PCDATA	$0, $-1
	0x005f 00095 (<autogenerated>:1)	NOP
	0x0060 00096 (<autogenerated>:1)	JMP	0
	0x0000 49 3b 66 10 76 40 55 48 89 e5 48 83 ec 18 48 8b  I;f.v@UH..H...H.
	0x0010 10 48 39 13 75 28 48 8b 48 10 66 0f 1f 44 00 00  .H9.u(H.H.f..D..
	0x0020 48 39 4b 10 75 18 0f b6 50 18 38 53 18 75 0f 48  H9K.u...P.8S.u.H
	0x0030 8b 5b 08 48 8b 40 08 e8 00 00 00 00 eb 02 31 c0  .[.H.@........1.
	0x0040 48 83 c4 18 5d c3 48 89 44 24 08 48 89 5c 24 10  H...].H.D$.H.\$.
	0x0050 e8 00 00 00 00 48 8b 44 24 08 48 8b 5c 24 10 90  .....H.D$.H.\$..
	0x0060 eb 9e                                            ..
	rel 56+4 t=7 runtime.memequal+0
	rel 81+4 t=7 runtime.morestack_noctxt+0
go:cuinfo.producer.<unlinkable> SDWARFCUINFO dupok size=0
	0x0000 72 65 67 61 62 69                                regabi
go:cuinfo.packagename.main SDWARFCUINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
go:info.main.change_type2_name$abstract SDWARFABSFCN dupok size=38
	0x0000 05 6d 61 69 6e 2e 63 68 61 6e 67 65 5f 74 79 70  .main.change_typ
	0x0010 65 32 5f 6e 61 6d 65 00 01 17 01 13 73 72 63 00  e2_name.....src.
	0x0020 00 00 00 00 00 00                                ......
	rel 33+4 t=31 go:info.*main.PtrStruct+0
main..inittask SNOPTRDATA size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
go:string."name2" SRODATA dupok size=5
	0x0000 6e 61 6d 65 32                                   name2
go:string."myName" SRODATA dupok size=6
	0x0000 6d 79 4e 61 6d 65                                myName
go:string."asdasd" SRODATA dupok size=6
	0x0000 61 73 64 61 73 64                                asdasd
go:string."id" SRODATA dupok size=2
	0x0000 69 64                                            id
go:string."id2" SRODATA dupok size=3
	0x0000 69 64 32                                         id2
type:.eqfunc.main.MySubType SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 type:.eq.main.MySubType+0
runtime.memequal64路f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 runtime.memequal64+0
runtime.gcbits.0100000000000000 SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
type:.namedata.*main.MySubType. SRODATA dupok size=17
	0x0000 01 0f 2a 6d 61 69 6e 2e 4d 79 53 75 62 54 79 70  ..*main.MySubTyp
	0x0010 65                                               e
type:*main.MySubType SRODATA size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 f8 2f 25 35 08 08 08 36 00 00 00 00 00 00 00 00  ./%5...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64路f+0
	rel 32+8 t=1 runtime.gcbits.0100000000000000+0
	rel 40+4 t=5 type:.namedata.*main.MySubType.+0
	rel 48+8 t=1 type:main.MySubType+0
type:.importpath.main. SRODATA dupok size=6
	0x0000 00 04 6d 61 69 6e                                ..main
type:.namedata.name- SRODATA dupok size=6
	0x0000 00 04 6e 61 6d 65                                ..name
type:.namedata.id- SRODATA dupok size=4
	0x0000 00 02 69 64                                      ..id
type:main.MySubType SRODATA size=144
	0x0000 18 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 16 57 00 61 07 08 08 19 00 00 00 00 00 00 00 00  .W.a............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 02 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  ........@.......
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  ................
	rel 24+8 t=1 type:.eqfunc.main.MySubType+0
	rel 32+8 t=1 runtime.gcbits.0100000000000000+0
	rel 40+4 t=5 type:.namedata.*main.MySubType.+0
	rel 44+4 t=5 type:*main.MySubType+0
	rel 48+8 t=1 type:.importpath.main.+0
	rel 56+8 t=1 type:main.MySubType+96
	rel 80+4 t=5 type:.importpath.main.+0
	rel 96+8 t=1 type:.namedata.name-+0
	rel 104+8 t=1 type:string+0
	rel 120+8 t=1 type:.namedata.id-+0
	rel 128+8 t=1 type:int+0
type:.eqfunc.main.MyType SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 type:.eq.main.MyType+0
type:.namedata.*main.MyType. SRODATA dupok size=14
	0x0000 01 0c 2a 6d 61 69 6e 2e 4d 79 54 79 70 65        ..*main.MyType
type:*main.MyType SRODATA size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 cc 97 57 63 08 08 08 36 00 00 00 00 00 00 00 00  ..Wc...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64路f+0
	rel 32+8 t=1 runtime.gcbits.0100000000000000+0
	rel 40+4 t=5 type:.namedata.*main.MyType.+0
	rel 48+8 t=1 type:main.MyType+0
type:.namedata.subtype- SRODATA dupok size=9
	0x0000 00 07 73 75 62 74 79 70 65                       ..subtype
type:main.MyType SRODATA size=120
	0x0000 18 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 33 dd 5b 60 07 08 08 19 00 00 00 00 00 00 00 00  3.[`............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 01 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 28 00 00 00 00 00 00 00  ........(.......
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 type:.eqfunc.main.MyType+0
	rel 32+8 t=1 runtime.gcbits.0100000000000000+0
	rel 40+4 t=5 type:.namedata.*main.MyType.+0
	rel 44+4 t=5 type:*main.MyType+0
	rel 48+8 t=1 type:.importpath.main.+0
	rel 56+8 t=1 type:main.MyType+96
	rel 80+4 t=5 type:.importpath.main.+0
	rel 96+8 t=1 type:.namedata.subtype-+0
	rel 104+8 t=1 type:main.MySubType+0
type:.eqfunc.main.MyType2 SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 type:.eq.main.MyType2+0
type:.namedata.*main.MyType2. SRODATA dupok size=15
	0x0000 01 0d 2a 6d 61 69 6e 2e 4d 79 54 79 70 65 32     ..*main.MyType2
type:*main.MyType2 SRODATA size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 bf 9f 8d a8 08 08 08 36 00 00 00 00 00 00 00 00  .......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64路f+0
	rel 32+8 t=1 runtime.gcbits.0100000000000000+0
	rel 40+4 t=5 type:.namedata.*main.MyType2.+0
	rel 48+8 t=1 type:main.MyType2+0
runtime.gcbits.0200000000000000 SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
type:.namedata.t2_name- SRODATA dupok size=9
	0x0000 00 07 74 32 5f 6e 61 6d 65                       ..t2_name
type:.namedata.flag- SRODATA dupok size=6
	0x0000 00 04 66 6c 61 67                                ..flag
type:main.MyType2 SRODATA size=168
	0x0000 20 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00   ...............
	0x0010 47 57 fd 03 07 08 08 19 00 00 00 00 00 00 00 00  GW..............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 03 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 58 00 00 00 00 00 00 00  ........X.......
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x00a0 18 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 type:.eqfunc.main.MyType2+0
	rel 32+8 t=1 runtime.gcbits.0200000000000000+0
	rel 40+4 t=5 type:.namedata.*main.MyType2.+0
	rel 44+4 t=5 type:*main.MyType2+0
	rel 48+8 t=1 type:.importpath.main.+0
	rel 56+8 t=1 type:main.MyType2+96
	rel 80+4 t=5 type:.importpath.main.+0
	rel 96+8 t=1 type:.namedata.id-+0
	rel 104+8 t=1 type:int+0
	rel 120+8 t=1 type:.namedata.t2_name-+0
	rel 128+8 t=1 type:string+0
	rel 144+8 t=1 type:.namedata.flag-+0
	rel 152+8 t=1 type:bool+0
runtime.memequal128路f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 runtime.memequal128+0
type:.namedata.*main.PtrStruct. SRODATA dupok size=17
	0x0000 01 0f 2a 6d 61 69 6e 2e 50 74 72 53 74 72 75 63  ..*main.PtrStruc
	0x0010 74                                               t
type:*main.PtrStruct SRODATA size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 fb b0 f4 ec 08 08 08 36 00 00 00 00 00 00 00 00  .......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64路f+0
	rel 32+8 t=1 runtime.gcbits.0100000000000000+0
	rel 40+4 t=5 type:.namedata.*main.PtrStruct.+0
	rel 48+8 t=1 type:main.PtrStruct+0
type:.namedata.type2_ptr- SRODATA dupok size=11
	0x0000 00 09 74 79 70 65 32 5f 70 74 72                 ..type2_ptr
type:main.PtrStruct SRODATA size=144
	0x0000 10 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  ................
	0x0010 6b d0 d7 8f 0f 08 08 19 00 00 00 00 00 00 00 00  k...............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 02 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  ........@.......
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	rel 24+8 t=1 runtime.memequal128路f+0
	rel 32+8 t=1 runtime.gcbits.0200000000000000+0
	rel 40+4 t=5 type:.namedata.*main.PtrStruct.+0
	rel 44+4 t=5 type:*main.PtrStruct+0
	rel 48+8 t=1 type:.importpath.main.+0
	rel 56+8 t=1 type:main.PtrStruct+96
	rel 80+4 t=5 type:.importpath.main.+0
	rel 96+8 t=1 type:.namedata.id-+0
	rel 104+8 t=1 type:int+0
	rel 120+8 t=1 type:.namedata.type2_ptr-+0
	rel 128+8 t=1 type:*main.MyType2+0
gclocals路wgcWObbY2HYnK2SU/U22lA== SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
gclocals路J5F+7Qw7O7ve2QcWC7DpeQ== SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
main.change_type2_name.arginfo1 SRODATA static dupok size=3
	0x0000 00 08 ff                                         ...
main.change_type2_name.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..
gclocals路g2BeySu+wFnoycgXfElmcg== SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
gclocals路e2OAQw7RTI8D9/LnocWHCg== SRODATA dupok size=9
	0x0000 01 00 00 00 04 00 00 00 00                       .........
main.main.stkobj SRODATA static size=24
	0x0000 01 00 00 00 00 00 00 00 e0 ff ff ff 20 00 00 00  ............ ...
	0x0010 10 00 00 00 00 00 00 00                          ........
	rel 20+4 t=5 runtime.gcbits.0200000000000000+0
gclocals路TjPuuCwdlCpTaRQGRKTrYw== SRODATA dupok size=10
	0x0000 02 00 00 00 02 00 00 00 03 00                    ..........
type:.eq.main.MySubType.arginfo1 SRODATA static dupok size=5
	0x0000 00 08 08 08 ff                                   .....
type:.eq.main.MySubType.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..
type:.eq.main.MyType.arginfo1 SRODATA static dupok size=5
	0x0000 00 08 08 08 ff                                   .....
type:.eq.main.MyType.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..
type:.eq.main.MyType2.arginfo1 SRODATA static dupok size=5
	0x0000 00 08 08 08 ff                                   .....
type:.eq.main.MyType2.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..
