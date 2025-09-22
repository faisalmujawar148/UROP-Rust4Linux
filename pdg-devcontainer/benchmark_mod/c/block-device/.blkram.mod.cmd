savedcmd_blkram.mod := printf '%s\n'   blkram.o | awk '!x[$$0]++ { print("./"$$0) }' > blkram.mod
