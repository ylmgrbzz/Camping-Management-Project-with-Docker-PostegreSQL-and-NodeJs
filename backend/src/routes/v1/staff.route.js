const express = require("express");
const validate = require("../../middlewares/validate");
const staffValidation = require("../../validations/staff.validation");
const staffController = require("../../controllers/staff.controller");

const router = express.Router();

router.route("/").get(staffController.getStaffs);

router
  .route("/me")
  .get(staffController.getMeStaff)
  .patch(staffController.updateMeStaff);

router
  .route("/:staffId")
  .get(staffController.getStaff)
  .patch(staffController.updateStaff)
  .delete(staffController.deleteStaff);

module.exports = router;
