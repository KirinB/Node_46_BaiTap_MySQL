import { BadRequestException } from "../common/helpers/error.helper.js";
import models from "../common/sequelize/init.sequelize.js";

const likeResService = {
  likeRes: async (req) => {
    const { userId: user_id, resId: res_id } = req.body;

    // Kiểm tra nếu thiếu thông tin trong body
    if (!user_id || !res_id) {
      throw new BadRequestException(
        "Thiếu thông tin userId hoặc resId trong body."
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

    // Kiểm tra xem user đã like nhà hàng này chưa
    const existingLike = await models.like_res.findOne({
      where: { user_id, res_id },
    });

    if (existingLike) {
      throw new BadRequestException("Người dùng đã like nhà hàng rồi");
    }

    // Nếu chưa like thì thêm mới
    await models.like_res.create({ user_id, res_id });
    return { message: "Like nhà hàng thành công" };
  },

  unlikeRes: async (req) => {
    const { userId: user_id, resId: res_id } = req.body;

    // Kiểm tra nếu thiếu thông tin trong body
    if (!user_id || !res_id) {
      throw new BadRequestException(
        "Thiếu thông tin userId hoặc resId trong body."
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

    // Kiểm tra xem user đã like nhà hàng này chưa
    const existingLike = await models.like_res.findOne({
      where: { user_id, res_id },
    });
    if (!existingLike) {
      throw new BadRequestException("Người dùng chưa like nhà hàng");
    }

    // Nếu chưa like thì thêm mới
    await models.like_res.destroy({ where: { user_id, res_id } });
    return { message: "Unlike nhà hàng thành công!" };
  },
  getLikesByRestaurantId: async (req) => {
    const { id: res_id } = req.params;

    //Kiểm tra sự tồn tại của nhà hàng
    const resExists = await models.restaurant.findOne({ where: { res_id } });
    if (!resExists) {
      throw new BadRequestException(
        `Không tìm thấy nhà hàng với ID: ${res_id}`
      );
    }

    //Tìm danh sách Like theo nhà hàng
    const likes = await models.like_res.findAll({ where: { res_id } });

    return likes;
  },
  getLikesByUserId: async (req) => {
    const { id: user_id } = req.params;

    //Kiểm tra sự tồn tại của user
    const userExists = await models.user.findOne({ where: { user_id } });
    if (!userExists) {
      throw new BadRequestException(`Không tìm thấy user Id: ${user_id}`);
    }

    //Tìm danh sách like theo user
    const likes = await models.like_res.findAll({ where: { user_id } });

    return likes;
  },
};

export default likeResService;
