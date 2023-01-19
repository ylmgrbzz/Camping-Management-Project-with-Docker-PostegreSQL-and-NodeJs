-- Bu fonksiyon, verilen tarih aralığı içerisinde yapılan rezervasyonların toplam gelirini hesaplamak için kullanılır. Fonksiyon, start_date ve end_date girdileri olarak iki tarih alır. Veritabanındaki "RESERVATION" tablosunda bu tarih aralığına göre arama yapar ve rezervasyonların fiyatlarını toplar.Sonuç olarak total_income değişkeni ile döndürür.
CREATE FUNCTION get_reservation_income(start_date date, end_date date) RETURNS int AS $$
DECLARE total_income int;
record record;
BEGIN total_income = 0;
FOR record IN (
    SELECT reservation_price
    FROM RESERVATION
    WHERE reservation_start >= start_date
        AND reservation_end <= end_date
) LOOP total_income = total_income + record.reservation_price;
END LOOP;
RETURN total_income;
END;
$$ LANGUAGE plpgsql;
--Bu fonksiyon, PARKINGAREA ve CAMPLOCATION tablosunda park_crowd ve camp_crowd sütunlarını azaltır ve RESERVATION tablosunda reservation_status sütununu 3'e ayarlar. Bu değişiklikler, rezervasyonun son tarihi (reservation_end) şu anki tarihten daha eski ve rezervasyonun durumu (reservation_status) 3 değilse yapılır. Bu fonksiyon, rezervasyonların sona ermesi veya iptal edilmesi durumunda otomatik olarak güncelleme yapar.
CREATE OR REPLACE FUNCTION update_reservation_status() RETURNS VOID AS $$ BEGIN
UPDATE PARKINGAREA
SET parking_crowd = parking_crowd - 1
WHERE parking_id = (
        SELECT parking_id
        FROM RESERVATION
        WHERE reservation_end <= NOW()
            AND reservation_status != 3
    );
UPDATE CAMPLOCATION
SET camp_crowd = camp_crowd - 1
WHERE camp_id = (
        SELECT camp_id
        FROM RESERVATION
        WHERE reservation_end <= NOW()
            AND reservation_status != 3
    );
UPDATE RESERVATION
SET reservation_status = 3
WHERE reservation_end <= NOW()
    AND reservation_status != 3;
END;
$$ LANGUAGE plpgsql;
-- kamp alanlarına göre müşteriler
CREATE OR REPLACE FUNCTION get_customers_by_camp(camp_id INTEGER) RETURNS TABLE (
        customer_id INTEGER,
        customer_name VARCHAR(20),
        customer_surname VARCHAR(20),
        customer_email VARCHAR(100),
        customer_phone VARCHAR(20),
        customer_address VARCHAR(200),
        customer_people_count INTEGER
    ) AS $$ BEGIN RETURN QUERY
SELECT c.customer_id,
    c.customer_name,
    c.customer_surname,
    c.customer_email,
    c.customer_phone,
    c.customer_address,
    c.customer_people_count
FROM CUSTOMER c
    JOIN RESERVATION r ON c.customer_id = r.customer_id
WHERE r.camp_id = camp_id;
END;
$$ LANGUAGE plpgsql;
-- rezervasyon tarihine göre müşteriler
CREATE OR REPLACE FUNCTION get_customers_by_month(month INTEGER) RETURNS TABLE (
        customer_id INTEGER,
        customer_name VARCHAR(20),
        customer_surname VARCHAR(20),
        customer_email VARCHAR(100),
        customer_phone VARCHAR(20),
        customer_address VARCHAR(200),
        customer_people_count INTEGER
    ) AS $$ BEGIN RETURN QUERY
SELECT c.customer_id,
    c.customer_name,
    c.customer_surname,
    c.customer_email,
    c.customer_phone,
    c.customer_address,
    c.customer_people_count
FROM CUSTOMER c
    JOIN RESERVATION r ON c.customer_id = r.customer_id
WHERE EXTRACT(
        MONTH
        FROM r.reservation_start
    ) = month;
END;
$$ LANGUAGE plpgsql;