import { ethers } from "hardhat";

async function main() {
  const [owner] = await ethers.getSigners();

  const contractAddress = "0xa1C8B1E9AC34FEd41f2267867f2020D25de55E8e";
  const AgriTrace = await ethers.getContractFactory("AgriTrace");
  const contract = await AgriTrace.attach(contractAddress);

  console.log("📦 Registering product SP001...");
  await contract.registerProduct("SP001", "Gạo ST25");

  console.log("🚜 Adding planting stage...");
  await contract.addStage("SP001", 0, "Trồng tại Trà Vinh ngày 2025-05-10");

  console.log("📜 Fetching product history...");
  const history = await contract.getProductHistory("SP001");

  console.log("🧾 Product History:");
  history.forEach((stage: any, index: number) => {
    console.log(`Stage ${index + 1}:`);
    console.log("  Type:", stage.stageType);
    console.log("  Data:", stage.data);
    console.log("  Time:", new Date(stage.timestamp * 1000).toLocaleString());
  });
}

main().catch((error) => {
  console.error("❌ Error:", error);
  process.exitCode = 1;
});
