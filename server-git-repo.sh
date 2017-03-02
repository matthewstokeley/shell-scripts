#! /bin/bash
cd /var
sudo mkdir repo && cd repo
sudo mkdir site.git && cd site.git
sudo chown -R USER:admin ./
git init --bare
ls
cd hooks
cat <<EOF > post-receive

#!/bin/bash
#
## store the arguments given to the script
read oldrev newrev refname

## Where to store the log information about the updates
LOGFILE=./post-receive.log
# The deployed directory (the running site)
DEPLOYDIR=/home/[dir]

## Record the fact that the push has been received
echo -e "Received Push Request at $( date +%F )" >> $LOGFILE
echo " - Old SHA: $oldrev New SHA: $newrev Branch Name: $refname" >> $LOGFILE

## Update the deployed copy
echo "Starting Deploy" >> $LOGFILE

echo " - Starting code update"
GIT_WORK_TREE="$DEPLOYDIR" git checkout -f
echo " - Finished code update"
cd DEPLOYDIR
npm install
npm postinstall
echo "Finished Deploy" >> $LOGFILE
EOF