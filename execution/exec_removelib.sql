SET SERVEROUTPUT ON;
Accept lid prompt 'please enter book id';
execute pck_library.remove_librarian(&lid);