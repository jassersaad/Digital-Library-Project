CREATE OR REPLACE PROCEDURE add_Book(
 v_i book.b_id%type,
  v_n book.b_name%type,
  v_a book.author%type,
  v_c book.category%type,
  v_p book.price%type)
IS
BEGIN
  INSERT INTO book(b_id,b_name,author,category,price)
  VALUES(v_i,v_n,v_a,v_c,v_p);
  DBMS_OUTPUT.PUT_LINE('Book inserted correctly');
END;