---  this function check the number of reservation of a given book

CREATE OR REPLACE function b_res_num( v_bid book.b_id%type)
return number
is
v_num number;

begin
select count(res_num)
into v_num
from book, reservation
where reservation.b_no=book.b_id
and reservation.b_no=v_bid;
return v_num;

end;

