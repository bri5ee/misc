#Bash script that kills every other pts/tty session besides the one in use every 10 seconds.

#!/bin/bash

tty=">insert current pts/tty here<"
for user in $(who | awk '$1=$1' | cut -d '' -f 2 | grep -v $tty); do pkill -9 -t $user; done
while true; do sleep 10; do ./ssh_script.sh; done
