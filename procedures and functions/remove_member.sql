CREATE OR REPLACE PROCEDURE remove_member(v_id in member.m_id%type) IS
BEGIN
DELETE FROM member
WHERE m_id=v_id;
COMMIT;
END;
