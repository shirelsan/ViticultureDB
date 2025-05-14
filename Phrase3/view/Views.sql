
--view1-our DB

CREATE VIEW maintenance_task_info AS
SELECT
    m.task_id,
    m.task_type,
    m.m_date,
    w.w_name AS worker_name,
    v.location AS vineyard_location,
    v.soil_type
FROM
    maintenace m
JOIN
    worker w ON m.worker_id = w.worker_id
JOIN
    Receive r ON m.task_id = r.task_id
JOIN
    vineyard v ON r.vineyard_id = v.vineyard_id;

--query1

SELECT
    soil_type,
    COUNT(task_id) AS maintenance_count
FROM
    maintenance_task_info
GROUP BY
    soil_type
ORDER BY
    maintenance_count DESC;

--query2

SELECT vineyard_location, worker_name, COUNT(*) AS tasks_done
FROM maintenance_task_info
GROUP BY vineyard_location, worker_name
HAVING COUNT(*) = (
  SELECT MAX(task_count) FROM (
    SELECT COUNT(*) AS task_count
    FROM maintenance_task_info AS m2
WHERE m2.vineyard_location = maintenance_task_info.vineyard_location
GROUP BY m2.worker_name ) AS sub )
ORDER BY vineyard_location;

--view2-the other DB

CREATE VIEW production_overview AS
SELECT
    pp.processid_,
    pp.type_ AS process_type,
    pp.startdate_,
    pp.enddate_,
    pp.seqnumber,
    e.name AS employee_name,
    e.role AS employee_role,
    g.variety AS grape_variety,
    g.harvestdate_ AS grape_harvest_date,
    f.winetype_,
    f.bottlingdate_,
    f.numbottls
FROM
    productionprocess_ pp
JOIN employee e ON pp.employeeid = e.employeeid
JOIN grapes g ON pp.grapeid = g.grapeid
JOIN finalproduct_ f ON pp.batchnumber_ = f.batchnumber_;

-- query1
SELECT winetype_, SUM(numbottls) AS total_bottles
FROM production_overview
GROUP BY winetype_
ORDER BY total_bottles DESC;

-- query2
SELECT
    employee_name,
    employee_role,
    COUNT(processid_) AS total_processes
FROM
    production_overview
GROUP BY
    employee_name, employee_role
ORDER BY
    total_processes DESC;

