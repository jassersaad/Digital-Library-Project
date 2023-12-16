SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE book_info(v_i IN book.b_id%type)
IS
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


Accept bid prompt 'please enter book id';
execute book_info(&bid);





