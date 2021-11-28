const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("BlockdemyLoot", function () {
  it("should assign correct owner on minting", async function () {
    const BlockdemyLoot = await ethers.getContractFactory("BlockdemyLoot");
    const blockdemyLoot = await BlockdemyLoot.deploy(10000);
    const [owner] = await ethers.getSigners();
    await blockdemyLoot.deployed();
    const tokenId = 0;

    const mintTx = await blockdemyLoot.mint(owner.address, tokenId);

    // wait until the transaction is mined
    await mintTx.wait();

    expect(await blockdemyLoot.ownerOf(tokenId)).to.equal(owner.address);
  });
});
