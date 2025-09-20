savedcmd_zero.mod := printf '%s\n'   zero.o | awk '!x[$$0]++ { print("./"$$0) }' > zero.mod
