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


 --התאריך שאנחנו בחרנו:
CALL update_inventory_from_harvests('2025-05-01');

SELECT * FROM worker;

SELECT * FROM inventory;
