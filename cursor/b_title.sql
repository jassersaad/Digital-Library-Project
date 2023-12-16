SET SERVEROUTPUT ON;
prompt 'please enter the member id'
Accept &vd;
declare
cursor C1(v_id member.m_id%type) is 
select b_name
from book,member, reservation
where reservation.m_no=member.m_id
and reservation.b_no=book.b_id
and member.m_id=v_id;
v_title book.b_name%type;
begin 
open C1(&vd);
loop
fetch C1 into v_title;
exit when C1%notfound;
dbms_output.put_line(v_title);
end loop;
close C1;
end;
