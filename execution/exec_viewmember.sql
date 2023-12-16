SET SERVEROUTPUT ON;
Accept n_id prompt 'please enter member id';
execute pck_library.view_member(&n_id);