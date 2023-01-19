const httpStatus = require("http-status");
const staffService = require("./staff.service");
const ApiError = require("../utils/ApiError");

const checkPassword = async (password, hashedPassword) => {
  const isMatch = await staffService.isPasswordMatch(password, hashedPassword);
  if (!isMatch) {
    throw new ApiError(httpStatus.UNAUTHORIZED, "Incorrect password");
  }
};

const loginUserWithEmailAndPassword = async (email, password) => {
  const staff = await staffService.getStaffByEmail(email);
  if (!staff) {
    throw new ApiError(httpStatus.NOT_FOUND, "Staff not found");
  }
  await checkPassword(password, staff.password);
  return staff;
};

module.exports = {
  loginUserWithEmailAndPassword,
};
