# Phase 4: Programming:

## Introduction:

## 1. Functions:


### **פונקציה ראשונה-update_worker_roles_and_return_refcursor**

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


### **פונקציה שנייה-maintenance_summary_update**

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


### **פרוצדורה ראשונה- update_material_availability**

הפרוצדורה update_material_availability מעדכנת את כמויות המלאי של חומרים בטבלת Materials_ לפי השימוש בפועל שנעשה בהם בתהליכי ייצור, בהתאם לנתונים שבטבלת Process_Materials.

**הסבר על הפרוצדורה:**

• **חישוב שימושים בפועל** – הפרוצדורה סורקת את טבלת Process_Materials ומבצעת סיכום (SUM) של כל כמויות השימוש (UsageAmount) שבוצעו בפועל, מקובצות לפי מזהה החומר (MaterialID_).

• **לולאת LOOP לעדכון כמויות** – עבור כל חומר שנמצא, מתבצעת לולאה אשר דרכה מתבצע עדכון בטבלת Materials_, כך שהשדה QuantityAvailable_ מופחת בהתאם לסך כל הכמות שנעשה בה שימוש בפועל.

• **התראה במקרה של חומר חסר** – אם לא נמצא חומר תואם לעדכון בטבלת Materials_, מוצגת הודעת אזהרה באמצעות RAISE NOTICE.

• **טיפול בשגיאות** – כל פעולה עטופה בבלוק BEGIN...EXCEPTION, כך שאם מתרחשת שגיאה (למשל מזהה חומר לא קיים), היא תיתפס ותדווח מבלי להפסיק את הריצה של הפרוצדורה.

• **התנהגות במצב שליליות** – הפרוצדורה **אינה בולמת ירידת כמויות מתחת לאפס**, ולכן ייתכן שייווצרו ערכים שליליים בשדה QuantityAvailable_. דבר זה משקף מצב שבו נעשה שימוש בחומר מעבר למה שהיה זמין בפועל – מידע שיכול להעיד על צורך תפעולי חריג.

 ```sql
CREATE OR REPLACE PROCEDURE update_material_availability()
LANGUAGE plpgsql
AS
$$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT pm.MaterialID_, SUM(pm.UsageAmount) AS total_used
        FROM Process_Materials pm
        GROUP BY pm.MaterialID_
    LOOP
        BEGIN
            UPDATE Materials_
            SET QuantityAvailable_ = QuantityAvailable_ - rec.total_used
            WHERE MaterialID_ = rec.MaterialID_;

            IF NOT FOUND THEN
                RAISE NOTICE 'No matching material found for MaterialID %', rec.MaterialID_;
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE NOTICE 'Error updating material %: %', rec.MaterialID_, SQLERRM;
        END;
    END LOOP;
END;
$$;

  ```

---






**תמונה שממחישה את השינוי לפני ואחרי**

![func2](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/proc1.jpg?raw=true)  

### **פרוצדורה שנייה-update_inventory_from_harvests**

**הסבר על הפרוצדורה:**


הפרוצדורה update_inventory_from_harvests מעדכנת את כמות המלאי לפי נתוני קציר שנערך עד תאריך מסוים, ומגדירה את תפקיד העובד שביצע את הקציר כ־Harvester.

• קבלת פרמטר (cutoff_date DATE) – תאריך סף, לפיו ייבחרו רק קצירים שבוצעו בתאריך זה או לפניו.

• לולאה על קצירים רלוונטיים – הפונקציה מבצעת לולאת FOR rec IN ... LOOP על רשומות מטבלת harvest שעומדות בשני תנאים:

harvest_date קטן או שווה ל־cutoff_date.

קיימת להן התאמה בטבלת perform (המשייכת את הקציר לעובד).

• עדכון טבלת המלאי (inventory) – עבור כל קציר שנמצא, מתווספת כמות הקציר (quantity) לשדה inventory_quantity בטבלת inventory, לפי inventory_id המתאים.

• עדכון טבלת העובדים (worker) – תפקידו של העובד שביצע את הקציר (worker_id) מתעדכן ל־'Harvester'.

• טיפול בשגיאות – כל אחד מהעדכונים עטוף ב־BEGIN...EXCEPTION, כך שאם מתרחשת שגיאה (למשל inventory_id או worker_id לא קיימים), הפונקציה תדווח עליה באמצעות RAISE NOTICE אך תמשיך לפעול על שאר הרשומות.
  ```
CREATE OR REPLACE PROCEDURE update_inventory_from_harvests(cutoff_date DATE)
LANGUAGE plpgsql
AS
$$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT h.harvest_id, h.quantity, h.inventory_id, p.worker_id
        FROM harvest h
        JOIN perform p ON h.harvest_id = p.harvest_id
        WHERE h.harvest_date <= cutoff_date
    LOOP
        BEGIN
            -- עדכון הכמות במלאי לפי כמות הקציר
            UPDATE inventory
            SET inventory_quantity = inventory_quantity + rec.quantity
            WHERE inventory_id = rec.inventory_id;

            -- עדכון תפקיד העובד
            UPDATE worker
            SET role = 'Harvester'
            WHERE worker_id = rec.worker_id;

        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'שגיאה בעדכון לקציר % או עובד %: %', rec.harvest_id, rec.worker_id, SQLERRM;
        END;
    END LOOP;
END;
$$;
  ```
התאריך שבחרנו בהרצת הפרוצדורה:
 ```
cutoff_date='2025-05-01
(CALL update_inventory_from_harvests('2025-05-01');
)
 ```



**תמונה שממחישה את השינוי לפני**

![func2](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/proc2.jpg?raw=true)  


## 3. Triggers:

### **טריגר מס' 1- update_equipment_status**

**הסבר על הטריגר:**

הטריגר update_equipment_status אחראי לעדכן את מצב הציוד (status_) בהתאם למידת השימוש בו בתהליכי ייצור.

* מתי הטריגר מופעל:
הטריגר מוגדר לפעול אחרי כל הכנסת שורה חדשה (AFTER INSERT) לטבלה Process_Equipment, שהיא טבלה המקשרת בין תהליך ייצור לציוד שנעשה בו שימוש.

* שליפת מספר הפעמים בהן נעשה שימוש בציוד:
הפונקציה סופרת כמה פעמים מופיע אותו מזהה ציוד (EquipmentID_) בטבלת Process_Equipment. המספר הזה נשמר במשתנה usage_count.

* תנאי הסתעפות (IF):
אם מספר השימושים בציוד שווה או גדול מ־3, הפונקציה מעדכנת את שדה status_ בטבלת ProductionEquipment_ ל־Overloaded (ציוד עמוס).
אחרת, סטטוס הציוד מתעדכן ל־InUse (בשימוש).

* עדכון טבלת הציוד (ProductionEquipment_):
העדכון מתבצע לפי מזהה הציוד שהוזן בטבלה Process_Equipment, בעזרת שאילתת UPDATE.

* טיפול בשגיאות (Exception):
אם מתרחשת שגיאה כלשהי במהלך ביצוע העדכונים (למשל אם מזהה הציוד לא קיים בטבלה), הפונקציה תדווח על כך באמצעות RAISE NOTICE, ותמשיך לפעול. הדבר מונע קריסת התהליך כולו.

 ```
CREATE OR REPLACE FUNCTION update_equipment_status()
RETURNS TRIGGER AS $$
DECLARE
    usage_count INT;
BEGIN
    SELECT COUNT(*) INTO usage_count
    FROM Process_Equipment
    WHERE EquipmentID_ = NEW.EquipmentID_;

    IF usage_count >= 3 THEN
        UPDATE ProductionEquipment_
        SET status_ = 'Overloaded'
        WHERE EquipmentID_ = NEW.EquipmentID_;
    ELSE
        UPDATE ProductionEquipment_
        SET status_ = 'InUse'
        WHERE EquipmentID_ = NEW.EquipmentID_;
    END IF;

    RETURN NEW;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'שגיאה בעדכון סטטוס לציוד %: %', NEW.EquipmentID_, SQLERRM;
        RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_update_equipment_status ON Process_Equipment;

CREATE TRIGGER trg_update_equipment_status
AFTER INSERT ON Process_Equipment
FOR EACH ROW
EXECUTE FUNCTION update_equipment_status();
 ```
**תמונות של הטבלאות השייכות לטריגר לאחר הפעלתו:**

![func2](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/triger1.1.jpg?raw=true)  

![func2](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase4/triger1.jpg?raw=true)  






• **טריגר מס' 2-**

**הסבר על הטריגר:**

## 4. Main Programs:

• **תוכנית ראשית מס' 1 -**

**הסבר על התוכנית:**

• **תוכנית ראשית מס' 2 -**

**הסבר על התוכנית:**

## **Backup**  
