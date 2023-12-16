CREATE OR REPLACE PROCEDURE remove_librarian(v_lid in librarian.l_id%type) IS

BEGIN
DELETE FROM librarian
WHERE l_id=v_lid;
COMMIT;
END;

Accept lid prompt 'please enter book id';
execute remove_librarian(&lid);
