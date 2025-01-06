import { BadRequestException } from "../common/helpers/error.helper.js";
import models from "../common/sequelize/init.sequelize.js";

const rateResService = {
  createRate: async (req) => {
    const { starAmount: amount, resId: res_id, userId: user_id } = req.body;

    // Kiểm tra nếu thiếu thông tin trong body
    if (!user_id || !res_id || !amount) {
      throw new BadRequestException(
        "Thiếu thông tin userId hoặc resId hoặc starAmount trong body."
      );
    }

    // Kiểm tra sự tồn tại của user
    const userExists = await models.user.findOne({ where: { user_id } });
    if (!userExists) {
      throw new BadRequestException(`Không tìm thấy user với ID: ${user_id}`);
    }

    //Kiểm tra sự tồn tại của nhà hàng
    const resExists = await models.restaurant.findOne({ where: { res_id } });
    if (!resExists) {
      throw new BadRequestException(
        `Không tìm thấy nhà hàng với ID: ${res_id}`
      );
    }

    //Tìm xem người dùng đã đánh giá nhà hàng chưa
    const rateExists = await models.rate_res.findOne({
      where: { user_id, res_id },
    });

    if (rateExists) {
      throw new BadRequestException("Người dùng đã đánh giá nhà hàng này rồi");
    }

    await models.rate_res.create({ user_id, res_id, amount });

    return { message: "Thêm đánh giá thành công" };
  },
  getListRateByRestaurantId: async (req) => {
    const { id: res_id } = req.params;

    //Kiểm tra sự tồn tại của nhà hàng
    const resExists = await models.restaurant.findOne({ where: { res_id } });
    if (!resExists) {
      throw new BadRequestException(
        `Không tìm thấy nhà hàng với ID: ${res_id}`
      );
    }

    //Tìm danh sách đánh giá theo nhà hàng
    const rates = await models.rate_res.findAll({ where: { res_id } });

    return rates;
  },
  getListRateByUserId: async (req) => {
    const { id: user_id } = req.params;

    //Kiểm tra sự tồn tại của user
    const userExists = await models.user.findOne({ where: { user_id } });
    if (!userExists) {
      throw new BadRequestException(`Không tìm thấy user Id: ${user_id}`);
    }

    //Tìm danh sách đánh giá theo user
    const rates = await models.rate_res.findAll({ where: { user_id } });

    return rates;
  },
};

export default rateResService;
