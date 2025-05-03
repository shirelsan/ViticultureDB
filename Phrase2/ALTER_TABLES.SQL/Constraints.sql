
-- Constraint 1: Adding NOT NULL Harvest date cannot be empty.
ALTER TABLE harvest
ALTER COLUMN harvest_date SET NOT NULL;

-- Constraint 2:Adding a CHECK constraint to ensure the grape variety color is either 'Red' or 'White'
ALTER TABLE grape_variety
ADD CONSTRAINT check_color CHECK (color IN ('Red', 'White'));

-- Constraint 3:Adding a DEFAULT value to the maturity_level column in the vine table
ALTER TABLE vine
ALTER COLUMN maturity_level SET DEFAULT 'unripe';


--Checking the constraints

-- Checking Constraint 1 NOT NULL
INSERT INTO harvest (harvest_id, quantity, inventory_id)
VALUES (4, 80, 1);

--  Checking Constraint 2 CHECK 
INSERT INTO grape_variety (g_name, color, grape_variety_id, vine_id)
VALUES ('Test Grape', 'Blue', 4, 1);

--Checking Constraint 3 Default
INSERT INTO vine (vine_id, v_date)
VALUES (4, '2024-01-01');
--checking:
SELECT vine_id, maturity_level FROM vine WHERE vine_id = 4;

