CREATE OR REPLACE FUNCTION prevent_extreme_negative_amount()
RETURNS trigger AS $$
BEGIN
    IF NEW.amount < -10000 THEN
        RAISE EXCEPTION 'Extreme negative amount requires manual intervention';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_prevent_extreme_negative_amount
BEFORE INSERT OR UPDATE ON transactions
FOR EACH ROW
EXECUTE FUNCTION prevent_extreme_negative_amount();
