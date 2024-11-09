// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {

    FundMe fundMe;

    function setUp() external {
        DeployFundMe deployer = new DeployFundMe();
        fundMe = deployer.run();
    }

    function testDemo() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwner() public view {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testAggVersion() public view {
        console.log(fundMe.getVersion());
        assertEq(fundMe.getVersion(), 4);
    }

    function testWithdraw() public {
        fundMe.fund{value: 6e18}();
        vm.expectRevert();
        fundMe.withdraw();
    }

    function testFundMe() public {
        vm.expectRevert();
        fundMe.fund();
    }
}