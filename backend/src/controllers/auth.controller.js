const catchAsync = require("../utils/catchAsync");
const { authService, tokenService } = require("../services");

const login = catchAsync(async (req, res) => {
  const { email, password } = req.body;
  const user = await authService.loginUserWithEmailAndPassword(email, password);
  const tokens = await tokenService.generateAuthTokens(user);
  res.send({
    message: "Login successful",
    user,
    tokens,
  });
});

const register = catchAsync(async (req, res) => {
  const user = await authService.registerUser(req.body);
  const tokens = await tokenService.generateAuthTokens(user);
  res.send({
    message: "Registration successful",
    user,
    tokens,
  });
});

module.exports = {
  login,
  register,
};
