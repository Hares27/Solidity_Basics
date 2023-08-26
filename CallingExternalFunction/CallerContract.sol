
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TargetContract{

    function targetFunction(uint _number) public payable returns(uint)
    {
        return _number++;
    }
}


contract CallerContract{

    address private targetAddress;
    bytes public result;

   constructor(address _addr)
   {
       targetAddress=_addr;
   }

   function callExternal() public payable{
       (bool success,bytes memory data)=targetAddress.call(abi.encodeWithSignature("targetFunction(uint256)",2));
       require(success);
       result=data;
   }


    
}
