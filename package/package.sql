create or replace package pck_library as
PROCEDURE book_info(v_i IN book.b_id%type);

procedure p_report( title book.b_name%type);
-- this procuder removes a librarian
procedure remove_librarian(v_lid in librarian.l_id%type);
-- this procuder make a report on a book
PROCEDURE report_book (r_n in report.r_num%type, v_bid in report.b_no%type);
-- this procuder make a reservation on a book
PROCEDURE reserve_book (v_r in reservation.res_num%type,v_mid in reservation.m_no%type, v_bid in reservation.b_no%type);
-- this procuder views a member informations
PROCEDURE view_member(v_mid IN member.m_id%type);
-- this procuder removes a member
PROCEDURE remove_member(v_id in member.m_id%type);
---  this function check the number of books reserved by the member
function reserved_books( v_id member.m_id%type) return number;
---  this function check the number of reservation of a given book
function b_res_num( v_bid book.b_id%type) return number;
END;




create or replace package body pck_library as

procedure book_info(v_i IN book.b_id%type) is
  v_b book.b_id%type;
  v_n book.b_name%type;
  v_a book.author%type;
  v_c book.category%type;
  v_p book.price%type;

  
BEGIN
  
 
    SELECT b_id,b_name, author, category, price
    INTO v_b, v_n, v_a, v_c, v_p
    FROM book
    WHERE book.b_id=v_i;
  
    DBMS_OUTPUT.PUT_LINE('BOOK ' || v_b || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('NAME: ' || v_n);
    DBMS_OUTPUT.PUT_LINE('AUTHOR: ' || v_a);
    DBMS_OUTPUT.PUT_LINE('CATEGORY: ' || v_c);
    DBMS_OUTPUT.PUT_LINE('PRICE: ' || v_p);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  
END;
procedure p_report( title book.b_name%type)
is

vb number;
begin
select b_no
into vb
from report
where r_num='2';

update book
set b_name=title
where b_id=vb;

commit;
end;
procedure remove_librarian(v_lid in librarian.l_id%type) is
BEGIN
DELETE FROM librarian
WHERE l_id=v_lid;
COMMIT;
END;

PROCEDURE report_book (r_n in report.r_num%type, v_bid in report.b_no%type) IS
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



PROCEDURE reserve_book (v_r in reservation.res_num%type,v_mid in reservation.m_no%type, v_bid in reservation.b_no%type) is
BEGIN

insert into reservation(res_num,m_no,b_no,rdate)
values(v_r,v_mid,v_bid,sysdate);
dbms_output.put_line('done');
COMMIT;
END;

PROCEDURE view_member(v_mid IN member.m_id%type) is
v_id member.m_id%type; 
  v_pwd member.m_pwd%type;
  v_name member.m_name%type;
  v_surname member.m_surname%type;
  v_email member.m_email%type;
BEGIN
  SELECT m_id, m_pwd, m_name, m_surname, m_email
  INTO v_id, v_pwd, v_name, v_surname, v_email
  FROM member
  WHERE member.m_id=v_mid;
  
  DBMS_OUTPUT.PUT_LINE('MEMBER ' || v_id || ' INFO');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('PASSWORD ' || v_pwd);
  DBMS_OUTPUT.PUT_LINE('NAME: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('SURNAME: ' || v_surname);
  DBMS_OUTPUT.PUT_LINE('EMAIL: ' || v_email);
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  
END;


function reserved_books( v_id member.m_id%type) return number is
v_num number;
begin
select count(b_no)
into v_num
from book, reservation
where reservation.b_no=book.b_id
and reservation.m_no=v_id;
return v_num;

end;

PROCEDURE remove_member(v_id in member.m_id%type) IS
BEGIN
DELETE FROM member
WHERE m_id=v_id;
COMMIT;
END;
function b_res_num( v_bid book.b_id%type)
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


end pck_library;
