SET SERVEROUTPUT ON;
prompt 'enter book number'
accept &n;
declare
vr number;
excep EXCEPTION;
begin 
select count(b_no)
into vr
from report
where b_no=&n;
dbms_output.put_line(vr);

if (vr>2) then raise excep;
end if;
EXCEPTION
When no_data_found Then dbms_output.put_line('No data found');
when excep then dbms_output.put_line('This book has been reported more than 2 times'); 
end;