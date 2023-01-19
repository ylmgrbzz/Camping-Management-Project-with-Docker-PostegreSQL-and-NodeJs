const httpStatus = require("http-status");
const ApiError = require("../utils/ApiError");
const { staffQuery } = require("../queries");

const createStaff = async (staffBody) => {
  const staff = await staffQuery.createStaff(staffBody);
  return staff;
};

const getStaffs = async () => {
  const staffs = await staffQuery.getStaffs();
  return staffs;
};

const getStaffById = async (staffId) => {
  const staff = await staffQuery.getStaffById(staffId);
  return staff;
};

const updateStaffById = async (staffId, staffBody) => {
  const staff = await staffQuery.updateStaffById(staffId, staffBody);
  return staff;
};

const deleteStaffById = async (staffId) => {
  const staff = await staffQuery.deleteStaffById(staffId);
  return staff;
};

module.exports = {
  createStaff,
  getStaffs,
  getStaffById,
  updateStaffById,
  deleteStaffById,
};
