#Installing the postgres developer libraries

sudo apt install postgresql-server-dev-11

#export PATH=/usr/lib/postgresql/11/bin:$PATH

#Checking if pgxs successfully installed
pg_config --pgxs

#building the extension
sudo make USE_PGXS=1

#installing the extension
sudo make USE_PGXS=1 install

sudo chown -R postgres:postgres /home/gayan/Desktop/CiperLabs/fiever/postgres/adme