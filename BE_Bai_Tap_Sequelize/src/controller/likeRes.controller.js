import { responseSuccess } from "../common/helpers/response.helper.js";
import likeResService from "../services/likeRes.service.js";

const likeResController = {
  likeRes: async (req, res, next) => {
    try {
      const like = await likeResService.likeRes(req);
      const resData = responseSuccess(like, "Like successfully");
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
  unLikeRes: async (req, res, next) => {
    try {
      const unlike = await likeResService.unlikeRes(req);
      const resData = responseSuccess(unlike, "Unlike successfully");
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
  getLikesByRestaurantId: async (req, res, next) => {
    try {
      const like = await likeResService.getLikesByRestaurantId(req);
      const resData = responseSuccess(
        like,
        "Get like by restaurant successfully"
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
  getLikesByUserId: async (req, res, next) => {
    try {
      const like = await likeResService.getLikesByUserId(req);
      const resData = responseSuccess(like, "Get like by user successfully");
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
};

export default likeResController;
