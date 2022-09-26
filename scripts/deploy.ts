import { ethers } from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    console.log("Account balance:", (await deployer.getBalance()).toString());

    const ContractFactory = await ethers.getContractFactory("BuyOpensea");
    const starknetCore : string = "0xde29d060D45901Fb19ED6C6e959EB22d8626708e";
    const seaportAddress: string = "0x00000000006c3852cbEf3e08E8dF289169EdE581";
    const l2Address: string = "0x05c54c6092faad5bf9edd3ff5bc8bc32d04ebf14018e4d7d4443aa4867937d37";
    const factory = await ContractFactory.deploy(starknetCore, seaportAddress, l2Address);

    console.log("Token address:", factory.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });