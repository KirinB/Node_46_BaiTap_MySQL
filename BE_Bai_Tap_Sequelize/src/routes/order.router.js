import express from "express";
import orderController from "../controller/order.controller.js";

const orderRouter = express.Router();

orderRouter.post("/", orderController.createOrder);

export default orderRouter;
