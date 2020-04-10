#!/bin/bash

# This script will create the necessary services to run the application

terminator_and_watch_logout_path="/etc/systemd/system/afterlogout.service"
# terminator_and_watch_logout_path="test.terminator_and_watch_logout.service"


terminator_file_path="$(pwd)/fixed_scripts/terminator.sh"
executor_file_path="$(pwd)/fixed_scripts/executor.sh"

current_directory="$(pwd)"

sudo -u "$(whoami)" mkdir fixed_scripts/

sudo -u "$(whoami)" sed "s:pwd:${current_directory}:g" < "scripts/executor.sh" > "fixed_scripts/executor.sh"  
sudo -u "$(whoami)" sed "s:pwd:${current_directory}:g" < "scripts/terminator.sh" > "fixed_scripts/terminator.sh"  
sudo -u "$(whoami)" sed "s:pwd:${current_directory}:g" < "scripts/log_to_file.sh" > "fixed_scripts/log_to_file.sh"  


#check for watch_logout_service and add if not available
sed "s:pwd:${current_directory}:g" < "services/afterlogout.service" >> "${terminator_and_watch_logout_path}" 
echo "service file created"

sudo -u "$(whoami)" systemctl enable afterlogout.service
sudo -u "$(whoami)" systemctl daemon-reload 
echo "reloading the systemd to reflect changes"
sudo -u "$(whoami)" systemctl start afterlogout.service
echo "Starting the service"
