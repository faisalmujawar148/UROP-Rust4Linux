savedcmd_simpletest.mod := printf '%s\n'   simpletest.o | awk '!x[$$0]++ { print("./"$$0) }' > simpletest.mod
