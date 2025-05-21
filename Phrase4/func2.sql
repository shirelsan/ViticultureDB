
CREATE OR REPLACE FUNCTION maintenance_summary_update(cutoff_date DATE, INOUT ref refcursor)
RETURNS refcursor AS
$$
DECLARE
    rec_task RECORD;
    cur_tasks CURSOR FOR
        SELECT task_id, task_type, m_date, worker_id
        FROM maintenace
        WHERE m_date <= cutoff_date;
BEGIN
    OPEN cur_tasks;

    LOOP
        FETCH cur_tasks INTO rec_task;
        EXIT WHEN NOT FOUND;

        BEGIN
            -- עדכון תפקיד העובד בהתאם לסוג המשימה
            IF rec_task.task_type = 'pruning' THEN
                UPDATE worker
                SET role = 'Pruner'
                WHERE worker_id = rec_task.worker_id;
            ELSIF rec_task.task_type = 'harvesting' THEN
                UPDATE worker
                SET role = 'Harvester'
                WHERE worker_id = rec_task.worker_id;
            ELSE
                UPDATE worker
                SET role = 'General Worker'
                WHERE worker_id = rec_task.worker_id;
            END IF;
        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'Error updating worker %: %', rec_task.worker_id, SQLERRM;
        END;
    END LOOP;

    CLOSE cur_tasks;

    OPEN ref FOR
        SELECT task_id, task_type, m_date, worker_id
        FROM maintenace
        WHERE m_date <= cutoff_date;

    RETURN;
END;
$$ LANGUAGE plpgsql;תסביר לי מה הפונקציה עושה

BEGIN;
SELECT maintenance_summary_update('2025-4-30', 'maintenance_cursor') AS cur_name;
FETCH ALL IN "maintenance_cursor";
COMMIT;

-- שליפת כל העובדים כדי לראות את התפקידים (roles) לאחר העדכון
SELECT * FROM worker;
