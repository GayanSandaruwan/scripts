#!/bin/sh
sender="sendermail"
reciever="reciever"
senderpass="senderpass"
log_file="/root/""$(date +'%d-%m-%Y-')""log.txt"

sendmail -v -H "exec openssl s_client -quiet -connect smtp.gmail.com:587 -tls1 -starttls smtp" < "$log_file" -f "$sender" -au"$sender" -ap"$senderpass "$reciever