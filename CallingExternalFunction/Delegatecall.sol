
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


import "./TargetContract.sol";
contract CallerContract{

    uint public value;
    address public sender;
    string public name;
    bool public callSuccess;


    function testDelegate(string memory _name,TargetContract _target) public payable {
        value=msg.value;
        sender=msg.sender;
        name=_name;
        
        (bool success,)=payable(address(_target)).delegatecall(abi.encodeWithSignature("targetFunction(string)",_name));

         callSuccess=success;

    }
}
