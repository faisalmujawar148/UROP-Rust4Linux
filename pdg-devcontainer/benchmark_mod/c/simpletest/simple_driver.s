	.text
	.section	.note.gnu.property,"a",@note
	.p2align	3, 0x0
	.long	4
	.long	16
	.long	5
	.asciz	"GNU"
	.long	3221225474
	.long	4
	.long	1
	.p2align	3, 0x0
	.text
	.file	"simple_driver.c"
	.section	.init.text,"ax",@progbits
	.globl	init_module                     # -- Begin function init_module
	.p2align	4, 0x90
	.type	init_module,@function
.Ltmp0:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
init_module:                            # @init_module
.Lfunc_begin0:
# %bb.0:
	endbr64
	pushq	%rbx
	movq	$.L.str, %rdi
	callq	_printk
	movl	$40000, %edi                    # imm = 0x9C40
	movl	$3264, %esi                     # imm = 0xCC0
	callq	__kmalloc_large_noprof
	movq	%rax, numbers(%rip)
	testq	%rax, %rax
	jne	.LBB0_2
# %bb.1:
	movq	$.L.str.1, %rdi
	callq	_printk
	movl	$-12, %eax
	jmp	.LBB0_5
.LBB0_2:
	callq	ktime_get
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	numbers(%rip), %rcx
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, (%rcx,%rax,4)
	incq	%rax
	cmpq	$10000, %rax                    # imm = 0x2710
	jne	.LBB0_3
# %bb.4:
	callq	ktime_get
	subq	%rbx, %rax
	movq	$.L.str.2, %rdi
	movl	$10000, %esi                    # imm = 0x2710
	movq	%rax, %rdx
	callq	_printk
	movb	$1, num_len(%rip)
	xorl	%eax, %eax
.LBB0_5:
	popq	%rbx
	cs
	jmp	__x86_return_thunk              # TAILCALL
.Lfunc_end0:
	.size	init_module, .Lfunc_end0-init_module
	.section	__patchable_function_entries,"awo",@progbits,init_module
	.p2align	3, 0x0
	.quad	.Ltmp0
                                        # -- End function
	.section	.exit.text,"ax",@progbits
	.globl	cleanup_module                  # -- Begin function cleanup_module
	.p2align	4, 0x90
	.type	cleanup_module,@function
.Ltmp1:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
cleanup_module:                         # @cleanup_module
.Lfunc_begin1:
# %bb.0:
	endbr64
	xorl	%eax, %eax
	cmpb	$0, num_len(%rip)
	movl	$10000, %esi                    # imm = 0x2710
	cmoveq	%rax, %rsi
	movq	$.L.str.4, %rdi
	callq	_printk
	movq	$.L.str.5, %rdi
	callq	_printk
	movq	numbers(%rip), %rdi
	jmp	kfree                           # TAILCALL
.Lfunc_end1:
	.size	cleanup_module, .Lfunc_end1-cleanup_module
	.section	__patchable_function_entries,"awo",@progbits,cleanup_module
	.p2align	3, 0x0
	.quad	.Ltmp1
                                        # -- End function
	.type	__UNIQUE_ID___addressable_init_module355,@object # @__UNIQUE_ID___addressable_init_module355
	.section	.init.data,"aw",@progbits
	.p2align	3, 0x0
__UNIQUE_ID___addressable_init_module355:
	.quad	init_module
	.size	__UNIQUE_ID___addressable_init_module355, 8

	.type	__UNIQUE_ID___addressable_cleanup_module356,@object # @__UNIQUE_ID___addressable_cleanup_module356
	.section	.exit.data,"aw",@progbits
	.p2align	3, 0x0
__UNIQUE_ID___addressable_cleanup_module356:
	.quad	cleanup_module
	.size	__UNIQUE_ID___addressable_cleanup_module356, 8

	.type	__UNIQUE_ID_license357,@object  # @__UNIQUE_ID_license357
	.section	.modinfo,"a",@progbits
__UNIQUE_ID_license357:
	.asciz	"license=GPL v2"
	.size	__UNIQUE_ID_license357, 15

	.type	__UNIQUE_ID_author358,@object   # @__UNIQUE_ID_author358
__UNIQUE_ID_author358:
	.asciz	"author=Faisal"
	.size	__UNIQUE_ID_author358, 14

	.type	__UNIQUE_ID_description359,@object # @__UNIQUE_ID_description359
__UNIQUE_ID_description359:
	.asciz	"description=Rust out-of-tree sample with C version benchmark"
	.size	__UNIQUE_ID_description359, 61

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\0016Rust out-of-tree sample (init)\n"
	.size	.L.str, 34

	.type	numbers,@object                 # @numbers
	.local	numbers
	.comm	numbers,8,8
	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\0013Failed to allocate numbers array\n"
	.size	.L.str.1, 36

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\0016Benchmark: pushed %d entries in %lld ns\n"
	.size	.L.str.2, 43

	.type	num_len,@object                 # @num_len
	.local	num_len
	.comm	num_len,1,8
	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\0016Module exit, vector length: %zu\n"
	.size	.L.str.4, 35

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"\0016Rust out-of-tree sample (exit)\n"
	.size	.L.str.5, 34

	.ident	"Ubuntu clang version 19.1.7 (++20250114103320+cd708029e0b2-1~exp1~20250114103432.75)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym init_module
	.addrsig_sym cleanup_module
	.addrsig_sym __UNIQUE_ID___addressable_init_module355
	.addrsig_sym __UNIQUE_ID___addressable_cleanup_module356
	.addrsig_sym __UNIQUE_ID_license357
	.addrsig_sym __UNIQUE_ID_author358
	.addrsig_sym __UNIQUE_ID_description359
