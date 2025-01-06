import experss from "express";
import foodController from "../controller/food.controller.js";

const foodTypeRouter = experss.Router();

foodTypeRouter.get("/food-type-list", foodController.foodList);

export default foodTypeRouter;
