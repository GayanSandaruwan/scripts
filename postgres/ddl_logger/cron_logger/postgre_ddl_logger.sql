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


/* Test query*/
create table so(i int);
drop table so;
