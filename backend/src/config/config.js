const dotenv = require("dotenv");
const path = require("path");
const Joi = require("joi");

dotenv.config({ path: path.join(__dirname, "../../.env") });

const envVarsSchema = Joi.object()
  .keys({
    NODE_ENV: Joi.string()
      .valid("production", "development", "test")
      .required(),
    PORT: Joi.number().default(3000),
    POSTGRE_SQL_HOST: Joi.string().required().description("PostgreSQL DB url"),
    POSTGRE_SQL_PORT: Joi.number().default(5432),
    POSTGRE_SQL_USER: Joi.string().required().description("PostgreSQL DB user"),
    POSTGRE_SQL_PASSWORD: Joi.string()
      .required()
      .description("PostgreSQL DB password"),
    POSTGRE_SQL_DB: Joi.string().required().description("PostgreSQL DB name"),

    JWT_SECRET: Joi.string().required().description("JWT secret key"),
  })
  .unknown();

const { value: envVars, error } = envVarsSchema
  .prefs({ errors: { label: "key" } })
  .validate(process.env);

if (error) {
  throw new Error(`Config validation error: ${error.message}`);
}

module.exports = {
  env: envVars.NODE_ENV,
  port: envVars.PORT,
  jwt: {
    secret: envVars.JWT_SECRET,
    accessExpirationMinutes: envVars.JWT_ACCESS_EXPIRATION_MINUTES,
  },
  postgres: {
    host: envVars.POSTGRE_SQL_HOST,
    port: envVars.POSTGRE_SQL_PORT,
    user: envVars.POSTGRE_SQL_USER,
    password: envVars.POSTGRE_SQL_PASSWORD,
    db: envVars.POSTGRE_SQL_DB,
  },
};
