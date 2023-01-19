const db = require("../db");
const ApiError = require("../utils/ApiError");

const getReservations = async () => {
  try {
    const { rows } = await db.query("SELECT * FROM reservation");
    return rows;
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getReservationById = async (reservationId) => {
  try {
    const { rows } = await db.query("SELECT * FROM reservation WHERE id = $1", [
      reservationId,
    ]);
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const createReservation = async (reservationBody) => {
  try {
    const { rows } = await db.query(
      // customer_id, parking_id, camp_id, reservation_date, reservation_time, reservation_status, reservation_start, reservation_end, reservation_paid, reservation_price
      "INSERT INTO reservation (customer_id, parking_id, camp_id, reservation_date, reservation_time, reservation_status, reservation_start, reservation_end, reservation_paid, reservation_price) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *",
      [
        reservationBody.customer_id,
        reservationBody.parking_id,
        reservationBody.camp_id,
        reservationBody.reservation_date,
        reservationBody.reservation_time,
        reservationBody.reservation_status,
        reservationBody.reservation_start,
        reservationBody.reservation_end,
        reservationBody.reservation_paid,
        reservationBody.reservation_price,
      ]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const updateReservationById = async (reservationId, reservationBody) => {
  try {
    const { rows } = await db.query(
      "UPDATE reservation SET customer_id = $1, parking_id = $2, camp_id = $3, reservation_date = $4, reservation_time = $5, reservation_status = $6, reservation_start = $7, reservation_end = $8, reservation_paid = $9, reservation_price = $10 WHERE id = $11 RETURNING *",
      [
        reservationBody.customer_id,
        reservationBody.parking_id,
        reservationBody.camp_id,
        reservationBody.reservation_date,
        reservationBody.reservation_time,
        reservationBody.reservation_status,
        reservationBody.reservation_start,
        reservationBody.reservation_end,
        reservationBody.reservation_paid,
        reservationBody.reservation_price,
        reservationId,
      ]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const deleteReservationById = async (reservationId) => {
  try {
    const { rows } = await db.query(
      "DELETE FROM reservation WHERE id = $1 RETURNING *",
      [reservationId]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getCampLocations = async () => {
  try {
    const { rows } = await db.query("SELECT * FROM camplocation");
    return rows;
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getStats = async () => {
  try {
    const { rows } = await db.query("SELECT * FROM reservation");
    return rows;
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

/*
CREATE FUNCTION calculate_camp_price(
    camp_type varchar(50),
    camp_start_date date,
    camp_end_date date
) RETURNS int AS $$ BEGIN RETURN (
    DATE_PART('day', camp_end_date - camp_start_date) * (
        SELECT price_value
        FROM PRICE
        WHERE price_name = camp_type
    )
);
END;
$$ LANGUAGE plpgsql;
*/

const calculateCampPrice = async (campType, campStartDate, campEndDate) => {
  try {
    const { rows } = await db.query("SELECT calculate_camp_price($1, $2, $3)", [
      campType,
      campStartDate,
      campEndDate,
    ]);
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

/*
CREATE FUNCTION calculate_park_price(
    car_type varchar(50),
    park_start_date date,
    park_end_date date
) RETURNS int AS $$ BEGIN RETURN (
    DATE_PART('day', park_end_date - park_start_date) * (
        SELECT price_value
        FROM PRICE
        WHERE price_name = car_type
    )
);
END;
$$ LANGUAGE plpgsql;
*/

const calculateParkPrice = async (carType, parkStartDate, parkEndDate) => {
  try {
    const { rows } = await db.query("SELECT calculate_park_price($1, $2, $3)", [
      carType,
      parkStartDate,
      parkEndDate,
    ]);
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getCampById = async (campId) => {
  try {
    const { rows } = await db.query(
      "SELECT * FROM camplocation WHERE id = $1",
      [campId]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};
module.exports = {
  getReservations,
  getReservationById,
  createReservation,
  updateReservationById,
  deleteReservationById,
  getStats,
  getCampLocations,
  calculateCampPrice,
  calculateParkPrice,
};
