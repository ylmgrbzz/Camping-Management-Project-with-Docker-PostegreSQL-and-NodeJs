-- This function updates the reservation status, parking area crowd, and camp location crowd for all reservations that have ended and whose status is not set to 3 (finished). The function uses a cursor to loop through all such reservations and updates the appropriate fields by using the reservation record and its id to update the related records.
CREATE OR REPLACE FUNCTION update_reservation_status() RETURNS VOID AS $$
DECLARE reservation_id INT;
reservation RECORD;
BEGIN FOR reservation_id IN (
    SELECT id
    FROM reservation
    WHERE reservation_end <= NOW()
        AND reservation_status != 3
) LOOP
SELECT * INTO reservation
FROM reservation
WHERE id = reservation_id;
UPDATE parkingarea
SET parking_crowd = parking_crowd - 1
WHERE parking_id = reservation.parking_id;
UPDATE camplocation
SET camp_crowd = camp_crowd - 1
WHERE camp_id = reservation.camp_id;
UPDATE reservation
SET reservation_status = 3
WHERE id = reservation_id;
END LOOP;
END;
$$ LANGUAGE plpgsql;