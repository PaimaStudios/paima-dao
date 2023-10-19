// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import "../src/PaimaDAOv1.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        PaimaDAOv1 paimaDaoImpl = new PaimaDAOv1();
        bytes memory initializeData = abi.encodeWithSignature("initialize()");
        ERC1967Proxy paimaDaoProxy = new ERC1967Proxy(address(paimaDaoImpl), initializeData);
        console2.log("Paima DAO implementation:", address(paimaDaoImpl));
        console2.log("Paima DAO proxy:", address(paimaDaoProxy));

        vm.stopBroadcast();
    }
}
