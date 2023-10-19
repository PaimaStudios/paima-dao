// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract PaimaDAOv1 is OwnableUpgradeable, UUPSUpgradeable {
    using Address for address payable;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    receive() external payable {}

    fallback() external payable {}

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function withdraw(address payable account) external onlyOwner {
        uint256 balance = address(this).balance;

        require(balance > 0, "Zero balance");
        account.sendValue(balance);
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}
}
