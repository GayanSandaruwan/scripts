sudo systemctl stop afterlogout.service
sudo systemctl disable afterlogout.service
sudo rm /etc/systemd/system/afterlogout.service
sudo rm fixed_scripts/executor.sh fixed_scripts/terminator.sh fixed_scripts/log_to_file.sh
