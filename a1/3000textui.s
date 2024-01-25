	.file	"3000textui.c"
	.text
	.globl	p_b
	.bss
	.align 8
	.type	p_b, @object
	.size	p_b, 8
p_b:
	.zero	8
	.globl	options
	.section	.rodata
.LC0:
	.string	"Run 3000shell"
.LC1:
	.string	"Run bash"
.LC2:
	.string	"Clear screen"
.LC3:
	.string	"Exit"
	.section	.data.rel.local,"aw"
	.align 32
	.type	options, @object
	.size	options, 32
options:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.globl	program
	.bss
	.align 8
	.type	program, @object
	.size	program, 8
program:
	.zero	8
	.section	.rodata
.LC4:
	.string	"lib3000banner.so"
.LC5:
	.string	"print_banner"
.LC6:
	.string	"Press any key to continue..."
.LC7:
	.string	"%s"
.LC8:
	.string	"exit"
.LC9:
	.string	"./3000shell"
.LC10:
	.string	"bash"
.LC11:
	.string	"Error: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	dlopen@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L2
	movq	stderr(%rip), %rbx
	call	dlerror@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-32(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	dlsym@PLT
	movq	%rax, p_b(%rip)
	movq	p_b(%rip), %rax
	testq	%rax, %rax
	jne	.L3
	movq	stderr(%rip), %rbx
	call	dlerror@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L3:
	movq	p_b(%rip), %rax
	call	*%rax
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	dlclose@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	getchar@PLT
	call	initscr@PLT
	movl	$0, %edi
	call	curs_set@PLT
	call	noecho@PLT
	call	start_color@PLT
	movl	$4, %edx
	movl	$7, %esi
	movl	$1, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$4, %esi
	movl	$2, %edi
	call	init_pair@PLT
	movl	$0, -40(%rbp)
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$1, %ecx
	movl	$1, %edx
	movl	$19, %esi
	movl	$8, %edi
	call	newwin@PLT
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movl	452+acs_map(%rip), %edi
	movl	452+acs_map(%rip), %ecx
	movl	480+acs_map(%rip), %edx
	movl	480+acs_map(%rip), %esi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	leaq	8(%rdx), %rbx
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$14, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	subwin@PLT
	movq	%rax, (%rbx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	leaq	16(%rdx), %rbx
	movl	$3, %r8d
	movl	$3, %ecx
	movl	$14, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	subwin@PLT
	movq	%rax, (%rbx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	leaq	24(%rdx), %rbx
	movl	$3, %r8d
	movl	$4, %ecx
	movl	$14, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	subwin@PLT
	movq	%rax, (%rbx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	leaq	32(%rdx), %rbx
	movl	$3, %r8d
	movl	$5, %ecx
	movl	$14, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	subwin@PLT
	movq	%rax, (%rbx)
	movl	$1, -44(%rbp)
	jmp	.L4
.L5:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	options(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	addl	$1, -44(%rbp)
.L4:
	cmpl	$4, -44(%rbp)
	jle	.L5
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$512, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	keypad@PLT
.L15:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -36(%rbp)
	movl	-40(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movl	-40(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	cmpl	$258, -36(%rbp)
	jne	.L6
	cmpl	$3, -40(%rbp)
	je	.L7
	movl	-40(%rbp), %eax
	addl	$1, %eax
	jmp	.L8
.L7:
	movl	$0, %eax
.L8:
	movl	%eax, -40(%rbp)
	jmp	.L9
.L6:
	cmpl	$259, -36(%rbp)
	jne	.L10
	cmpl	$0, -40(%rbp)
	je	.L11
	movl	-40(%rbp), %eax
	subl	$1, %eax
	jmp	.L12
.L11:
	movl	$3, %eax
.L12:
	movl	%eax, -40(%rbp)
	jmp	.L9
.L10:
	cmpl	$27, -36(%rbp)
	jne	.L13
	movl	$-1, -40(%rbp)
	jmp	.L14
.L13:
	cmpl	$10, -36(%rbp)
	je	.L22
.L9:
	movl	-40(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$512, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movl	-40(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	jmp	.L15
.L22:
	nop
.L14:
	cmpl	$10, -36(%rbp)
	jne	.L16
	cmpl	$2, -40(%rbp)
	jne	.L17
	leaq	.LC8(%rip), %rax
	movq	%rax, program(%rip)
	jmp	.L16
.L17:
	cmpl	$0, -40(%rbp)
	jne	.L18
	leaq	.LC9(%rip), %rax
	movq	%rax, program(%rip)
	jmp	.L16
.L18:
	cmpl	$1, -40(%rbp)
	jne	.L16
	leaq	.LC10(%rip), %rax
	movq	%rax, program(%rip)
.L16:
	call	endwin@PLT
	cmpl	$3, -40(%rbp)
	jne	.L19
	movl	$0, %edi
	call	exit@PLT
.L19:
	movq	environ(%rip), %rdx
	movq	program(%rip), %rax
	leaq	program(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	execvpe@PLT
	cmpl	$-1, %eax
	jne	.L20
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L20:
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
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
