create or replace trigger price_con
before insert or update of price on book
for each row

begin
if ((:new.price < 20) or (:new.price > 350))  then
RAISE_APPLICATION_ERROR(-20001,'the price must bebetween 20 and 350'); 
end if;
end;