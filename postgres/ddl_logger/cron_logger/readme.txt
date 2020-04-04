1. Open logger.sh file and set the folder path to contain the ddl log file


2. now run ddl_logger_cron from bash with sudo,
sudo bash ddl_logger_cron

3. Done

A file called ddl.sql will be created containing the ddl sqls on the specified path. Cron log will be saved on current directory with name cron_log.txt

BE CAUTIOUS  I have tested on postgresql version 11,
But when before you add this to your production server test it on another one. If any error occured on the trigger you wont be able change it or remove the trigger as well as no ddl will work again.

