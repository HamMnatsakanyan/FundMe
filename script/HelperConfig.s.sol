// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/Mock.t.sol";

contract HelperConfig is Script {

    address public addr;

    constructor(){
        if(block.chainid == 11155111){
            addr = getSepoliaPriceFeed();
        } else {
            addr = getAnvilPriceFeed();
        }
    }

    function getSepoliaPriceFeed() public pure returns (address){
        return 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    }

    function getAnvilPriceFeed() public returns (address){

        vm.startBroadcast();
        MockV3Aggregator mock = new MockV3Aggregator(8, 2000e8);
        vm.stopBroadcast();

        return address(mock);
    }

}