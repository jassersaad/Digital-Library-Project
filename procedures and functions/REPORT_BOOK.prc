
CREATE OR REPLACE PROCEDURE report_book (r_n in report.r_num%type, v_bid in report.b_no%type) IS
vr number;
excep EXCEPTION;
BEGIN
select count(b_no)
into vr
from report
where b_no=v_bid;
dbms_output.put_line(vr);

if (vr>2) then raise excep;
else
insert into report(r_num,b_no)
values(r_n,v_bid);
dbms_output.put_line('done');
COMMIT;
end if;

EXCEPTION
When no_data_found Then dbms_output.put_line('No data found');
when excep then dbms_output.put_line('This book has been reported more than 2 times'); 
END;

