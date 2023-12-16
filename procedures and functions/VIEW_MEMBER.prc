Set serveroutput on;
CREATE OR REPLACE PROCEDURE view_member(v_mid IN member.m_id%type)
IS
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


Accept n_id prompt 'please enter member id';
execute view_member(&n_id);