#!/usr/bin/env python3

import fcntl, sys, termios
from subprocess import check_output

# function definition for getting the process ID of the lua script
def get_pid(name):
    return int(check_output(["pidof","-s",name]))

# Process ID is taken for the lua script by name, this will fail if there are multiple lua scripts running
pid = get_pid("lua")

# this is where the stdin file of the found process is located, template is /proc/process_id/fd/0. fd/1 has stderr
file_descriptor = "/proc/"+str(pid)+"/fd/0"

# open the above file to write ( this action needs elivated privillages, that's why we have to run the script in sudo mode)
with open(file_descriptor,"w") as fd:
	for x in sys.argv[1]:					# sys.argv[1] has the command line argument 
		fcntl.ioctl(fd,termios.TIOCSTI,x)	# simply writing to the file descriptor won't work, each writing charactor should invoke a TIOCTI/ ioctl in linux like systems
	fcntl.ioctl(fd,termios.TIOCSTI,"\n")	# finally hit an enter ( might want to change to \r in mac OSX)