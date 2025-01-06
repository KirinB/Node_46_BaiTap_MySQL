import express from "express";
import foodController from "../controller/food.controller.js";

const foodRouter = express.Router();

foodRouter.get("/food-list", foodController.foodList);

export default foodRouter;
