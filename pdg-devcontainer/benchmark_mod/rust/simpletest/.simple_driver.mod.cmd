savedcmd_simple_driver.mod := printf '%s\n'   simple_driver.o | awk '!x[$$0]++ { print("./"$$0) }' > simple_driver.mod
