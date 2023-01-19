const httpStatus = require("http-status");
const ApiError = require("../utils/ApiError");
const { staffQuery, reservationQuery, customerQuery } = require("../queries");

const createReservation = async (reservationBody) => {
  const reservation = await reservationQuery.createReservation(reservationBody);
  return reservation;
};

const getReservations = async () => {
  const reservations = await reservationQuery.getReservations();
  return reservations;
};

const getCampLocations = async () => {
  const campLocations = await reservationQuery.getCampLocations();
  return campLocations;
};

const getReservationById = async (reservationId) => {
  const reservation = await reservationQuery.getReservationById(reservationId);
  return reservation;
};

const updateReservationById = async (reservationId, reservationBody) => {
  const reservation = await reservationQuery.updateReservationById(
    reservationId,
    reservationBody
  );
  return reservation;
};

const deleteReservationById = async (reservationId) => {
  const reservation = await reservationQuery.deleteReservationById(
    reservationId
  );
  return reservation;
};

const getStats = async () => {
  const statistics = await reservationQuery.getStats();
  return statistics;
};

const getCustomers = async () => {
  const customers = await customerQuery.getCustomers();
  return customers;
};

const calculateCampPrice = async (campId, reservationStart, reservationEnd) => {
  const camp = await reservationQuery.getCampById(campId);
  const campPrice = camp.price;
  const reservationStartTimestamp = new Date(reservationStart).getTime();
  const reservationEndTimestamp = new Date(reservationEnd).getTime();
  // calculate the days between the start and end date
  const days = (reservationEndTimestamp - reservationStartTimestamp) / 86400000;
  const totalPrice = campPrice * days;
  return totalPrice;
};

const createCustomer = async (customerBody) => {
  const customer = await customerQuery.createCustomer(customerBody);
  return customer;
};

module.exports = {
  createReservation,
  getReservations,
  getReservationById,
  updateReservationById,
  deleteReservationById,
  getStats,
  getCampLocations,
  getCustomers,
  createCustomer,
};
