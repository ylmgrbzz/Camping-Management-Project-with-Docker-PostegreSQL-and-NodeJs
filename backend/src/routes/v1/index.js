const express = require("express");
const authRoute = require("./auth.route");
const staffRoute = require("./staff.route");
const docsRoute = require("./docs.route");

const reservationRoute = require("./reservation.route");
const config = require("../../config/config");

const router = express.Router();

const defaultRoutes = [
  {
    path: "/auth",
    route: authRoute,
  },
  {
    path: "/staff",
    route: staffRoute,
  },
  {
    path: "/reservations",
    route: reservationRoute,
  },
];

const devRoutes = [
  // routes available only in development mode
  {
    path: "/docs",
    route: docsRoute,
  },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

/* istanbul ignore next */
if (config.env === "development") {
  devRoutes.forEach((route) => {
    router.use(route.path, route.route);
  });
}

module.exports = router;
