-- To create a new function update_camp_crowd that updates the crowd count when a customer check in to the camp, you can use the following function:
-- To create a trigger that calls this function after an insert on the RESERVATION table, you can use the following:
CREATE FUNCTION update_camp_crowd() RETURNS TRIGGER AS $$ BEGIN
UPDATE CAMPLOCATION
SET camp_crowd = camp_crowd + 1
WHERE camp_id = NEW.camp_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER update_camp_crowd_trig
AFTER
INSERT ON RESERVATION FOR EACH ROW EXECUTE FUNCTION update_camp_crowd();
-- Bu fonksiyon ve trigger, yeni bir rezervasyon kaydı eklendiğinde otomatik olarak o park alanının "parking_crowd" değerini 1 arttırır.
CREATE FUNCTION update_parkingarea_crowd() RETURNS TRIGGER AS $$ BEGIN
UPDATE PARKINGAREA
SET parking_crowd = parking_crowd + 1
WHERE parking_id = NEW.parking_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER update_parkingarea_crowd_trig
AFTER
INSERT ON RESERVATION FOR EACH ROW EXECUTE FUNCTION update_parkingarea_crowd();
-- Bu fonksiyon ve trigger, yeni bir rezervasyon kaydı iptal edilebileceğini kontrol eder.
CREATE OR REPLACE FUNCTION prevent_last_3_days_cancel() RETURNS TRIGGER AS $$ BEGIN IF (
        NEW.reservation_start <= NOW() + INTERVAL '3 days'
    ) THEN RAISE EXCEPTION 'Reservation can not be cancelled within last 3 days.';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER prevent_last_3_days_cancel_trig BEFORE
UPDATE ON RESERVATION FOR EACH ROW EXECUTE FUNCTION prevent_last_3_days_cancel();