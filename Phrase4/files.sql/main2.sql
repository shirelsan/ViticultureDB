DO $$
DECLARE
   ref refcursor;
   rec RECORD;
BEGIN
   -- קריאה לפונקציה שמעדכנת תפקידים לפי משימות תחזוקה
   ref := 'task_cursor';
   PERFORM maintenance_summary_update(DATE '2025-4-30', ref);

   RAISE NOTICE '--- תוצאות עדכון תפקידי עובדים ממשימות תחזוקה ---';
   LOOP
       FETCH ref INTO rec;
       EXIT WHEN NOT FOUND;
       RAISE NOTICE 'משימה: %, סוג: %, תאריך: %, עובד: %', rec.task_id, rec.task_type, rec.m_date, rec.worker_id;
   END LOOP;
   CLOSE ref;
   -- קריאה לפרוצדורה שמעדכנת את המלאי לפי הקצירים
   CALL update_inventory_from_harvests(DATE '2024-12-31');

   RAISE NOTICE '*** פרוצדורה לעדכון מלאי מקציר הסתיימה בהצלחה ***';
END;
$$;