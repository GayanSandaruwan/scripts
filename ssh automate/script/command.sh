
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

