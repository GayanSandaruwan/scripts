#! /bind/bash

#You need to se this path
ddl_log_directory="/home/gayan/Desktop/CiperLabs/fiever/postgres/ddl_logger"

# ddl_log_file path and temporary_ddl_file_path
ddl_log_file_path="${ddl_log_directory}/ddl.sql"
temporary_ddl_file_path="${ddl_log_directory}/temp.sql"

#Get the records which were not saved to a file
sudo -u postgres -H -- psql  -c "select ddl from ddl_logger where logged_to_file='false';" > "${temporary_ddl_file_path}"

#Trim unnecessary lines and save to ddl_log_file
head -n -2 "${temporary_ddl_file_path}" | tail -n +3 >> "${ddl_log_file_path}"


#Set the status of new records as written
sudo -u postgres -H -- psql  -c "update ddl_logger set logged_to_file=true where logged_to_file=false;" 