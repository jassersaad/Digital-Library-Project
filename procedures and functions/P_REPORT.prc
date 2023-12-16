create or replace procedure p_report(title book.b_name%type)
is
vb number;
begin
select b_no
into vb
from report
where r_num=2;

update book
set b_name=title
where b_id=vb;

commit;
end;