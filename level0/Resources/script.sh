#!/bin/bash

# first transfer both source.c and script.sh to /tmp of rainfall's VM

# scp -P 4242 yourpath/source.c level0@localhost:/tmp
# scp -P 4242 yourpath/Resources/script.sh level0@localhost:/tmp

# then go to the VM and run this script to test source.c


# first in order to test this, the result binary should be owned by 'level1'
# let's do this using '~/level0 423' => this will open a shell where the user is 'level1'
# we'll use this shell to execute the following script:

# compile and add setuid like in level0 binary (as it's necessary to have level1's permissions while execution)
gcc /tmp/source.c -o test0

chmod u+s /tmp/test0

# reminder: /tmp is mounted with nosuid
