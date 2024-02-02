	.file	"syscall-hello.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$13, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	buf(%rip), %rdx
	movl	$1, %edi
	call	syscall@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.globl	buf
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Hello world!\n"
	.section	.data.rel.local,"aw"
	.align 8
	.type	buf, @object
	.size	buf, 8
buf:
	.quad	.LC0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
