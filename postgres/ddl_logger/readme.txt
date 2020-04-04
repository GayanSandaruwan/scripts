1. first create a file (for ddl appending) on the desired directory and grant postgre user read and write access to that file.

For example following commands gives any user to read and write on the file.

sudo chmod -R o+rw '/home/gayan/Desktop/test.txt'


2. open the postgre_ddl_logger.sql and change the file path to the file you created above.

3. Then add the function and trigger to the database. You need to be the same user who has access to the ddl file when creating the function and the trigger.

BE CAUTIOUS  I have tested on postgresql version 11,
But when before you add this to your production server test it on another one. If any error occured on the trigger you wont be able change it or remove the trigger as well as no ddl will work again.

