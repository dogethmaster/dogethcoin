pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT
/**
 * @title Dogeth
 * @dev This is a simple ERC20 token contract.
 * @custom:dev-run-script script.js
 */
contract Dogeth {

  // The total supply of tokens.
  uint256 public totalSupply = 420690000000000;

  // The mapping of addresses to their token balances.
  mapping(address => uint256) public balances;

  // The constructor function initializes the total supply of tokens.
  constructor() {
    totalSupply = 420690000000000;
    balances[msg.sender] = totalSupply;
  }

  // The transfer function allows users to transfer tokens to each other.
  function transfer(address recipient, uint256 amount) public returns (bool success) {
    // Check if the sender has enough tokens.
    require(balances[msg.sender] >= amount);

    // Decrease the sender's balance.
    balances[msg.sender] -= amount;

    // Increase the recipient's balance.
    balances[recipient] += amount;

    // Emit a transfer event.
    emit Transfer(msg.sender, recipient, amount);

    return true;
  }

  // The burn function allows users to burn tokens.
  function burn(uint256 amount) public returns (bool success) {
    // Check if the sender has enough tokens.
    require(balances[msg.sender] >= amount);

    // Decrease the sender's balance.
    balances[msg.sender] -= amount;

    // Decrease the total supply.
    totalSupply -= amount;

    // Emit a burn event.
    emit Burn(msg.sender, amount);

    return true;
  }

  // The events emitted by the contract.
  event Transfer(address indexed from, address indexed to, uint256 amount);
  event Burn(address indexed from, uint256 amount);

  // The symbol of the token.
  string public symbol = "DOGETH";
}