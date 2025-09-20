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
	.file	"simple_driver.mod.c"
	.type	__UNIQUE_ID_name355,@object     # @__UNIQUE_ID_name355
	.section	.modinfo,"a",@progbits
__UNIQUE_ID_name355:
	.asciz	"name=simple_driver"
	.size	__UNIQUE_ID_name355, 19

	.type	__this_module,@object           # @__this_module
	.section	.gnu.linkonce.this_module,"aw",@progbits
	.globl	__this_module
	.p2align	6, 0x0
__this_module:
	.long	0                               # 0x0
	.zero	4
	.zero	16
	.asciz	"simple_driver\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.zero	96
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	0                               # 0x0
	.zero	4
	.zero	32
	.quad	0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	0
	.quad	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	2
	.long	0                               # 0x0
	.quad	0
	.quad	init_module
	.zero	504
	.zero	40
	.quad	0                               # 0x0
	.long	0                               # 0x0
	.zero	4
	.zero	16
	.quad	0
	.quad	0
	.zero	32
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	0                               # 0x0
	.zero	4
	.quad	0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	0
	.long	0                               # 0x0
	.zero	4
	.quad	0
	.quad	0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	0
	.quad	0
	.long	0                               # 0x0
	.zero	4
	.quad	0
	.long	0                               # 0x0
	.zero	4
	.quad	0
	.long	0                               # 0x0
	.zero	4
	.quad	0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	0
	.zero	16
	.zero	16
	.quad	cleanup_module
	.zero	4
	.zero	52
	.size	__this_module, 1216

	.type	__UNIQUE_ID_depends356,@object  # @__UNIQUE_ID_depends356
	.section	.modinfo,"a",@progbits
__UNIQUE_ID_depends356:
	.asciz	"depends="
	.size	__UNIQUE_ID_depends356, 9

	.ident	"Ubuntu clang version 19.1.7 (++20250114103320+cd708029e0b2-1~exp1~20250114103432.75)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym init_module
	.addrsig_sym cleanup_module
	.addrsig_sym __UNIQUE_ID_name355
	.addrsig_sym __UNIQUE_ID_depends356
