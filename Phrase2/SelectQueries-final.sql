-- Query 1: Get all workers with their roles and the tasks they performed
SELECT w.worker_id,w.w_name, w.role, m.task_type, m.m_date,
       EXTRACT(DAY FROM m.m_date) AS task_day,
       EXTRACT(MONTH FROM m.m_date) AS task_month,
       EXTRACT(YEAR FROM m.m_date) AS task_year
FROM worker w
JOIN maintenace m ON w.worker_id = m.worker_id;

-- Query 2: How many employees are there in each position?
SELECT role, COUNT(*) AS num_of_workers
FROM worker
GROUP BY role;


-- Query 3: This query returns each worker's ID, name, role, and the number of maintenance tasks they have performed
SELECT w.worker_id, w.w_name, w.role, COUNT(m.task_type) AS num_of_tasks
FROM worker w
JOIN maintenace m ON w.worker_id = m.worker_id
GROUP BY w.worker_id, w.w_name, w.role;

-- Query 4: How many grapes were picked from each type of vine/variety?
SELECT gv.g_name, SUM(h.quantity) AS total_quantity
FROM grape_variety gv
JOIN vine v ON gv.vine_id = v.vine_id
JOIN vineyard y ON y.vine_id = v.vine_id
JOIN harvest h ON y.harvest_id = h.harvest_id
GROUP BY gv.g_name;

-- Query 5: Amount of grapes harvested each month in 2025 (analysis by month)
SELECT 
    EXTRACT(MONTH FROM h.harvest_date) AS harvest_month,
    SUM(h.quantity) AS total_quantity
FROM harvest h
WHERE EXTRACT(YEAR FROM h.harvest_date) = 2025
GROUP BY harvest_month
ORDER BY harvest_month;

-- Query 6: Details about each vineyard – location, soil type, grape type and quantity status (did the harvest exceed 100 kg?)
SELECT 
    y.location,
    y.soil_type,
    gv.g_name,
    gv.color,
    h.quantity,
   CASE 
    WHEN h.quantity > 100 THEN 'Above 100kg'
    ELSE '100kg or less'
END AS quantity_status
FROM vineyard y
JOIN vine v ON y.vine_id = v.vine_id
JOIN grape_variety gv ON gv.vine_id = v.vine_id
JOIN harvest h ON y.harvest_id = h.harvest_id;

-- Query 7:Maintenance in vineyards with only white grapes carried out during 2025
SELECT 
    m.task_id,
    m.task_type,
    m.m_date,
    w.w_name AS worker_name,
    y.location,
    gv.g_name AS grape_variety_name,
    gv.color
FROM maintenace m
JOIN worker w ON m.worker_id = w.worker_id
JOIN Receive r ON m.task_id = r.task_id
JOIN vineyard y ON r.vineyard_id = y.vineyard_id
JOIN vine v ON y.vine_id = v.vine_id
JOIN grape_variety gv ON v.vine_id = gv.vine_id
WHERE gv.color = 'White'
  AND EXTRACT(YEAR FROM m.m_date) = 2025;

-- Query 8: Introducing workers who did both maintenance and harvesting
SELECT DISTINCT w.w_name,w.worker_id
FROM worker w
JOIN maintenace m ON w.worker_id = m.worker_id
JOIN perform p ON w.worker_id = p.worker_id;





