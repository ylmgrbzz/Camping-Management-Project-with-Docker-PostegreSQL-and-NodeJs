--Select the average price value grouped by price name:
SELECT AVG(price_value),
   price_name
FROM PRICE
GROUP BY price_name
HAVING AVG(price_value) > x;
--Select the customer names and addresses who have more than one vehicle:
SELECT customer_name,
   customer_address
FROM CUSTOMER
   INNER JOIN VEHICLE ON CUSTOMER.customer_id = VEHICLE.customer_id
GROUP BY customer_name,
   customer_address
HAVING COUNT(VEHICLE.vehicle_id) > 1;
--Select the parking areas that are at least 80% full:
SELECT parking_name
FROM PARKINGAREA
GROUP BY parking_name
HAVING (parking_crowd / parking_capasity) * 100 >= 80;
--Select the camp locations that are at least 90% full:
SELECT camp_name
FROM CAMPLOCATION
GROUP BY camp_name
HAVING (camp_crowd / camp_capasity) * 100 >= 90;
--Select the staff names who have made more than 10 reservations:
SELECT staff_name
FROM STAFF
   INNER JOIN RESERVATION ON STAFF.staff_id = RESERVATION.staff_id
GROUP BY staff_name
HAVING COUNT(RESERVATION.reservation_id) > 10;
--

SELECT customer_name
FROM CUSTOMER
UNION
SELECT customer_name
FROM VEHICLE;
--

SELECT customer_id
FROM CUSTOMER
INTERSECT
SELECT customer_id
FROM VEHICLE;
--

UNION
:
SELECT customer_name,
   customer_surname
FROM CUSTOMER
UNION
SELECT staff_name,
   staff_surname
FROM STAFF
 --

SELECT customer_name,
   customer_surname
FROM CUSTOMER
EXCEPT
SELECT staff_name,
   staff_surname
FROM STAFF 
--Tüm müşterilerin adlarını ve soyadlarını getiren sorguda yer almayan müşterileri listele:
SELECT customer_name,
   customer_surname
FROM CUSTOMER
EXCEPT
SELECT customer_name,
   customer_surname
FROM CUSTOMER
WHERE customer_name = 'John'
 --Tüm arabaların plakalarını getiren sorguda yer almayan arabaları listele:
SELECT vehicle_plate
FROM VEHICLE
EXCEPT
SELECT vehicle_plate
FROM VEHICLE
WHERE vehicle_type = 'SUV' 
--Tüm rezervasyonların ID'lerini getiren sorguda yer almayan rezervasyonları listele:
SELECT reservation_id
FROM RESERVATION
EXCEPT
SELECT reservation_id
FROM RESERVATION
WHERE reservation_status = 2 --

SELECT *
FROM CUSTOMER
   LEFT JOIN VEHICLE ON CUSTOMER.customer_id = VEHICLE.customer_id 
--Müşterilerin adlarını, soyadlarını ve email adreslerini göster:
SELECT customer_name,
   customer_surname,
   customer_email
FROM CUSTOMER;
--Park alanlarının adlarını, kapasitelerini ve durumlarını göster:
SELECT parking_name,
   parking_capasity,
   parking_status
FROM PARKINGAREA;
--Park alanına park etmiş arabaların plakalarını ve sahiplerinin adlarını göster:
SELECT VEHICLE.vehicle_plate,
   CUSTOMER.customer_name
FROM VEHICLE
   JOIN VEHICLEPARK ON VEHICLE.vehicle_id = VEHICLEPARK.vehicle_id
   JOIN CUSTOMER ON VEHICLE.customer_id = CUSTOMER.customer_id;
--Müşterilerin arabalarının park alanlarına ne zaman park ettiklerini göster:
SELECT CUSTOMER.customer_name,
   VEHICLE.vehicle_plate,
   VEHICLEPARK.park_start_date
FROM CUSTOMER
   JOIN VEHICLE ON CUSTOMER.customer_id = VEHICLE.customer_id
   JOIN VEHICLEPARK ON VEHICLE.vehicle_id = VEHICLEPARK.vehicle_id;
--Rezervasyonların durumlarını, tarihlerini ve ödenen tutarlarını göster:
SELECT reservation_status,
   reservation_start,
   reservation_end,
   reservation_paid
FROM RESERVATION;
--Kamp alanlarının adlarını, kapasitelerini ve mevcut kapasitelerini göster:
SELECT camp_name,
   camp_capasity,
   camp_crowd
FROM CAMPLOCATION;
--Rezerve edilmiş olan kamp alanlarının adlarını ve müşterilerin adlarını göster:
SELECT CAMPLOCATION.camp_name,
   CUSTOMER.customer_name
FROM CAMPLOCATION
   JOIN RESERVATION ON CAMPLOCATION.camp_id = RESERVATION.camp_id
   JOIN CUSTOMER ON RESERVATION.customer_id = CUSTOMER.customer_id;
--kamp alanlarının adlarını, kapasitelerini, mevcut kapasitelerini ve rezervasyonların durumlarını göster:
SELECT CAMPLOCATION.camp_name,
   CAMPLOCATION.camp_capasity,
   CAMPLOCATION.camp_crowd,
   RESERVATION.reservation_status
FROM CAMPLOCATION
   LEFT JOIN RESERVATION ON CAMPLOCATION.camp_id = RESERVATION.camp_id;
--Bu sorgu, müşteri adı "John" olan müşterilerin adını, soyadını, telefon numarasını, rezervasyon yaptığı otoparkın ismini, rezervasyonun başlangıç ve bitiş tarihlerini listeler. Sorgu, müşteri adına göre sıralanmıştır
SELECT customer_name,
   customer_surname,
   customer_phone,
   parking_name,
   reservation_start,
   reservation_end
FROM CUSTOMER
   LEFT JOIN RESERVATION ON CUSTOMER.customer_id = RESERVATION.customer_id
   LEFT JOIN PARKINGAREA ON RESERVATION.parking_id = PARKINGAREA.parking_id
WHERE customer_name = 'John'
ORDER BY reservation_start ASC;
-- Customers and their associated vehicles:
CREATE VIEW customer_vehicle_view AS
SELECT customer.customer_id,
   customer_name,
   customer_surname,
   customer_email,
   customer_phone,
   customer_address,
   customer_people_count,
   vehicle_id,
   vehicle_type,
   vehicle_plate
FROM customer
   JOIN vehicle ON customer.customer_id = vehicle.customer_id;