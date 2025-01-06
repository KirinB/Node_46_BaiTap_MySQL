import { Sequelize } from "sequelize";
import initModels from "../../models/init-models.js";

export const sequelize = new Sequelize(
  "mysql://root:1234@127.0.0.1:3307/db_baitap_app_food",
  { logging: false }
);

try {
  await sequelize.authenticate();
  console.log("Connection has been established successfully.");
} catch (error) {
  console.error("Unable to connect to the database:", error);
}

const models = initModels(sequelize);

export default models;
