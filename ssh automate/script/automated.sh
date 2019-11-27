#!/bin/bash

IP_LIST="/home/dell/THingsThatWork_DontBreak/IP.LIST"
CONFIG="/home/dell/THingsThatWork_DontBreak/log.txt"

cat <<SCRIPT > command.sh

echo ---------------------------------------
echo "0. NAMES FROM HOSTNAME"
echo ---------------------------------------
hostname
hostname -f

echo ---------------------------------------
echo "1. IP FROM HOSTNAME"
echo ---------------------------------------
hostname -i

echo ---------------------------
echo "2. DATA FROM cat /etc/*lease"
echo ---------------------------
cat /etc/*lease

echo ---------------------------
echo "3. DATA FROM sbin/ifconfig -a" 
echo ---------------------------
/sbin/ifconfig -a 

echo ---------------------------
echo "4. DATA FROM cat /etc/hosts"
echo ---------------------------
cat /etc/hosts

echo ---------------------------
echo "5. DATA FROM cat /etc/fstab"
echo ---------------------------
cat /etc/fstab

echo --------------------------
echo "6. DATA FROM df -k"
echo ---------------------------
df -k
echo --------------------------
echo "7. DATA FROM last"

echo ---------------------------
last -5
##cp LINUX_DECOM.txt LIN_DEC.csv

SCRIPT


a=1
for i in $(cat $IP_LIST);do 		
	user=$(cat $CONFIG | head -$a | tail -1 | awk -F: '{print $1}')
	pass=$(cat $CONFIG | head -$a | tail -1 | awk -F: '{print $2}')
	sshpass -f <(printf '%s\n' $pass) ssh -o "StrictHostKeyChecking no" $user@$i 'bash -s' < command.sh  
((a++))
done  | tee LINUX_DECOM.txt
cp LINUX_DECOM.txt LIN_DECOM.csv && echo "Data copied in csv format"
