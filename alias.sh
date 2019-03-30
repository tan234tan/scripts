#!/bin/bash

# get all hosts from gitlab,save to ~/scripts/hosts.txt


# create alias eg: alias hdc03='ssh wxtan@hdc-sc-perf03'
cd ~/scripts
if [ -e hosts.txt ];then
  grep -v msv hosts.txt > hosts_no_msv.txt   
  cat hosts_no_msv.txt | awk -F '-|perf' '{print "alias " $1 $4 "=" "'\''" "ssh wxtan@" $0 "'\''"}' > p4-alias

  grep msv hosts.txt > hosts_msv.txt
  cat hosts_msv.txt | awk -F '-|per' '{print "alias " $1 $4 "=" "'\''" "ssh wxtan@" $0 "'\''"}' >> p4-alias
  echo "please run source p4-alias"
else
  echo "No hosts.txt file, please generate it"
fi



# put public key to every server, save private key on ~/.ssh/id_rsa
# backup private key eg: cp -a ~/.ssh/id_rsa ~/.ssh/id_rsa.wxtan.bck

# save alias file to ~/scripts/p4-alias
