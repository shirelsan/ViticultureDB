# Phase 4: Programming:

## Introduction:









## פונקציות:


• **פונקציה ראשונה-update_worker_roles_and_return_refcursor**

פה להכניס הסבר על הפונקציה--- 

  ```sql
CREATE OR REPLACE FUNCTION update_worker_roles_and_return_refcursor(min_years INT, INOUT ref refcursor)
RETURNS refcursor AS
$$
DECLARE
    rec_worker RECORD;
    cur_workers CURSOR FOR
        SELECT worker_id, w_name, Year_of_starting_work, role
        FROM worker
        WHERE Year_of_starting_work <= min_years;
BEGIN
    OPEN cur_workers;
    LOOP
        FETCH cur_workers INTO rec_worker;
        EXIT WHEN NOT FOUND;

        BEGIN
            IF rec_worker.Year_of_starting_work <= 5 THEN
                UPDATE worker SET role = 'Junior' WHERE worker_id = rec_worker.worker_id;
            ELSIF rec_worker.Year_of_starting_work > 5 AND rec_worker.Year_of_starting_work <= 15 THEN
                UPDATE worker SET role = 'Mid-level' WHERE worker_id = rec_worker.worker_id;
            ELSE
                UPDATE worker SET role = 'Senior' WHERE worker_id = rec_worker.worker_id;
            END IF;
        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'Error updating worker %: %', rec_worker.worker_id, SQLERRM;
        END;
    END LOOP;
    CLOSE cur_workers;

    OPEN ref FOR
        SELECT worker_id, w_name, Year_of_starting_work, role
        FROM worker
        WHERE Year_of_starting_work <= min_years;

    RETURN; 
END;
$$ LANGUAGE plpgsql;
  ```
