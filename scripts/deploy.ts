import { ethers } from "hardhat";
import * as dotenv from 'dotenv';

dotenv.config()

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    console.log("Account balance:", (await deployer.getBalance()).toString());

    const ContractFactory = await ethers.getContractFactory("Empires");
    const starknetCore : string = process.env.STARKNET_CORE_ADDRESS!;
    const seaportAddress: string = process.env.SEAPORT_CONTRACT_ADDRESS!;
    const l2Address: string = process.env.L2_CONTRACT_ADDRESS!;
    const realmsAddress: string = process.env.REALMS_L1_CONTRACT_ADDRESS!;
    const factory = await ContractFactory.deploy(starknetCore, seaportAddress, l2Address, realmsAddress);

    console.log("Token address:", factory.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });