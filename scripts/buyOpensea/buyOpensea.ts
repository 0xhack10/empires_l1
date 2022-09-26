import { ethers } from "hardhat";
import * as dotenv from 'dotenv';
dotenv.config()


async function main() {
    const ContractFactory = await ethers.getContractFactory("BuyOpensea");
    const contract = ContractFactory.attach(process.env.L1_CONTRACT_ADDRESS);
    const res = await contract.buy();

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });