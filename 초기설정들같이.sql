create user book_ex IDENTIFIED by book_ex
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

grant connect, dba to book_ex;