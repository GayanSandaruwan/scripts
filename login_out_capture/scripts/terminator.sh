#!/bin/bash

# The pid of the spawned process will be sotred here, and will be read from the terminator script to terminate the process
pid_file_path="pwd/fixed_scripts/pid"

#User login logged out acitivity will be logged to here
user_activity_log_file_path="pwd/fixed_scripts/log.txt"

#Reading the pid from file
pid=$(<"${pid_file_path}")

#Send a termination signal to gracefully terminate a process
echo "$(date) Sengding SIGTERM to gracefully shutdown the process with pid  ${pid}" >> "${user_activity_log_file_path}"
kill -SIGTERM $pid

sleep 1s
#Wait 20 seconds before killing the process
if [ -n "$pid" -a -e /proc/$pid ]; then
    echo "$(date) Process with PID ${pid} is still available after SIGTERM, waiting 20s before killing with SIGKILL" >> "${user_activity_log_file_path}"
	sleep 20s
fi

#Kill the process if it is still running
if [ -n "$pid" -a -e /proc/$pid ]; then
    echo "$(date) Process with PID ${pid} is still available 20s after SIGTERM, killing with SIGKILL" >> "${user_activity_log_file_path}"
    kill -SIGKILL $pid
fi