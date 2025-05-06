-- שאילתה 1
-- מחיקת כל סוגי הענבים האדומים שנשתלו בחודשי יולי 

DELETE FROM grape_variety
WHERE grape_variety_id IN (
    SELECT gv.grape_variety_id
    FROM grape_variety gv
    JOIN vine v ON gv.vine_id = v.vine_id
    WHERE gv.color = 'red'
      AND EXTRACT(MONTH FROM v.v_date) = 7
);
-- שאילתה 2
-- מוחקת ביצועים של עובדים שתפקידם קצירה ולא ביצעו תחזוקה בחודש פברואר 2025
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
        AND EXTRACT(YEAR FROM m_date) = 2025
    )
    ORDER BY worker_id
);

-- שאילתה 3
-- מחיקת הקשר בין משימות תחזוקה לכרמים עם אדמה חולית שהקטיף שלהם התרחש אחרי היום החמישי בחודש
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



