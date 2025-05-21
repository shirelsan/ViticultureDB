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

SELECT * FROM materials_;
