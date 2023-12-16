--This trigger checks if the date inserted in the reservation is under the system date

create or replace trigger date_res
before insert or update of rdate on reservation
for each row

begin
if (:new.rdate < sysdate) then
RAISE_APPLICATION_ERROR(-20000, 'The date is under the system date'); 
end if;
end;