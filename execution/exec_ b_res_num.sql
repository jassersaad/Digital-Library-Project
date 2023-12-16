set serveroutput on;
Accept vd prompt 'please enter the member id';
variable nbrbook number;

execute :nbrbook:= pck_library.b_res_num(&vd);
print nbrbook;
