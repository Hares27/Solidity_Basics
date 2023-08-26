
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TargetContract{

    function targetFunction(uint _number) public payable returns(uint)
    {
        return _number++;
    }
}
