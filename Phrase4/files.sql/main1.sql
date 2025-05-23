DO $$
DECLARE
   ref refcursor;
   rec RECORD;
BEGIN
   -- קריאה לפונקציה שמעדכנת תפקידי עובדים לפי שנות ותק
   ref := 'worker_cursor';
   PERFORM update_worker_roles_and_return_refcursor(2010, ref);

   RAISE NOTICE '--- תוצאות עדכון תפקידי עובדים ---';
   LOOP
       FETCH ref INTO rec;
       EXIT WHEN NOT FOUND;
       RAISE NOTICE 'עובד: %, תחילת עבודה: %, תפקיד: %', rec.w_name, rec.Year_of_starting_work, rec.role;
   END LOOP;
   CLOSE ref;

   -- קריאה לפרוצדורה שמעדכנת זמינות חומרים לפי שימוש
   CALL update_material_availability();

   RAISE NOTICE '*** פרוצדורה לעדכון חומרים הסתיימה בהצלחה ***';

END;
$$;