insert into messages values(3,'2020-04-29 10:57:00','2020-04-29 10:57:00','sinhala','englishsdfsdfs sdfsdfs sdfsfsd','tamil','https://ascasdsddddddddddddddddddddddddddddddddddddddddddd');



create or replace function notice_ddl() returns event_trigger as $$
/* procedure for writing the DLL to a file */
DECLARE
	current_query TEXT;
	file_path TEXT;
BEGIN
	/* Get the current query to the variable */
  current_query := current_query();
  /* notify on the execution time of the DDL to the user */
  raise info '%', current_query;
  /* file path where the DDL appending file should be located, this file needs to have permissions for the postgre user to read and write */
  file_path := '/home/gayan/Desktop/test.txt';
  /* Get the current query and append it to the file */
  EXECUTE 'COPY (select current_query()) TO PROGRAM ''cat >>' || file_path ||'''';
END;
$$ language plpgsql;



CREATE event trigger notice_ddl_trigger on ddl_command_start execute procedure notice_ddl();



create table so(i int);
drop table so;

sudo systemctl start postgresql@11-main
pg_dropcluster --stop 11 main
pg_createcluster 11 main



CREATE OR REPLACE FUNCTION my_trigger_function() RETURNS trigger  AS $$
DECLARE
	current_query TEXT;
	file_path TEXT;
BEGIN
  current_query := current_query();
  raise info '%', current_query;
  file_path := '/home/gayan/Desktop/test.txt';
  EXECUTE 'COPY (select current_query()) TO PROGRAM ''cat >>' || file_path ||'''';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER my_trigger
BEFORE INSERT ON test
FOR EACH ROW
EXECUTE PROCEDURE my_trigger_function();


sudo chmod -R o+rw '/home/gayan/Desktop/test.txt'