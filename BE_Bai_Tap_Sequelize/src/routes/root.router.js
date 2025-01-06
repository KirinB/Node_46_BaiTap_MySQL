import express from "express";
import likeResRouter from "./likeRes.router.js";
import rateResRouter from "./rateRes.router.js";
import orderRouter from "./order.router.js";

const rootRouter = express.Router();

rootRouter.get("/", (req, res, next) => {
  res.json("ok");
});

rootRouter.use("/like-res", likeResRouter);
rootRouter.use("/rate", rateResRouter);
rootRouter.use("/order", orderRouter);

export default rootRouter;
