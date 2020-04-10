#!/bin/bash

echo "Parent $BASHPID"

#User login logged out acitivity will be logged to here
user_activity_log_file_path="pwd/fixed_scripts/log.txt"

##Path for the second script to be run
second_script_to_execute="/home/dengai/ogin_out_capture/fixed_scripts/log_to_file.sh"

# The pid of the spawned process will be sotred here, and will be read from the terminator script to terminate the process
pid_file_path="pwd/fixed_scripts/pid"

#Executor shell could be anyshell, eg:  /bin/bash /bin/sh , mysql,  matlab ; its enough to give the absolute path of the executor shell
executor_shell_path='/bin/bash'

#Terminating script file path
terminator_file_path="pwd/fixed_scripts/terminator.sh"

echo "$(date) starting Executor Process" >>  "${user_activity_log_file_path}"

while [ 1 -lt 2 ] ; do
    if [ -z "$(who)" ]
    then
    	if [[ "$run_state" == "run" ]]; then
    		echo "secondary process already running" >>  "${user_activity_log_file_path}"
    	else
    		echo "$(date) No logged in user, starting the secondary process" >>  "${user_activity_log_file_path}"
    		#Execute the next sctipt and log the process id of the newly created process to a file, this is done for terminating the started process on user sign in event
			$executor_shell_path "${second_script_to_execute}" & echo $! > "${pid_file_path}"
            run_state="run"
    	fi
    else
        echo "$(date) $(who) A user logged in terminating the process" >> "${user_activity_log_file_path}"
        run_state="stopped"
        /bin/bash "${terminator_file_path}"
    fi
    sleep 5
done


echo "Process created"