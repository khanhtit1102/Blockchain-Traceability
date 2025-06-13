async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with account:", deployer.address);

  const Greeter = await ethers.getContractFactory("Greeter");
  const greeter = await Greeter.deploy("Hello from Hardhat!");

  await greeter.deployed();  // ✅ Hardhat v2.18+ dùng hàm này thay cho .deployed()

  console.log("Greeter deployed to:", await greeter.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
