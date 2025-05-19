--מיזוג טבלת worker&employee 

INSERT INTO worker (worker_id, w_name, Year_of_starting_work, role)
SELECT employeeid, name, NULL, role
FROM employee
WHERE employeeid NOT IN (SELECT worker_id FROM worker);



--קשר בין מלאי לתהליך ייצור
CREATE TABLE inventory_process (
    inventory_id INT NOT NULL,
    processid INT NOT NULL,
    PRIMARY KEY (inventory_id, processid),
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (processid) REFERENCES productionprocess_(processid_)
);


CREATE TABLE worker_performs_process (
    worker_id INT,
    processid_ INT,
    PRIMARY KEY (worker_id, processid_),
    FOREIGN KEY (worker_id) REFERENCES worker(worker_id),
    FOREIGN KEY (processid_) REFERENCES productionprocess_(processid_)
);

-- הכנסת מזהה של קטיף מענבים של הגיבוי לתוך טבלת קטיף שלנו

WITH new_harvests AS (
    SELECT 
        ROW_NUMBER() OVER () + 999 AS harvest_id,  -- מתחיל מ־1000
        g.harvestdate_ AS harvest_date
    FROM grapes g
    WHERE NOT EXISTS (
        SELECT 1 
        FROM harvest h 
        WHERE h.harvest_date = g.harvestdate_
    )
)
INSERT INTO harvest (harvest_id, harvest_date, quantity, inventory_id)
SELECT 
    harvest_id, 
    harvest_date, 
    NULL, 
    NULL
FROM new_harvests;

--הכנסת מזהה ענבים מהגיבוי לתוך טבלת כרם שלנו
INSERT INTO vine (vine_id, v_date, maturity_level)
SELECT DISTINCT grapeid, NULL::DATE, NULL::TEXT
FROM grapes
WHERE grapeid NOT IN (SELECT vine_id FROM vine);

WITH matched_data AS (
    SELECT 
        g.grapeid AS vine_id,
        h.harvest_id
    FROM grapes g
    JOIN harvest h ON g.harvestdate_ = h.harvest_date
    WHERE NOT EXISTS (
        SELECT 1 
        FROM vineyard v 
        WHERE v.vine_id = g.grapeid 
          AND v.harvest_id = h.harvest_id
    )
)
INSERT INTO vineyard (vineyard_id, location, area_size, soil_type, vine_id, harvest_id)
SELECT 
    ROW_NUMBER() OVER () + 999 AS vineyard_id,
    NULL AS location,
    NULL AS area_size,
    NULL AS soil_type,
    vine_id,
    harvest_id
FROM matched_data;