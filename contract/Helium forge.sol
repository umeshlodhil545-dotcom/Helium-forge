// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeliumForge {
    mapping(address => uint256) public  balances; // User's ETH balance for forging
    mapping(address => uint256) public heliumTokens; // Forged helium tokens

    // Core Function 1: Deposit ETH to start forging
    function deposit() public payable {
        require(msg.value > 0, "Must deposit some ETH");
        balances[msg.sender] += msg.value;
    }

    // Core Function 2: Forge helium tokens using deposited ETH (simple 1:1 ratio for demo)
    function forge(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance to forge");
        balances[msg.sender] -= amount;
        heliumTokens[msg.sender] += amount; // Forge tokens
    }

    // Core Function 3: Withdraw remaining ETH
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
