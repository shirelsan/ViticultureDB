
-- Start of transaction 1: Deletion from grape_variety (red grapes planted in July)
BEGIN;

-- Perform deletion
DELETE FROM grape_variety
WHERE grape_variety_id IN (
    SELECT gv.grape_variety_id
    FROM grape_variety gv
    JOIN vine v ON gv.vine_id = v.vine_id
    WHERE gv.color = 'red'
      AND EXTRACT(MONTH FROM v.v_date) = 7
);

-- Display grape_variety table after deletion
SELECT * FROM grape_variety;

-- Rollback the deletion
ROLLBACK;

-- Display grape_variety table after ROLLBACK
SELECT * FROM grape_variety;

-- Perform the deletion again
DELETE FROM grape_variety
WHERE grape_variety_id IN (
    SELECT gv.grape_variety_id
    FROM grape_variety gv
    JOIN vine v ON gv.vine_id = v.vine_id
    WHERE gv.color = 'red'
      AND EXTRACT(MONTH FROM v.v_date) = 7
);

-- Display table after deletion
SELECT * FROM grape_variety;

-- Commit the changes
COMMIT;

-- Display grape_variety table after COMMIT
SELECT * FROM grape_variety;


-- Start of transaction 2: 
BEGIN;

-- Perform deletion
DELETE FROM perform
WHERE worker_id IN (
    SELECT worker_id 
    FROM worker
    WHERE role = 'Harvester'
    GROUP BY worker_id
    HAVING worker_id NOT IN (
        SELECT m.worker_id
        FROM maintenace m
        WHERE EXTRACT(MONTH FROM m_date) = 2
        AND EXTRACT(YEAR FROM m_date) = 2025)
    ORDER BY worker_id
);
-- Display table after deletion
SELECT * FROM perform;

-- Rollback the deletion
ROLLBACK;

-- Display perform table after ROLLBACK
SELECT * FROM perform;

-- Perform the deletion again
DELETE FROM perform
WHERE worker_id IN (
    SELECT worker_id 
    FROM worker
    WHERE role = 'Harvester'
    GROUP BY worker_id
    HAVING worker_id NOT IN (
        SELECT m.worker_id
        FROM maintenace m
        WHERE EXTRACT(MONTH FROM m_date) = 2
        AND EXTRACT(YEAR FROM m_date) = 2025)
    ORDER BY worker_id
);

-- Display table after deletion
SELECT * FROM perform;

-- Commit the changes
COMMIT;

-- Display perform table after COMMIT
SELECT * FROM perform;



-- Start of transaction 3:
BEGIN;

-- Perform deletion
DELETE FROM Receive
WHERE vineyard_id IN (
    SELECT v.vineyard_id
    FROM vineyard v
    JOIN harvest h ON v.harvest_id = h.harvest_id
    WHERE v.soil_type = 'sandy'
    AND EXTRACT(DAY FROM h.harvest_date) > 5
    GROUP BY v.vineyard_id
    HAVING COUNT(*) > 0
    ORDER BY MAX(h.quantity) DESC
);

-- Display table after deletion
SELECT * FROM Receive;

-- Rollback the deletion
ROLLBACK;

-- Display Receive table after ROLLBACK
SELECT * FROM Receive;

-- Perform the deletion again
DELETE FROM Receive
WHERE vineyard_id IN (
    SELECT v.vineyard_id
    FROM vineyard v
    JOIN harvest h ON v.harvest_id = h.harvest_id
    WHERE v.soil_type = 'sandy'
    AND EXTRACT(DAY FROM h.harvest_date) > 5
    GROUP BY v.vineyard_id
    HAVING COUNT(*) > 0
    ORDER BY MAX(h.quantity) DESC
);

-- Display table after deletion
SELECT * FROM Receive;

-- Commit the changes
COMMIT;

-- Display Receive table after COMMIT
SELECT * FROM Receive;
