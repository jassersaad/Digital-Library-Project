---  this function check the number of books reserved by the member
create or replace function reserved_books( v_id member.m_id%type)
return number
is
v_num number;

begin
select count(b_id)
into v_num
from book, reservation
where reservation.b_no=book.b_id
and reservation.m_no=v_id;
return v_num;

end;