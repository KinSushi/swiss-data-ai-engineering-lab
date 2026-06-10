-- Oracle PL/SQL awareness example for banking legacy environments.
CREATE OR REPLACE PROCEDURE check_transaction_amount(p_amount IN NUMBER) AS
BEGIN
    IF p_amount < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Negative amount requires review');
    END IF;
END;
/
