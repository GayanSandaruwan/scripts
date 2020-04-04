create or replace table public.ddl_logger (id SERIAL PRIMARY KEY, ddl TEXT, ts timestamp without time zone default (now() at time zone 'utc'), logged_to_file boolean);

create or replace function notice_ddl() returns event_trigger as $$
/* procedure for writing the DLL to a file */
DECLARE
	current_query TEXT;
BEGIN
	/* Get the current query to the variable */
  current_query := current_query();
  /* notify on the execution time of the DDL to the user */
  raise info '%', current_query;

  /* Insert the query string into the ddl_logger table*/
  INSERT into public.ddl_logger(ddl, logged_to_file) values(current_query(),false);

END;
$$ language plpgsql;



CREATE event trigger notice_ddl_trigger on ddl_command_start execute procedure notice_ddl();

create or replace table so(i int);
drop table so;
