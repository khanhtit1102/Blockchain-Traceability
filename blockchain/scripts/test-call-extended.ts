import { ethers } from "hardhat";

async function main() {
  const [owner] = await ethers.getSigners();

  const contractAddress = "0xe1ed23275AA952F8aaf01a03a90bF31db42AD2f5";
  const AgriTrace = await ethers.getContractFactory("AgriTrace");
  const contract = await AgriTrace.attach(contractAddress);

  console.log("📦 Đăng ký sản phẩm SP003...");
  await contract.registerProduct("SP003", "Xoài Cát Chu");

  console.log("🌱 Thêm công đoạn: Planting");
  await contract.addStage("SP003", 0, "Trồng tại Đồng Tháp ngày 2025-05-01");

  console.log("🌾 Thêm công đoạn: Harvesting");
  await contract.addStage("SP003", 1, "Thu hoạch ngày 2025-05-20");

  console.log("📦 Thêm công đoạn: Packaging");
  await contract.addStage("SP003", 2, "Đóng gói tại kho miền Tây ngày 2025-05-21");

  console.log("🚚 Thêm công đoạn: Shipping");
  await contract.addStage("SP003", 3, "Vận chuyển đến HCM ngày 2025-05-22");

  console.log("🏪 Thêm công đoạn: Distributing");
  await contract.addStage("SP003", 4, "Bày bán tại Vinmart ngày 2025-05-23");

  console.log("📜 Truy vấn lịch sử sản phẩm SP003...");
  const history = await contract.getProductHistory("SP003");
  if (!history || history.length === 0) {
    console.log("⚠️ No history found for product SP003.");
    return;
  }
  console.log("🧾 Lịch sử sản phẩm:");
  history.forEach((stage: any, index: number) => {
    console.log(`🔹 Giai đoạn ${index + 1}:`);
    console.log("   Loại:", stage.stageType);
    console.log("   Nội dung:", stage.data);
    console.log("   Thời gian:", new Date(stage.timestamp * 1000).toLocaleString());
    console.log("   Block number:", Number(stage.blockNumber));
    console.log("   Previous block hash:", stage.previousBlockHash);

  });
}

main().catch((error) => {
  console.error("❌ Error:", error);
  process.exitCode = 1;
});
