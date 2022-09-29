require("dotenv").config();

module.exports = [
  process.env.STARKNET_CORE_ADDRESS,
  process.env.SEAPORT_CONTRACT_ADDRESS,
  process.env.L2_CONTRACT_ADDRESS,
  process.env.REALMS_L1_CONTRACT_ADDRESS,
];
