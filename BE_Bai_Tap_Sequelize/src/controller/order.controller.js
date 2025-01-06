import { responseSuccess } from "../common/helpers/response.helper.js";
import orderService from "../services/order.service.js";

const orderController = {
  createOrder: async (req, res, next) => {
    try {
      const like = await orderService.createOrder(req);
      const resData = responseSuccess(like, "Create order successfully");
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
};

export default orderController;
