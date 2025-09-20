savedcmd_zero.ko := ld.lld -r -m elf_x86_64 -z noexecstack --build-id=sha1  -T /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/scripts/module.lds -o zero.ko zero.o zero.mod.o .module-common.o
