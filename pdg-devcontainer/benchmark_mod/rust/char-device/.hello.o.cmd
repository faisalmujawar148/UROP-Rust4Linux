savedcmd_hello.o := OBJTREE=/workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust RUST_MODFILE=./hello rustc --edition=2021 -Zbinary_dep_depinfo=y -Astable_features -Dnon_ascii_idents -Dunsafe_op_in_unsafe_fn -Wmissing_docs -Wrust_2018_idioms -Wunreachable_pub -Wclippy::all -Wclippy::as_ptr_cast_mut -Wclippy::as_underscore -Wclippy::cast_lossless -Wclippy::ignored_unit_patterns -Wclippy::mut_mut -Wclippy::needless_bitwise_bool -Aclippy::needless_lifetimes -Wclippy::no_mangle_with_rust_abi -Wclippy::ptr_as_ptr -Wclippy::ptr_cast_constness -Wclippy::ref_as_ptr -Wclippy::undocumented_unsafe_blocks -Wclippy::unnecessary_safety_comment -Wclippy::unnecessary_safety_doc -Wrustdoc::missing_crate_level_docs -Wrustdoc::unescaped_backticks -Cpanic=abort -Cembed-bitcode=n -Clto=n -Cforce-unwind-tables=n -Ccodegen-units=1 -Csymbol-mangling-version=v0 -Crelocation-model=static -Zfunction-sections=n -Wclippy::float_arithmetic --target=/workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/scripts/target.json -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2 -Zcf-protection=branch -Zno-jump-tables -Ctarget-cpu=x86-64 -Ztune-cpu=generic -Cno-redzone=y -Ccode-model=kernel -Zfunction-return=thunk-extern -Zpatchable-function-entry=16,16 -Copt-level=2 -Cdebug-assertions=y -Coverflow-checks=y -Dwarnings  --cfg MODULE  @/workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/include/generated/rustc_cfg -Zallow-features=asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op -Zcrate-attr=no_std -Zcrate-attr='feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op)' -Zunstable-options --extern pin_init --extern kernel --crate-type rlib -L /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/ --crate-name hello --sysroot=/dev/null --out-dir ./ --emit=dep-info=./.hello.o.d --emit=obj=hello.o hello.rs  ; /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --prefix=16  --link  --module hello.o

source_hello.o := hello.rs

deps_hello.o := \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libcore.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libkernel.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libffi.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libcompiler_builtins.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libpin_init.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libmacros.so \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libpin_init_internal.so \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libbuild_error.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libbindings.rmeta \
  /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/rust/libuapi.rmeta \

hello.o: $(deps_hello.o)

$(deps_hello.o):

hello.o: $(wildcard /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/tools/objtool/objtool)
