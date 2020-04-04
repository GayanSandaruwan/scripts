Save data from the PV Solar charge controller into a temporary file: (sty raw;cat > /tmp/solar.txt) < /dev/ttyUSB0
Save data from the Datalogger into a temporary file: (sty raw;cat > /tmp/datalogger.txt) < /dev/ttyACM0
I have also used the commands below to send the data to an email address.
Send an email with the contents of the PV Solar file: sendmail -v -H "exec openssl s_client -quiet -connect smtp.gmail.com:587 -tls1 -starttls smtp" </tmp/solar.txt -f myEmailAddress -au"myEmailAddress" -ap"MyPassword" myEmailAddress

All the above is working when I manually issue commands to the RUT955 using PuTTy as the command console. So I am happy that I can receive data from both devices.
What I am trying to do is to automate all of the above so that it sends an email once a day every day with the files solar.txt and datalogger.txt as attachments. I think that I can use Cron to achieve this.
Requirements:
Set up the port baud speeds stty -F /dev/ttyACM0 57600 and stty -F /dev/ttyUSB4 19200
Create a new file each day on the router where the data logger data will be saved, append the current date to the file name: touch /tmp/datalogger 31-10-2019.txt
Create a new file each day on the router where the solar charge controller data will be saved touch /tmp/solar 31-10-2019.txt
Receive and save data from the data logger through the RS232 port (sty raw;cat > /tmp/datalogger 31-10-2019.txt) < /dev/ttyACM0
Receive and save data from a solar charge controller through the USB port (sty raw;cat > /tmp/solar 31-10-2019.txt) < /dev/ttyUSB4
Send the files as email attachments once a day

FisHEr38IeS3

myEmailAddress=gayankavirathne@gmail.com
MyPassword=
sendmail -v -H "exec openssl s_client -quiet -connect smtp.gmail.com:587 -tls1 -starttls smtp" </tmp/solar.txt -f $myEmailAddress -au"$myEmailAddress" -ap"$MyPassword" $myEmailAddress


(stty raw;cat > /tmp/solar.txt) < /dev/ttyUSB0

stty -F /dev/ttyUSB4 raw
stty -F /dev/ttyUSB4 -echo
while read -rs -n 1 c && [[ $c != '▒' ]]
do
        echo "read <$c>"
done < /dev/ttyUSB4

startc=false
endc=false
message=""
stty -F /dev/ttyUSB4 raw
stty -F /dev/ttyUSB4 -echo
while read -rs -n 1 c
do
	if [ "$c"="▒" ] 
	then
	  if [ $startc ]
	  then
	  	if [ $endc ]
	  	then
	  		exit
	  	else
	  		endc=true
	  	fi
	  else
	  	startc=true
	  fi
	else
	  if [ $startc ]
	  then
	  	message+="$c"
	fi
    echo "read <$c>"
done < /dev/ttyUSB4

echo $message