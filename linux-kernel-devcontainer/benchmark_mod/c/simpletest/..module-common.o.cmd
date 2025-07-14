savedcmd_.module-common.o := clang -Wp,-MMD,./..module-common.o.d -nostdinc -I/workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include -I/workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated -I/workspaces/linux-kernel-devcontainer/linux-rust/include -I/workspaces/linux-kernel-devcontainer/linux-rust/include -I/workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi -I/workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi -I/workspaces/linux-kernel-devcontainer/linux-rust/include/uapi -I/workspaces/linux-kernel-devcontainer/linux-rust/include/generated/uapi -include /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler-version.h -include /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kconfig.h -include /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler_types.h -D__KERNEL__ --target=x86_64-linux-gnu -fintegrated-as -Werror=unknown-warning-option -Werror=ignored-optimization-argument -Werror=option-ignored -Werror=unused-command-line-argument -Werror -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=branch -fno-jump-tables -m64 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mstack-alignment=8 -mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone -mcmodel=kernel -mstack-protector-guard-reg=gs -mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2 -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=zero -fno-stack-clash-protection -falign-functions=16 -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=date-time -Werror=incompatible-pointer-types -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-format-overflow -Wno-override-init -Wno-pointer-to-enum-cast -Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access -Wno-enum-compare-conditional -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter  -DMODULE  -DKBUILD_BASENAME='".module_common"' -DKBUILD_MODNAME='".module_common.o"' -D__KBUILD_MODNAME=kmod_.module_common.o -c -o .module-common.o /workspaces/linux-kernel-devcontainer/linux-rust/scripts/module-common.c   ; /workspaces/linux-kernel-devcontainer/linux-rust/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --prefix=16  --link  --module .module-common.o

source_.module-common.o := /workspaces/linux-kernel-devcontainer/linux-rust/scripts/module-common.c

deps_.module-common.o := \
    $(wildcard include/config/UNWINDER_ORC) \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/UBSAN_INTEGER_WRAP) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler_attributes.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler-clang.h \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/container_of.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/build_bug.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
    $(wildcard include/config/CFI_CLANG) \
    $(wildcard include/config/64BIT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/rwonce.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/rwonce.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/int-ll64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/int-ll64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/bitsperlong.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitsperlong.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/bitsperlong.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/posix_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/stddef.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/stddef.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/X86_32) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/posix_types_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/posix_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/const.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/const.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/const.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/barrier.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
    $(wildcard include/config/MITIGATION_ITS) \
    $(wildcard include/config/MITIGATION_RETHUNK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/stringify.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/objtool.h \
    $(wildcard include/config/FRAME_POINTER) \
    $(wildcard include/config/NOINSTR_VALIDATION) \
    $(wildcard include/config/MITIGATION_UNRET_ENTRY) \
    $(wildcard include/config/MITIGATION_SRSO) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/objtool_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/asm.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/extable_fixup_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/instrumentation.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/once_lite.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/stdarg.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/init.h \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kern_levels.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/GENDWARFKSYMS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/MITIGATION_SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
    $(wildcard include/config/UML) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
    $(wildcard include/config/FINEIBT_BHI) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/ratelimit_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bits.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/bits.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/bits.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/overflow.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/limits.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/limits.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/limits.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/param.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/param.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/param.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/spinlock_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/NR_CPUS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/qrwlock_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/byteorder.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/byteorder/little_endian.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/byteorder/little_endian.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/swab.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/swab.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/swab.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/byteorder/generic.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/nops.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/barrier.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/stat.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/stat.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/stat.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/kernel.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/sysinfo.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/cache.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/math.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/div64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/div64.h \
    $(wildcard include/config/CC_OPTIMIZE_FOR_PERFORMANCE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/math64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/time64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/time64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/time.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/time_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/time32.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/timex.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/timex.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/timex.h \
    $(wildcard include/config/X86_TSC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/VM86) \
    $(wildcard include/config/X86_USER_SHADOW_STACK) \
    $(wildcard include/config/X86_DEBUG_FPU) \
    $(wildcard include/config/USE_X86_SEG_SUPPORT) \
    $(wildcard include/config/PARAVIRT_XXL) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/MITIGATION_PAGE_TABLE_ISOLATION) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/processor-flags.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mem_encrypt.h \
    $(wildcard include/config/ARCH_HAS_MEM_ENCRYPT) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/mem_encrypt.h \
    $(wildcard include/config/X86_MEM_ENCRYPT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cc_platform.h \
    $(wildcard include/config/ARCH_HAS_CC_PLATFORM) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/math_emu.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/IA32_EMULATION) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/segment.h \
    $(wildcard include/config/XEN_PV) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/PHYSICAL_START) \
    $(wildcard include/config/PHYSICAL_ALIGN) \
    $(wildcard include/config/DYNAMIC_PHYSICAL_MASK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/page.h \
    $(wildcard include/config/PAGE_SHIFT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/RANDOMIZE_BASE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/kaslr.h \
    $(wildcard include/config/RANDOMIZE_MEMORY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/ptrace.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/ptrace-abi.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/ZERO_CALL_USED_REGS) \
    $(wildcard include/config/PARAVIRT_DEBUG) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/desc_defs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/X86_INTEL_MEMORY_PROTECTION_KEYS) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/PROC_FS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/KMSAN) \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/SPARSEMEM) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/MITIGATION_CALL_DEPTH_TRACKING) \
    $(wildcard include/config/MITIGATION_IBPB_ENTRY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/static_key.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cleanup.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/jump_label.h \
    $(wildcard include/config/HAVE_JUMP_LABEL_HACK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cpufeatures.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/msr-index.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/unwind_hints.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/orc_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/CC_HAS_NAMED_AS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/args.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/asm-offsets.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/generated/asm-offsets.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/GEN-for-each-reg.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/proto.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/ldt.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/sigcontext.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/current.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cpuid/api.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cpuid/types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/string.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/page.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/X86_VSYSCALL_EMULATION) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kmsan-checks.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/range.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/pfn.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/getorder.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bitops.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/typecheck.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/generic-non-atomic.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/X86_CMOV) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/rmwcc.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/sched.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/arch_hweight.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/const_hweight.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/instrumented-atomic.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/instrumented.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/instrumented-lock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/le.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/special_insns.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/errno.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/errno.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/errno.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/errno.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/errno-base.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/irqflags_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/DEBUG_ENTRY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/fpu/types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/vmxfeatures.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/vdso/processor.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/shstk.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/personality.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/personality.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/err.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/tsc.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cpufeature.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/cpufeaturemasks.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/msr.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cpumask.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/align.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/align.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/array_size.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/hex.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kstrtox.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/minmax.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sprintf.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/instruction_pointer.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/util_macros.h \
    $(wildcard include/config/FOO_SUSPEND) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/wordpart.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bitmap.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/find.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/string.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bitmap-str.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cpumask_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/atomic.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/atomic.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cmpxchg.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/cmpxchg_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/atomic64_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/atomic/atomic-long.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/atomic/atomic-instrumented.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
    $(wildcard include/config/SLAB_OBJ_EXT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/numa.h \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/nodemask.h \
    $(wildcard include/config/HIGHMEM) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/nodemask_types.h \
    $(wildcard include/config/NODES_SHIFT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/random.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/ioctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/ioctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/ioctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/ioctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/irqnr.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/irqnr.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/msr.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/shared/msr.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/percpu.h \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/PAGE_SIZE_4KB) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/PREEMPT_LAZY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/preempt.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/CSD_LOCK_WAIT_DEBUG) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/smp_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/ARCH_HAS_PREEMPT_LAZY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/SH) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/restart_block.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/X86_FRED) \
    $(wildcard include/config/COMPAT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/smp.h \
    $(wildcard include/config/DEBUG_NMI_SELFTEST) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/SCHED_CLASS_EXT) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/X86_BUS_LOCK_DETECT) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DEBUG_MUTEXES) \
    $(wildcard include/config/DETECT_HUNG_TASK_BLOCKER) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/DEBUG_RSEQ) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/USER_EVENTS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/sched.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/pid_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sem_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/shm.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/shmparam.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kmsan_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/osq_lock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/spinlock_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rwlock_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/plist_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/hrtimer_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/timerqueue_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rbtree_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/timer_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/refcount_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/resource.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/resource.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/resource.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/resource.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/resource.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/latencytop.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/prio.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/signal.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/signal.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/signal.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/signal-defs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/siginfo.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/siginfo.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/syscall_user_dispatch_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/tlbbatch.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_EGRESS) \
    $(wildcard include/config/NET_ACT_MIRRED) \
    $(wildcard include/config/NF_DUP_NETDEV) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/posix-timers_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/rseq.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/seqlock_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kcsan.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/uidgid_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/tracepoint-defs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/kmap_size.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/ext.h \
    $(wildcard include/config/EXT_GROUP_SCHED) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/spinlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bottom_half.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/mmiowb.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/spinlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/PARAVIRT_SPINLOCKS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/frame.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/qspinlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/qspinlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/qrwlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/qrwlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rwlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/time32.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/time.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/highuid.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kmod.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/umh.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/gfp.h \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/CONTIG_ALLOC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/PAGE_BLOCK_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP_PREINIT) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/list_nulls.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/wait.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/seqlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mutex.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/debug_locks.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/page-flags-layout.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/generated/bounds.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/SLAB_FREELIST_HARDENED) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/FUTEX_PRIVATE_HASH) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/SPLIT_PMD_PTLOCKS) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/MM_ID) \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/auxvec.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/auxvec.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/auxvec.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kref.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/refcount.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rbtree.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcutree.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/completion.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/swait.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/uprobes.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/ktime.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/jiffies.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/jiffies.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/generated/timeconst.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/vdso/ktime.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/clocksource_ids.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/uprobes.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/notifier.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/workqueue_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcu_segcblist.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/srcutree.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/percpu_counter.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/mmu.h \
    $(wildcard include/config/MODIFY_LDT_SYSCALL) \
    $(wildcard include/config/ADDRESS_MASKING) \
    $(wildcard include/config/BROADCAST_TLB_FLUSH) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/page-flags.h \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_2) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_3) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/local_lock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/local_lock_internal.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/memory_hotplug.h \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/mmzone.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/mmzone.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/arch_topology.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/topology.h \
    $(wildcard include/config/X86_LOCAL_APIC) \
    $(wildcard include/config/SCHED_MC_PRIO) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/EISA) \
    $(wildcard include/config/X86_MPPARSE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/mpspec_def.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/x86_init.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/apicdef.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/topology.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cpu_smt.h \
    $(wildcard include/config/HOTPLUG_SMT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/sysctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/elf.h \
    $(wildcard include/config/X86_X32_ABI) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/ia32.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/compat.h \
    $(wildcard include/config/ARCH_HAS_SYSCALL_WRAPPER) \
    $(wildcard include/config/COMPAT_OLD_SIGACTION) \
    $(wildcard include/config/HARDENED_USERCOPY) \
    $(wildcard include/config/ODD_RT_SIGACTION) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sem.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/sem.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/ipc.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rhashtable-types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/ipc.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/ipcbuf.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/ipcbuf.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/sembuf.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/socket.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/socket.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/socket.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/sockios.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/sockios.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/sockios.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/uio.h \
    $(wildcard include/config/ARCH_HAS_COPY_MC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/ucopysize.h \
    $(wildcard include/config/HARDENED_USERCOPY_DEFAULT_ON) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/uio.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/socket.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/if.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/libc-compat.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/hdlc/ioctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/fs.h \
    $(wildcard include/config/FANOTIFY_ACCESS_PERMISSIONS) \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/vfsdebug.h \
    $(wildcard include/config/DEBUG_VFS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/wait_bit.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kdev_t.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/kdev_t.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/dcache.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rculist_bl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/list_bl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/bit_spinlock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/path.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/list_lru.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/sync_core.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/coredump.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/radix-tree.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/pid.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/capability.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/capability.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/semaphore.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/fcntl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/fcntl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/asm-generic/fcntl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/openat2.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/migrate_mode.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/percpu-rwsem.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcuwait.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
    $(wildcard include/config/STACK_GROWSUP) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/jobctl.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/nospec.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/CC_HAS_ASM_GOTO_OUTPUT) \
    $(wildcard include/config/CC_HAS_ASM_GOTO_TIED_OUTPUT) \
    $(wildcard include/config/X86_INTEL_USERCOPY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mmap_lock.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/smap.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/tlbflush.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mmu_notifier.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/interval_tree.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/invpcid.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pti.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pgtable.h \
    $(wildcard include/config/DEBUG_WX) \
    $(wildcard include/config/HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) \
    $(wildcard include/config/ARCH_HAS_PTE_DEVMAP) \
    $(wildcard include/config/ARCH_SUPPORTS_PMD_PFNMAP) \
    $(wildcard include/config/ARCH_SUPPORTS_PUD_PFNMAP) \
    $(wildcard include/config/HAVE_ARCH_SOFT_DIRTY) \
    $(wildcard include/config/ARCH_ENABLE_THP_MIGRATION) \
    $(wildcard include/config/PAGE_TABLE_CHECK) \
    $(wildcard include/config/X86_SGX) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pkru.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/fpu/api.h \
    $(wildcard include/config/MATH_EMULATION) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/coco.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/pgtable_uffd.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/page_table_check.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pgtable_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/PROVIDE_OHCI1394_DMA_INIT) \
    $(wildcard include/config/X86_IO_APIC) \
    $(wildcard include/config/PCI_MMCONFIG) \
    $(wildcard include/config/ACPI_APEI_GHES) \
    $(wildcard include/config/INTEL_TXT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/vsyscall.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/fixmap.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/pgtable-invert.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/uaccess_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/runtime-const.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/cred.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/IOMMUFD) \
    $(wildcard include/config/WATCH_QUEUE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/ratelimit.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/posix-timers.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/hrtimer_defs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/timerqueue.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcuref.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rcu_sync.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/delayed_call.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/uuid.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/errseq.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/ioprio.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/rt.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/ioprio.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/fs_types.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mount.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/mnt_idmapping.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/slab.h \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLUB_TINY) \
    $(wildcard include/config/SLUB_DEBUG) \
    $(wildcard include/config/SLAB_BUCKETS) \
    $(wildcard include/config/KVFREE_RCU_BATCHED) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/percpu-refcount.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kasan-enabled.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kasan-tags.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rw_hint.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/file_ref.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/unicode.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/fs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/dqblk_xfs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/dqblk_v1.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/dqblk_v2.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/dqblk_qtree.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/projid.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/quota.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/aio_abi.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/unistd.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/unistd.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/uapi/asm/unistd.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/uapi/asm/unistd_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/unistd_64_x32.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/unistd_32_ia32.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/compat.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sched/task_stack.h \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/magic.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/user32.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/syscall_wrapper.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/user.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/user_64.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/fsgsbase.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/vdso.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/elf.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/uapi/linux/elf-em.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/sysfs.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/idr.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/kobject_ns.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/rbtree_latch.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/error-injection.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/error-injection.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/dynamic_debug.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/module.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/build-salt.h \
    $(wildcard include/config/BUILD_SALT) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/elfnote.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/elfnote-lto.h \
    $(wildcard include/config/LTO) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/linux/vermagic.h \
    $(wildcard include/config/PREEMPT_BUILD) \
  /workspaces/linux-kernel-devcontainer/linux-rust/include/generated/utsrelease.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/vermagic.h \
    $(wildcard include/config/M486SX) \
    $(wildcard include/config/M486) \
    $(wildcard include/config/M586) \
    $(wildcard include/config/M586TSC) \
    $(wildcard include/config/M586MMX) \
    $(wildcard include/config/MATOM) \
    $(wildcard include/config/M686) \
    $(wildcard include/config/MPENTIUMII) \
    $(wildcard include/config/MPENTIUMIII) \
    $(wildcard include/config/MPENTIUMM) \
    $(wildcard include/config/MPENTIUM4) \
    $(wildcard include/config/MK6) \
    $(wildcard include/config/MK7) \
    $(wildcard include/config/MELAN) \
    $(wildcard include/config/MCRUSOE) \
    $(wildcard include/config/MEFFICEON) \
    $(wildcard include/config/MWINCHIPC6) \
    $(wildcard include/config/MWINCHIP3D) \
    $(wildcard include/config/MCYRIXIII) \
    $(wildcard include/config/MVIAC3_2) \
    $(wildcard include/config/MVIAC7) \
    $(wildcard include/config/MGEODEGX1) \
    $(wildcard include/config/MGEODE_LX) \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/asm/orc_header.h \
  /workspaces/linux-kernel-devcontainer/linux-rust/arch/x86/include/generated/asm/orc_hash.h \

.module-common.o: $(deps_.module-common.o)

$(deps_.module-common.o):

.module-common.o: $(wildcard /workspaces/linux-kernel-devcontainer/linux-rust/tools/objtool/objtool)
