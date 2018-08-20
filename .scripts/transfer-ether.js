Web3 = require("web3")

web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

toAddress = process.argv[2];
fromAddress = process.argv[3];
valueToTransfer = web3.utils.toWei(process.argv[4] || "5", "ether");

if(!fromAddress) {
  	fromAddress = web3.eth.coinbase;
}

console.log("Sending " + valueToTransfer + " wei from " + fromAddress + " to " + toAddress);
web3.eth.sendTransaction({from: fromAddress, to: toAddress, value: valueToTransfer})