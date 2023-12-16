-- this trigger checks if the book is already reserved for the date

create or replace trigger date_reserved
before insert or update of rdate on reservation
for each row
declare 
bn reservation.b_no%type;
cursor C2  is 
select rdate
from reservation
where reservation.b_no=bn;
v_date date;
begin
open C2;
loop
fetch C2 into v_date;
exit when C2%notfound;
if (v_date = sysdate) then
RAISE_APPLICATION_ERROR(-20001, 'this date is taken'); 
end if;
end loop;
close C2;
end;