const express = require("express");
const validate = require("../../middlewares/validate");
const reservationValidation = require("../../validations/reservation.validation");
const reservationController = require("../../controllers/reservation.controller");

const router = express.Router();

router
  .route("/")
  .get(reservationController.getReservations)
  .post(reservationController.createReservation);

router.route("/camp-locations").get(reservationController.getCampLocations);
router.route("/stats").get(reservationController.getStats);
router.route("/customers").get(reservationController.getCustomers);
router.route("/customers").post(reservationController.createCustomer);
router
  .route("/:reservationId")
  .get(reservationController.getReservation)
  .patch(reservationController.updateReservation)
  .delete(reservationController.deleteReservation);

module.exports = router;
