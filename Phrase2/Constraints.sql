-- Constraint 1: Adding NOT NULL Harvest date cannot be empty.
ALTER TABLE harvest
MODIFY harvest_date DATE NOT NULL;

-- Constraint 2: Adding a CHECK constraint to ensure the grape variety color is either 'Red' or 'White'
ALTER TABLE grape_variety
ADD CONSTRAINT check_color CHECK (color IN ('Red', 'White'));

-- Constraint 3: Adding a DEFAULT value to the maturity_level column in the vine table
ALTER TABLE vine
MODIFY maturity_level VARCHAR DEFAULT 'unripe';
