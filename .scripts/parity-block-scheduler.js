Web3 = require("web3")

web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

valueToTransfer = web3.utils.toWei("0.001", "ether");

setInterval( () => {
  	web3.eth.sendTransaction({from: "0x00a329c0648769a73afac7f9381e08fb43dbea72", to: "0x0000000000000000000000000000000000000000", value: valueToTransfer})
}, 3000);
