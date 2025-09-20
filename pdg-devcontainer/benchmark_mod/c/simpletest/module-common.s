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
	.file	"module-common.c"
	.type	orc_header,@object              # @orc_header
	.section	.orc_header,"a",@progbits
	.p2align	2, 0x0
orc_header:
	.ascii	"\376]2\277X\033\326;,\251\245\306[\245\246%\352\263\376$"
	.size	orc_header, 20

	.type	_note_18,@object                # @_note_18
	.section	.note.Linux,"a",@note
	.p2align	2, 0x0
_note_18:
	.long	6                               # 0x6
	.long	1                               # 0x1
	.long	256                             # 0x100
	.asciz	"Linux"
	.zero	2
	.zero	1
	.zero	3
	.size	_note_18, 24

	.type	_note_19,@object                # @_note_19
	.p2align	2, 0x0
_note_19:
	.long	6                               # 0x6
	.long	4                               # 0x4
	.long	257                             # 0x101
	.asciz	"Linux"
	.zero	2
	.long	0                               # 0x0
	.size	_note_19, 24

	.type	__UNIQUE_ID_vermagic355,@object # @__UNIQUE_ID_vermagic355
	.section	.modinfo,"a",@progbits
__UNIQUE_ID_vermagic355:
	.asciz	"vermagic=6.16.0-rc3-g17bbbefbf671-dirty SMP preempt mod_unload "
	.size	__UNIQUE_ID_vermagic355, 64

	.type	__UNIQUE_ID_retpoline356,@object # @__UNIQUE_ID_retpoline356
__UNIQUE_ID_retpoline356:
	.asciz	"retpoline=Y"
	.size	__UNIQUE_ID_retpoline356, 12

	.ident	"Ubuntu clang version 19.1.7 (++20250114103320+cd708029e0b2-1~exp1~20250114103432.75)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym orc_header
	.addrsig_sym _note_18
	.addrsig_sym _note_19
	.addrsig_sym __UNIQUE_ID_vermagic355
	.addrsig_sym __UNIQUE_ID_retpoline356
