const db = require("../db");
const ApiError = require("../utils/ApiError");

const getStaff = async () => {
  try {
    const { rows } = await db.query("SELECT * FROM staff");
    return rows;
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getStaffById = async (staffId) => {
  try {
    const { rows } = await db.query("SELECT * FROM staff WHERE id = $1", [
      staffId,
    ]);
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};
// staff_name, staff_surname, staff_email, staff_phone, staff_password
const createStaff = async (staffBody) => {
  try {
    const { rows } = await db.query(
      "INSERT INTO staff (staff_name, staff_surname, staff_email, staff_phone, staff_password) VALUES ($1, $2, $3, $4, $5) RETURNING *",
      [
        staffBody.staff_name,
        staffBody.staff_surname,
        staffBody.staff_email,
        staffBody.staff_phone,
        staffBody.staff_password,
      ]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

module.exports = {
  getStaff,
  getStaffById,
  createStaff,
};
