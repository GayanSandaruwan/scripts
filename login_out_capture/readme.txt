# For DEMO
Copy the file to a folder in the server.
Run setup.sh file with elivated privillages, it will setup the services. create forlders and the scripts that need to run.
run with sudo bash setup.sh

All the output and the modified scripts according to your servers paths will be created under fixed_scripts folder in the directory where the setup.sh was run.
user activity will be logged into the log.txt file and the output of the demo script will be logged to time_logs.txt

# For final version

Open the executor.sh file inside scipts directory. Not the one inside fixed scripts. 

set the executor_shell_path variable to the shell type of your next program, this can be anything with a valid shell path. currently it is set to /bin/bash : the default shell in ubuntu

then set the second_script_to_execute variable this is the path to your next script. Currently it is set to log_to_file.sh


This script assumes that there will be only one user and, he will log out properly.
If the user didn't log out from one shell and logged in from another shell and then logout, still the executor wont run untill the session of the priviosly logged in shell expires.
You can logout from the shell by issuing 'logout'

#TO see the status of the service

systemctl status afterlogout

in status log you can see the process ids, if you need to see the process state 
ps process_id

#To  remove the sevice use following commands

sudo systemctl stop afterlogout.service
sudo systemctl disable afterlogout.service
sudo rm /etc/systemd/system/afterlogout.service

or run uninstall.sh file by,
sudo bash uninstall.sh
