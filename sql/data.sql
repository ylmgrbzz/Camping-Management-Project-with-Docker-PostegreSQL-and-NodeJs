INSERT INTO STAFF (
        staff_id,
        staff_name,
        staff_surname,
        staff_email,
        staff_phone,
        staff_password
    )
VALUES (
        1,
        'John',
        'Doe',
        'johndoe@example.com',
        '555-555-5555',
        'password123'
    ),
    (
        2,
        'Jane',
        'Smith',
        'janesmith@example.com',
        '555-555-5556',
        'password456'
    ),
    (
        3,
        'Bob',
        'Johnson',
        'bobjohnson@example.com',
        '555-555-5557',
        'password789'
    ),
    (
        4,
        'Samantha',
        'Williams',
        'samanthawilliams@example.com',
        '555-555-5558',
        'password101'
    ),
    (
        5,
        'Michael',
        'Brown',
        'michaelbrown@example.com',
        '555-555-5559',
        'password112'
    ),
    (
        6,
        'Emily',
        'Jones',
        'emilyjones@example.com',
        '555-555-5560',
        'password133'
    ),
    (
        7,
        'Matthew',
        'Miller',
        'matthewmiller@example.com',
        '555-555-5561',
        'password144'
    ),
    (
        8,
        'Nicholas',
        'Davis',
        'nicholasdavis@example.com',
        '555-555-5562',
        'password155'
    ),
    (
        9,
        'Amanda',
        'Garcia',
        'amandagarcia@example.com',
        '555-555-5563',
        'password166'
    ),
    (
        10,
        'Daniel',
        'Rodriguez',
        'danielrodriguez@example.com',
        '555-555-5564',
        'password177'
    );
INSERT INTO CUSTOMER (
        customer_id,
        customer_name,
        customer_surname,
        customer_email,
        customer_phone,
        customer_address,
        customer_people_count
    )
VALUES (
        1,
        'John',
        'Doe',
        'johndoe@example.com',
        '555-555-5555',
        '123 Main St',
        2
    ),
    (
        2,
        'Jane',
        'Smith',
        'janesmith@example.com',
        '555-555-5556',
        '456 Park Ave',
        3
    ),
    (
        3,
        'Bob',
        'Johnson',
        'bobjohnson@example.com',
        '555-555-5557',
        '789 Elm St',
        4
    ),
    (
        4,
        'Samantha',
        'Williams',
        'samanthawilliams@example.com',
        '555-555-5558',
        '101 Oak St',
        1
    ),
    (
        5,
        'Michael',
        'Brown',
        'michaelbrown@example.com',
        '555-555-5559',
        '112 Pine St',
        2
    ),
    (
        6,
        'Emily',
        'Jones',
        'emilyjones@example.com',
        '555-555-5560',
        '133 Maple St',
        3
    ),
    (
        7,
        'Matthew',
        'Miller',
        'matthewmiller@example.com',
        '555-555-5561',
        '144 Cedar St',
        4
    ),
    (
        8,
        'Nicholas',
        'Davis',
        'nicholasdavis@example.com',
        '555-555-5562',
        '155 Birch St',
        1
    ),
    (
        9,
        'Amanda',
        'Garcia',
        'amandagarcia@example.com',
        '555-555-5563',
        '166 Willow St',
        2
    ),
    (
        10,
        'Daniel',
        'Rodriguez',
        'danielrodriguez@example.com',
        '555-555-5564',
        '177 Oak St',
        3
    );
INSERT INTO PRICE (price_id, price_name, price_value)
VALUES (1, 'Daily Parking', 10),
    (2, 'Weekly Parking', 50),
    (3, 'Monthly Parking', 200),
    (4, 'Yearly Parking', 2000),
    (5, 'RV Daily Parking', 15),
    (6, 'RV Weekly Parking', 75),
    (7, 'RV Monthly Parking', 300),
    (8, 'RV Yearly Parking', 3000),
    (9, 'Tent Daily Camping', 5),
    (10, 'Tent Weekly Camping', 25);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (1, 'Car', 'ABC123', 1);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (2, 'Truck', 'DEF456', 2);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (3, 'Motorcycle', 'GHI789', 3);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (4, 'Bicycle', 'JKL012', 4);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (5, 'Bus', 'MNO345', 5);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (6, 'SUV', 'PQR678', 6);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (7, 'Van', 'STU901', 7);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (8, 'RV', 'VWX234', 8);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (9, 'Boat', 'YZABC', 9);
INSERT INTO VEHICLE (
        vehicle_id,
        vehicle_type,
        vehicle_plate,
        customer_id
    )
VALUES (10, 'Aeroplane', 'FGHIJK', 10);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (1, 100, 0, 'Parking Area 1', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (2, 75, 0, 'Parking Area 2', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (3, 150, 0, 'Parking Area 3', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (4, 50, 0, 'Parking Area 4', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (5, 120, 0, 'Parking Area 5', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (6, 200, 0, 'Parking Area 6', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (7, 75, 0, 'Parking Area 7', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (8, 100, 0, 'Parking Area 8', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (9, 150, 0, 'Parking Area 9', 1);
INSERT INTO PARKINGAREA (
        parking_id,
        parking_capasity,
        parking_crowd,
        parking_name,
        parking_status
    )
VALUES (10, 75, 0, 'Parking Area 10', 1);
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (1, 1, 1, '2022-01-01', '2022-01-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (2, 2, 2, '2022-02-01', '2022-02-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (3, 3, 3, '2022-03-01', '2022-03-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (4, 4, 4, '2022-04-01', '2022-04-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (5, 5, 5, '2022-05-01', '2022-05-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (6, 6, 6, '2022-06-01', '2022-06-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (7, 7, 7, '2022-07-01', '2022-07-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (8, 8, 8, '2022-08-01', '2022-08-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (9, 9, 9, '2022-09-01', '2022-09-05');
INSERT INTO VEHICLEPARK (
        park_id,
        vehicle_id,
        parking_id,
        park_start_date,
        park_end_date
    )
VALUES (10, 10, 10, '2022-10-01', '2022-10-05');
INSERT INTO CAMPLOCATION (
        camp_id,
        camp_name,
        camp_capasity,
        camp_crowd,
        camp_status
    )
VALUES (1, 'Camp A', 100, 20, 1),
    (2, 'Camp B', 200, 30, 1),
    (3, 'Camp C', 150, 40, 1),
    (4, 'Camp D', 250, 50, 1),
    (5, 'Camp E', 300, 60, 1),
    (6, 'Camp F', 400, 70, 1),
    (7, 'Camp G', 500, 80, 1),
    (8, 'Camp H', 600, 90, 1),
    (9, 'Camp I', 700, 100, 1),
    (10, 'Camp J', 800, 110, 1);
NSERT INTO RESERVATION (
    reservation_id,
    customer_id,
    parking_id,
    camp_id,
    reservation_date,
    reservation_time,
    reservation_status,
    reservation_start,
    reservation_end,
    reservation_paid,
    reservation_price
)
VALUES (
        1,
        1,
        1,
        1,
        '2022-01-01',
        '10:00:00',
        1,
        '2022-01-01',
        '2022-01-02',
        0,
        100
    ),
    (
        2,
        2,
        2,
        2,
        '2022-02-01',
        '11:00:00',
        1,
        '2022-02-01',
        '2022-02-02',
        0,
        200
    ),
    (
        3,
        3,
        3,
        3,
        '2022-03-01',
        '12:00:00',
        1,
        '2022-03-01',
        '2022-03-02',
        0,
        300
    ),
    (
        4,
        4,
        4,
        4,
        '2022-04-01',
        '13:00:00',
        1,
        '2022-04-01',
        '2022-04-02',
        0,
        400
    ),
    (
        5,
        5,
        5,
        5,
        '2022-05-01',
        '14:00:00',
        1,
        '2022-05-01',
        '2022-05-02',
        0,
        500
    ),
    (
        6,
        6,
        6,
        6,
        '2022-06-01',
        '15:00:00',
        1,
        '2022-06-01',
        '2022-06-02',
        0,
        600
    ),
    (
        7,
        7,
        7,
        7,
        '2022-07-01',
        '16:00:00',
        1,
        '2022-07-01',
        '2022-07-02',
        0,
        700
    ),
    (
        8,
        8,
        8,
        8,
        '2022-08-01',
        '17:00:00',
        1,
        '2022-08-01',
        '2022-08-02',
        0,
        800
    ),
    (
        9,
        9,
        9,
        9,
        '2022-09-01',
        '18:00:00',
        1,
        '2022-09-01',
        '2022-09-02',
        0,
        900
    ),
    (
        10,
        10,
        10,
        10,
        '2022-10-01',
        '19:00:00',
        1,
        '2022-10-01',
        '2022-10-02',
        0,
        1000
    );