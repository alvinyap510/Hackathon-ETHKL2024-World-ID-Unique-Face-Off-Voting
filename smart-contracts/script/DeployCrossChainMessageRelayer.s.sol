// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Script.sol";
import {LZCrossChainMessageRelayer} from "../src/LZCrossChainMessageRelayer.sol";

contract DeployCrossChainMessageRelayer is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        console.log("Deployer address:", deployerAddress);

        // Broadcast
        vm.startBroadcast(deployerPrivateKey);
        LZCrossChainMessageRelayer messageRelayer =
            new LZCrossChainMessageRelayer(0x6EDCE65403992e310A62460808c4b910D972f10f, msg.sender);
        vm.stopBroadcast();
    }
}

// Scroll Sepolia LZ Endpoint: 0x6EDCE65403992e310A62460808c4b910D972f10f
// Manta Sepolia LZ Endpoint: 0x6EDCE65403992e310A62460808c4b910D972f10f

// forge script script/DeployCrossChainMessageRelayer.s.sol:DeployCrossChainMessageRelayer --rpc-url https://sepolia-rpc.scroll.io --broadcast --verify --etherscan-api-key 8654MU4RD3WIRD3QM342QG35BYDP9CVAEG --verifier-url https://api-sepolia-optimistic.etherscan.io/api -vvvv
