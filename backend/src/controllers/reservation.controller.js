const httpStatus = require("http-status");
const pick = require("../utils/pick");
const ApiError = require("../utils/ApiError");
const catchAsync = require("../utils/catchAsync");
const { reservationService } = require("../services");

const createReservation = catchAsync(async (req, res) => {
  const reservation = await reservationService.createReservation(req.body);
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Reservation created successfully",
    reservation,
  });
});

const getCampLocations = catchAsync(async (req, res) => {
  const campLocations = await reservationService.getCampLocations();
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Camp locations retrieved successfully",
    campLocations,
  });
});

const getReservations = catchAsync(async (req, res) => {
  const reservations = await reservationService.getReservations();
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Reservations retrieved successfully",
    reservations,
  });
});

const getReservation = catchAsync(async (req, res) => {
  const reservation = await reservationService.getReservationById(
    req.params.reservationId
  );
  if (!reservation) {
    throw new ApiError(httpStatus.NOT_FOUND, "Reservation not found");
  }
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Reservation retrieved successfully",
    reservation,
  });
});

const updateReservation = catchAsync(async (req, res) => {
  const reservation = await reservationService.updateReservationById(
    req.params.reservationId,
    req.body
  );
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Reservation updated successfully",
    reservation,
  });
});

const deleteReservation = catchAsync(async (req, res) => {
  await reservationService.deleteReservationById(req.params.reservationId);
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Reservation deleted successfully",
  });
});

const getStats = catchAsync(async (req, res) => {
  const statistics = await reservationService.getStats();
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Statistics retrieved successfully",
    statistics,
  });
});

const getCustomers = catchAsync(async (req, res) => {
  const customers = await reservationService.getCustomers();
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Customers retrieved successfully",
    customers,
  });
});

const createCustomer = catchAsync(async (req, res) => {
  const customer = await reservationService.createCustomer(req.body);
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Customer created successfully",
    customer,
  });
});

module.exports = {
  createReservation,
  getReservations,
  getReservation,
  updateReservation,
  deleteReservation,
  getStats,
  getCampLocations,
  getCustomers,
  createCustomer,
};
