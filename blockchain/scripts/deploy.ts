import { ethers } from "hardhat";

async function main() {
  const AgriTrace = await ethers.getContractFactory("AgriTrace");
  const contract = await AgriTrace.deploy();
  await contract.deployed();
  console.log(`✅ Contract deployed at: ${contract.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});