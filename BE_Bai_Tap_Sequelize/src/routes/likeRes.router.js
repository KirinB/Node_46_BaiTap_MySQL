import express from "express";
import likeResController from "../controller/likeRes.controller.js";

const likeResRouter = express.Router();

//Like nhà hàng
likeResRouter.post("/like", likeResController.likeRes);

//Unlike nhà hàng
likeResRouter.post("/unlike", likeResController.unLikeRes);

//Lấy danh sách like theo nhà hàng
likeResRouter.get("/restaurant/:id", likeResController.getLikesByRestaurantId);

//Lấy danh sách like theo user
likeResRouter.get("/user/:id", likeResController.getLikesByUserId);

export default likeResRouter;
