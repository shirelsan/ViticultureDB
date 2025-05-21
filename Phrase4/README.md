# Phase 4: Programming:

## Introduction:

## 1. Functions:


• **פונקציה ראשונה-update_worker_roles_and_return_refcursor**

**הסבר על הפונקציה:**

הפונקציה מקבלת פרמטר מספרי min_years שמייצג את מספר השנים למעבר מאז תחילת העבודה של העובדים.

קורסור פנימי: הפונקציה מגדירה ופותחת קורסור שמביא את כל העובדים (worker) שתחילת עבודתם (Year_of_starting_work) קטנה או שווה ל-min_years h.

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
**תמונה שממחישה את השינוי:**
![func1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/func1_result.jpg?raw=true)  


• **פונקציה שנייה-maintenance_summary_update**

**הסבר על הפונקציה:**

• הגדרת קורסור פנימי (cur_tasks): שליפת כל רשומות התחזוקה (task_id, task_type, m_date, worker_id) מהטבלה maintenace שבהן התאריך (m_date) קטן או שווה ל־cutoff_date.

• באמצעות לולאת LOOP, הפונקציה עוברת על כל רשומה בקורסור (cur_tasks) ומבצעת פעולה לפי סוג המשימה.

• התאמת תפקיד לעובד (התניית If)
אם task_type = 'pruning' -> תפקיד העובד מתעדכן ל־Pruner.

אם task_type = 'harvesting' -> תפקידו הופך ל־Harvester.

אחרת -> General Worker.

• טיפול בשגיאות - כל עדכון עטוף ב־BEGIN...EXCEPTION כדי שלא תיפסק הפונקציה בגלל שגיאה אחת. היא תמשיך ותדווח עם RAISE NOTICE.

• שלב הסיום – פתיחת קורסור חיצוני (ref) - הפונקציה פותחת קורסור בשם ref ומחזירה דרכו את רשימת כל המשימות שבוצעו עד cutoff_date.

  ```sql
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
$$ LANGUAGE plpgsql;
  ```

**תמונות שממחישה את השינוי:**
![func2](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/func2_1.jpg?raw=true)  

![func2](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/func2_2.jpg?raw=true)  

## 2. Procedures:

## 3. Triggers:

## 4. Main Programs:



## **Backup**  
