-- Start of transaction
BEGIN;

-- Update Query 1: Upgrade worker role to "Senior Harvester" if they harvested more than 50 grapes in a single event
UPDATE worker
SET role = 'Senior Harvester'
WHERE worker_id IN (
    SELECT p.worker_id
    FROM perform p
    JOIN harvest h ON p.harvest_id = h.harvest_id
    WHERE h.quantity > 50
);
SELECT * FROM worker;

-- Rollback the changes
ROLLBACK;

-- Display the table after ROLLBACK
SELECT * FROM worker;

-- Perform the update again
UPDATE worker
SET role = 'Senior Harvester'
WHERE worker_id IN (
    SELECT p.worker_id
    FROM perform p
    JOIN harvest h ON p.harvest_id = h.harvest_id
    WHERE h.quantity > 50
);
SELECT * FROM worker;

-- Commit the changes
COMMIT;

-- Display the table after COMMIT
SELECT * FROM worker;


-- Start of second transaction
BEGIN;

-- Update Query 2: Change the maturity level to 'Stressed' for vines related to harvests with more than 65 units picked in January
UPDATE vine
SET maturity_level = 'Stressed'
WHERE vine_id IN (
    SELECT g.vine_id
    FROM grape_variety g
    JOIN vineyard v ON g.vine_id = v.vine_id
    JOIN harvest h ON v.harvest_id = h.harvest_id
    WHERE 
        EXTRACT(MONTH FROM h.harvest_date) = 1 AND
        h.quantity > 65
);
SELECT * FROM vine;

-- Rollback the changes
ROLLBACK;

-- Display the table after ROLLBACK
SELECT * FROM vine;

-- Perform the update again
UPDATE vine
SET maturity_level = 'Stressed'
WHERE vine_id IN (
    SELECT g.vine_id
    FROM grape_variety g
    JOIN vineyard v ON g.vine_id = v.vine_id
    JOIN harvest h ON v.harvest_id = h.harvest_id
    WHERE 
        EXTRACT(MONTH FROM h.harvest_date) = 1 AND
        h.quantity > 65
);
SELECT * FROM vine;

-- Commit the changes
COMMIT;

-- Display the table after COMMIT
SELECT * FROM vine;


-- Start of third transaction
BEGIN;

-- Update Query 3: Increase inventory quantity by 10% where harvested quantity is greater than inventory quantity, but only for red grapes
UPDATE inventory
SET inventory_quantity = inventory_quantity * 1.10
WHERE inventory_id IN (
    SELECT h.inventory_id
    FROM harvest h
    JOIN vineyard v ON h.harvest_id = v.harvest_id
    JOIN grape_variety g ON v.vine_id = g.vine_id
    JOIN inventory i ON h.inventory_id = i.inventory_id
    WHERE g.color = 'Red'
      AND h.quantity > i.inventory_quantity
);
SELECT * FROM inventory;

-- Rollback the changes
ROLLBACK;

-- Display the table after ROLLBACK
SELECT * FROM inventory;

-- Perform the update again
UPDATE inventory
SET inventory_quantity = inventory_quantity * 1.10
WHERE inventory_id IN (
    SELECT h.inventory_id
    FROM harvest h
    JOIN vineyard v ON h.harvest_id = v.harvest_id
    JOIN grape_variety g ON v.vine_id = g.vine_id
    JOIN inventory i ON h.inventory_id = i.inventory_id
    WHERE g.color = 'Red'
      AND h.quantity > i.inventory_quantity
);
SELECT * FROM inventory;

-- Commit the changes
COMMIT;

-- Display the table after COMMIT
SELECT * FROM inventory;
