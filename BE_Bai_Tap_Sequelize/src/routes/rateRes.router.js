import express from "express";
import rateResController from "../controller/rateRes.controller.js";

const rateResRouter = express.Router();

rateResRouter.post("/", rateResController.createRate);
rateResRouter.get(
  "/restaurant/:id",
  rateResController.getListRateByRestaurantId
);
rateResRouter.get("/user/:id", rateResController.getListRateByUserId);

export default rateResRouter;
