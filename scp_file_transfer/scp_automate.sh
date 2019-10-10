#place this script in the folder where you need the csv files to be placed.
#fill the serverA and serverApath variables, which has the csv files.

#To generate a public / private key pair :
#  ssh-keygen -t rsa

#The above will generate 2 files, ~/.ssh/id_rsa (private key) and ~/.ssh/id_rsa.pub (public key)

#To setup the SSH keys for usage (one time task) : Copy the contents of ~/.ssh/id_rsa.pub and paste in a new line of ~devops/.ssh/authorized_keys in myserver.org server. If ~devops/.ssh/authorized_keys doesn't exist, feel free to create it.
#fill the sshKeyPath with private key path. In this case ~/.ssh/id_rsa
#Use this comprehensive guide if above is not clear enough. https://kb.iu.edu/d/aews

serverA=username@server
serverApath=/absolute/path/to/folder/
sshKeyPath=~/.ssh/id_rsa

scp -i sshKeyPath $serverA:$serverApath*.csv .


