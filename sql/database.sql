CREATE TABLE STAFF(
    staff_id int not null,
    staff_name varchar(50) not null,
    staff_surname varchar(20) not null,
    staff_email varchar(100) not null,
    staff_phone varchar(20) not null,
    staff_password varchar(128) not null,
    CONSTRAINT pk_staff PRIMARY KEY(staff_id)
);
CREATE TABLE CUSTOMER(
    customer_id int not null,
    customer_name varchar(20) not null,
    customer_surname varchar(20) not null,
    customer_email varchar(100) not null,
    customer_phone varchar(20) not null,
    customer_address varchar(200) not null,
    customer_people_count int not null,
    CONSTRAINT pk_customer PRIMARY KEY(customer_id)
);
CREATE TABLE PRICE(
    price_id int not null,
    price_name varchar(100) not null,
    price_value int not null,
    CONSTRAINT pk_price PRIMARY KEY(price_id)
);
CREATE TABLE VEHICLE(
    vehicle_id int not null,
    vehicle_type varchar(30) not null,
    vehicle_plate varchar(20) not null,
    customer_id int not null,
    CONSTRAINT pk_vehicle PRIMARY KEY(vehicle_id),
    CONSTRAINT fk_customer_vehicle FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id) ON DELETE CASCADE
);
CREATE TABLE PARKINGAREA(
    parking_id int not null,
    parking_capasity int not null,
    parking_crowd int not null,
    parking_name varchar(100) not null,
    -- parking_status 1: available, 2: full, 3: reserved
    parking_status int not null,
    CONSTRAINT pk_parkingarea PRIMARY KEY(parking_id)
);
CREATE TABLE VEHICLEPARK(
    park_id int not null,
    vehicle_id int not null,
    parking_id int not null,
    park_start_date date not null,
    park_end_date date not null,
    CONSTRAINT pk_vehiclepark PRIMARY KEY(park_id),
    CONSTRAINT fk_vehicle_vehiclepark FOREIGN KEY(vehicle_id) REFERENCES VEHICLE(vehicle_id),
    CONSTRAINT fk_parkingarea_vehiclepark FOREIGN KEY(parking_id) REFERENCES PARKINGAREA(parking_id)
);
CREATE TABLE CAMPLOCATION (
    camp_id int not null,
    camp_name varchar(100) not null,
    camp_capasity int not null,
    camp_crowd int not null,
    camp_status int not null,
    CONSTRAINT camp_crowd_check CHECK (camp_crowd <= camp_capasity),
    CONSTRAINT pk_camplocation PRIMARY KEY(camp_id)
);
CREATE TABLE RESERVATION (
    -- primary key
    reservation_id int not null,
    customer_id int not null,
    parking_id int not null,
    camp_id int not null,
    reservation_date date not null,
    reservation_time time not null,
    -- reservation_status 1: reserved, 2: cancelled, 3: finished
    reservation_status int not null,
    reservation_start date not null,
    reservation_end date not null,
    reservation_paid int not null,
    reservation_price int not null,
    CONSTRAINT pk_reservation PRIMARY KEY(reservation_id),
    CONSTRAINT fk_customer_reservation FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id),
    CONSTRAINT fk_parkingarea_reservation FOREIGN KEY(parking_id) REFERENCES PARKINGAREA(parking_id),
    CONSTRAINT fk_camp_reservation FOREIGN KEY(camp_id) REFERENCES CAMPLOCATION(camp_id)
);