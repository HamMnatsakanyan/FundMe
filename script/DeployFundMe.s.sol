// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.27;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {

    function run() external returns (FundMe){
        HelperConfig helperConfig = new HelperConfig();
        address addr = helperConfig.addr();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(addr);
        vm.stopBroadcast();
        return fundMe;
    }

}