CREATE OR REPLACE FUNCTION update_vine_maturity()
RETURNS TRIGGER AS
$$
DECLARE
    vine_date DATE;
    vine_id_val INTEGER;
    age_in_years INTEGER;
BEGIN
    -- נשלוף את vine_id לפי inventory_id מהטבלה vineyard
    SELECT v.vine_id, vi.v_date
    INTO vine_id_val, vine_date
    FROM vineyard y
    JOIN vine v ON y.vine_id = v.vine_id
    JOIN inventory i ON y.harvest_id = NEW.harvest_id AND i.inventory_id = NEW.inventory_id
    JOIN harvest h ON h.harvest_id = y.harvest_id
    WHERE i.inventory_id = NEW.inventory_id;

    -- נחשב כמה שנים עברו בין תאריך הגפן לקטיף
    age_in_years := DATE_PART('year', NEW.harvest_date) - DATE_PART('year', vine_date);

    -- נעדכן את רמת הבשלות
    IF age_in_years < 1 THEN
        UPDATE vine SET maturity_level = 'unripe' WHERE vine_id = vine_id_val;
    ELSIF age_in_years BETWEEN 1 AND 3 THEN
        UPDATE vine SET maturity_level = 'ripe' WHERE vine_id = vine_id_val;
    ELSE
        UPDATE vine SET maturity_level = 'rotten' WHERE vine_id = vine_id_val;
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
--- תנאי הטרייגר

CREATE TRIGGER trg_update_vine_maturity
AFTER INSERT ON harvest
FOR EACH ROW
EXECUTE FUNCTION update_vine_maturity();

