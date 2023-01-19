const app = require("./app");
const config = require("./config/config");
const logger = require("./config/logger");
const db = require("./db");

let server;

const startServer = async () => {
  const client = await db.getClient();
  if (client) {
    logger.info("Connected to Postgres");
  }
  server = app.listen(config.port, () => {
    logger.info(`Server listening on port: ${config.port}`);
  });
};

startServer();

const unexpectedErrorHandler = (error) => {
  logger.error(error);
  exitHandler();
};

process.on("uncaughtException", unexpectedErrorHandler);
process.on("unhandledRejection", unexpectedErrorHandler);

process.on("SIGTERM", () => {
  logger.info("SIGTERM received");
  if (server) {
    server.close();
  }
});
