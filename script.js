const web3 = require("web3");

import Dogeth from "./Dogeth.sol";

const DogethContractAddress = "0x...";

const web3Provider = new web3.providers.HttpProvider("http://localhost:8545");

const web3Instance = new web3(web3Provider);

const DogethContract = new web3Instance.eth.contract(Dogeth.info.abiDefinition);

DogethContract.at(DogethContractAddress).totalSupply.then(function(result) {
  console.log("The total supply of dogeth is: " + result);
});

DogethContract.at(DogethContractAddress).balanceOf("0x...").then(function(result) {
  console.log("The balance of the address 0x... is: " + result);
});

DogethContract.at(DogethContractAddress).transfer("0x...", 100).then(function(result) {
  console.log("The transaction was successful!");
});