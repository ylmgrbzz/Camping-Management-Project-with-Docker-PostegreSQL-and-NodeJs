const db = require("../db");
const ApiError = require("../utils/ApiError");

// customer_id, customer_name, customer_surname, customer_email, customer_phone, customer_address, customer_people_count
const createCustomer = async (customerBody) => {
  try {
    const { rows } = await db.query(
      "INSERT INTO customer (customer_name, customer_surname, customer_email, customer_phone, customer_address, customer_people_count) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *",
      [
        customerBody.customer_name,
        customerBody.customer_surname,
        customerBody.customer_email,
        customerBody.customer_phone,
        customerBody.customer_address,
        customerBody.customer_people_count,
      ]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getCustomerById = async (customerId) => {
  try {
    const { rows } = await db.query("SELECT * FROM customer WHERE id = $1", [
      customerId,
    ]);
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const updateCustomerById = async (customerId, customerBody) => {
  try {
    const { rows } = await db.query(
      "UPDATE customer SET customer_name = $1, customer_surname = $2, customer_email = $3, customer_phone = $4, customer_address = $5, customer_people_count = $6 WHERE id = $7 RETURNING *",
      [
        customerBody.customer_name,
        customerBody.customer_surname,
        customerBody.customer_email,
        customerBody.customer_phone,
        customerBody.customer_address,
        customerBody.customer_people_count,
        customerId,
      ]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const deleteCustomerById = async (customerId) => {
  try {
    const { rows } = await db.query(
      "DELETE FROM customer WHERE id = $1 RETURNING *",
      [customerId]
    );
    return rows[0];
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

const getCustomers = async () => {
  try {
    const { rows } = await db.query("SELECT * FROM customer");
    return rows;
  } catch (error) {
    throw new ApiError(error.message, 500);
  }
};

module.exports = {
  createCustomer,
  getCustomerById,
  updateCustomerById,
  deleteCustomerById,
  getCustomers,
};
