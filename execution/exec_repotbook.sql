SET SERVEROUTPUT ON;
Accept bid prompt 'please enter book id';
Accept rn prompt 'please enter report number';
execute pck_library.report_book(&rn,&bid);