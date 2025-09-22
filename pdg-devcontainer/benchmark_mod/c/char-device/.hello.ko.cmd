savedcmd_hello.ko := ld -r -m elf_x86_64 -z noexecstack --build-id=sha1  -T /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust/scripts/module.lds -o hello.ko hello.o hello.mod.o .module-common.o
