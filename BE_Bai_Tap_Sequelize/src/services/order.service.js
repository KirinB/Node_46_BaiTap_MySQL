import { BadRequestException } from "../common/helpers/error.helper.js";
import models from "../common/sequelize/init.sequelize.js";

const orderService = {
  createOrder: async (req) => {
    const {
      userId: user_id,
      foodId: food_id,
      starAmount: amount,
      code,
      arrSubId: arr_sub_id,
    } = req.body;

    // Kiểm tra nếu thiếu thông tin trong body
    if (!user_id || !food_id) {
      throw new BadRequestException(
        "Thiếu thông tin userId hoặc foodId trong body."
      );
    }

    // Kiểm tra sự tồn tại của user
    const userExists = await models.user.findOne({ where: { user_id } });
    if (!userExists) {
      throw new BadRequestException(`Không tìm thấy user với ID: ${user_id}`);
    }

    //Kiểm tra sự tồn tại của food
    const foodExists = await models.food.findOne({ where: { food_id } });
    if (!foodExists) {
      throw new BadRequestException(`Không tìm thấy món ăn với ID: ${food_id}`);
    }

    //Thêm order
    const order = await models.order.create({
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    });

    return order;
  },
};

export default orderService;
