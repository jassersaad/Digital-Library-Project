create or replace trigger audit_book
after delete or update of b_name on book
for each row 

begin

insert into control_book(b_nb,old_title,new_title,modified_date)
values(b_id,:OLD.b_name,:NEW.b_name, sysdate);
end audit_book;


