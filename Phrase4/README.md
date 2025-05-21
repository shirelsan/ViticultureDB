# Phase 4: Programming:

## Introduction:

## פונקציות:


• **פונקציה ראשונה-update_worker_roles_and_return_refcursor**

**הסבר על הפונקציה:**

הפונקציה מקבלת פרמטר מספרי min_years שמייצג את מספר השנים למעבר מאז תחילת העבודה של העובדים.

קורסור פנימי: הפונקציה מגדירה ופותחת קורסור שמביא את כל העובדים (worker) שתחילת עבודתם (Year_of_starting_work) קטנה או שווה ל-min_years.

לולאת עיבוד: בתוך לולאת LOOP העובדים נקראים אחד אחד.

עדכון תפקיד: לפי מספר השנים שכל עובד עבד:

אם שנים ≤ 5 → תפקידו מעודכן ל-Junior

אם שנים בין 6 ל-15 → תפקידו מעודכן ל-Mid-level

אם שנים > 15 → תפקידו מעודכן ל-Senior

טיפול בחריגות: אם קיים שגיאה בעת העדכון של עובד מסוים, הפונקציה תדפיס הודעת NOTICE עם מזהה העובד ופרטי השגיאה, ותמשיך לעבד את העובדים הבאים.

סגירת הקורסור הפנימי: בסיום הלולאה הקורסור הפנימי נסגר.

קורסור REFCURSOR: הפונקציה פותחת קורסור חדש עם שם המועבר כפרמטר ref ומחזירה אליו את רשימת העובדים שתחילת עבודתם קטנה או שווה ל-min_years יחד עם התפקידים המעודכנים.

הפונקציה מחזירה את שם הקורסור ref אליו אפשר לגשת ולהוציא את רשימת העובדים המעודכנים באמצעות פקודת FETCH.

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
$$ LANGUAGE plpgsql;
  ```
![func1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/func%201.png?raw=true)  

**תמונה שממחישה את השינוי:**
![func1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/func1_result.jpg?raw=true)  
