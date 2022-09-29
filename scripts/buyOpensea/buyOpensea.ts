import { ethers } from "hardhat";
import * as dotenv from 'dotenv';
import {getListingData} from './request'
import {constructAmountAndBasicOrderParameters} from './constructArgs'

dotenv.config()

async function main() {
    const [deployer] = await ethers.getSigners();
    const contractFactory = await ethers.getContractFactory("Empires");
    if (!process.env.L1_CONTRACT_ADDRESS){
        throw new Error("No L1 contract specified in .env file")
    }
    const contract = contractFactory.attach(process.env.L1_CONTRACT_ADDRESS);

    if (!process.env.REALMS_L1_CONTRACT_ADDRESS || !process.env.TOKEN_ID) {
        throw new Error("Realms contract or tokenid not specified in .env file")
    }

    // get data from opensea api
    const {data, error} = await getListingData(process.env.REALMS_L1_CONTRACT_ADDRESS, process.env.TOKEN_ID);
    if (error) {
        console.log(data, error)
        throw new Error(error)
    }

    // construct params from data
    const {payableAmount, basicOrderParams} = constructAmountAndBasicOrderParameters(data);

    // calls the Empire L1 contract to buy on opensea
    const res = await contract.buy(process.env.TOKEN_ID, payableAmount, basicOrderParams);

    console.log(res)

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });