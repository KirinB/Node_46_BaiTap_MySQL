import { responseError } from "./response.helper.js";

export const handleError = (error, req, res, next) => {
  const resError = responseError(error.message, error.code, error.stack);
  res.status(resError.code).json(resError);
  next();
};

export class BadRequestException extends Error {
  constructor(message = "Bad Request Exception") {
    super(message);
    this.code = 400;
  }
}

export class ForbiddenException extends Error {
  constructor(message = "Forbidden Exception") {
    super(message);
    this.code = 403;
  }
}
