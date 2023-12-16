CREATE OR REPLACE PROCEDURE reserve_book (v_r in reservation.res_num%type,v_mid in reservation.m_no%type, v_bid in reservation.b_no%type) IS

BEGIN

insert into reservation(res_num,m_no,b_no,rdate)
values(v_r,v_mid,v_bid,sysdate);
dbms_output.put_line('done');
COMMIT;
END;



execute reserve_book(&rn,&mid,&bod);

