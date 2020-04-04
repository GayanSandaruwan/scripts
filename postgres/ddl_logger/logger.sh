#! /bind/bash

ddl_log_file_path="/home/gayan/Desktop/CiperLabs/fiever/postgres/ddl_logger/ddl.sql"
temporary_ddl_file_path="/home/gayan/Desktop/CiperLabs/fiever/postgres/ddl_logger/temp.sql"
sudo -u postgres -H -- psql  -c "select ddl from ddl_logger where logged_to_file='false';" > "${temporary_ddl_file_path}"

head -n -2 "${temporary_ddl_file_path}" | tail -n +3 >> "${ddl_log_file_path}"

sudo -u postgres -H -- psql  -c "update ddl_logger set logged_to_file=true where logged_to_file=false;" 