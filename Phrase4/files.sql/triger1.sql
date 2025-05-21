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


--דוגמא של הכנסת ערכים בשביל להראות את הטריגר
INSERT INTO ProductionEquipment_ (EquipmentID_, Type, Status)
VALUES (100, 'Home', 'Available');

INSERT INTO Process_Equipment (EquipmentID_, ProcessID_) VALUES (100, 101);
INSERT INTO Process_Equipment (EquipmentID_, ProcessID_) VALUES (100, 100);
INSERT INTO Process_Equipment (EquipmentID_, ProcessID_) VALUES (100, 397);
INSERT INTO Process_Equipment (EquipmentID_, ProcessID_) VALUES (100, 398);

SELECT * FROM Process_Equipment WHERE EquipmentID_ = 102;
SELECT * FROM Process_Equipment WHERE EquipmentID_ = 101;

SELECT * FROM  public.ProductionEquipment_;
