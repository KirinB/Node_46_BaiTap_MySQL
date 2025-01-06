import { responseSuccess } from "../common/helpers/response.helper.js";
import rateResService from "../services/rateRes.service.js";

const rateResController = {
  createRate: async (req, res, next) => {
    try {
      const rate = await rateResService.createRate(req);
      const resData = responseSuccess(rate, "Rate successfully");
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
  getListRateByRestaurantId: async (req, res, next) => {
    try {
      const rate = await rateResService.getListRateByRestaurantId(req);
      const resData = responseSuccess(
        rate,
        "Get list rate by restaurant successfully"
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
  getListRateByUserId: async (req, res, next) => {
    try {
      const rate = await rateResService.getListRateByUserId(req);
      const resData = responseSuccess(
        rate,
        "Get list rate by user successfully"
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
};

export default rateResController;
