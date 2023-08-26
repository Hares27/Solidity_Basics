
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;



contract TargetContract{

    uint public value;
    address public sender;
    string public name;
   


    function targetFunction(string memory _name) public payable {
        value=msg.value;
        sender=msg.sender;
        name=_name;
        
       

    }
}
