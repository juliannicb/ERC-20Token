// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC20Token is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 tokens to the deployer
    }

    // Mint new tokens (only the owner can call this)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens (any user can burn their own tokens)
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
