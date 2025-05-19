
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
CREATE VIEW container_process_info AS
SELECT 
    pc.ContainerID_,
    c.Type_ AS ContainerType,
    c.CapacityL_,
    pp.ProcessID_,
    pp.Type_ AS ProcessType,
    pp.StartDate_,
    pp.EndDate_,
    pp.BatchNumber_
FROM processContainers pc
JOIN Containers_ c ON pc.ContainerID_ = c.ContainerID_
JOIN ProductionProcess_ pp ON pc.ProcessID_ = pp.ProcessID_;

--שאילתה 1: סך כל קיבולת המיכלים בהם השתמשו לפי סוג תהליך

SELECT ProcessType, SUM(CapacityL_) AS TotalCapacityUsed
FROM container_process_info
GROUP BY ProcessType
ORDER BY TotalCapacityUsed DESC;

--שאילתה 2:?מהם תהליכי הייצור שנמשכו הכי הרבה זמן, ושנעשה בהם שימוש במיכלים הגדולים ביותר
SELECT cpi.ProcessID_,cpi.ContainerID_,cpi.CapacityL_,pp.StartDate_,pp.EndDate_,
    (pp.EndDate_ - pp.StartDate_) AS DurationDays
FROM container_process_info AS cpi
JOIN ProductionProcess_ AS pp ON cpi.ProcessID_ = pp.ProcessID_
WHERE cpi.CapacityL_ = (SELECT MAX(CapacityL_) FROM container_process_info)
ORDER BY  DurationDays DESC;



















