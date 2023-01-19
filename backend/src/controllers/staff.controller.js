const httpStatus = require("http-status");
const ApiError = require("../utils/ApiError");
const catchAsync = require("../utils/catchAsync");
const { staffService } = require("../services");

const createStaff = catchAsync(async (req, res) => {
  const staff = await staffService.createStaff(req.body);
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Staff created successfully",
    staff,
  });
});

const getStaffs = catchAsync(async (req, res) => {
  const staffs = await staffService.getStaffs();
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Staffs retrieved successfully",
    staffs,
  });
});

const getStaff = catchAsync(async (req, res) => {
  const staff = await staffService.getStaffById(req.params.staffId);
  if (!staff) {
    throw new ApiError(httpStatus.NOT_FOUND, "Staff not found");
  }
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Staff retrieved successfully",
    staff,
  });
});

const updateStaff = catchAsync(async (req, res) => {
  const staff = await staffService.updateStaffById(
    req.params.staffId,
    req.body
  );
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Staff updated successfully",
    staff,
  });
});

const getMeStaff = catchAsync(async (req, res) => {
  const staff = await staffService.getStaffById(req.user.id);
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Staff retrieved successfully",
    staff,
  });
});

const updateMeStaff = catchAsync(async (req, res) => {
  const staff = await staffService.updateStaffById(req.user.id, req.body);
  res.status(httpStatus.OK).send({
    code: httpStatus.OK,
    message: "Staff updated successfully",
    staff,
  });
});

const deleteStaff = catchAsync(async (req, res) => {
  await staffService.deleteStaffById(req.params.staffId);
  res.status(httpStatus.OK).send();
});

module.exports = {
  createStaff,
  getStaffs,
  getStaff,
  updateStaff,
  deleteStaff,
  getMeStaff,
  updateMeStaff,
};
