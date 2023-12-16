SET SERVEROUTPUT ON;
Accept bid prompt 'please enter book id';
execute pck_library.book_info(&bid);