// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Multicall{

    function multicall(address[]  calldata targets,bytes[] calldata data) external view returns(bytes[] memory){

    require(targets.length==data.length,"Target and data must be same length");
    bytes[] memory results=new bytes[](targets.length);
    for(uint i=0; i< targets.length;i++)
    {
        (bool success,bytes memory result)=targets[i].staticcall(data[i]);
        require(success,"Can't able to call the contract");
        results[i]=result;

    }
    return results;

    }
}


contract TestMulticall{
    
    function functionOne(uint _number) public pure returns(uint){
     return _number;
    }

    function getFunctionOneData(uint _number) public  pure returns(bytes memory){

     return abi.encodeWithSelector(this.functionOne.selector,_number);

    }
    function functionTwo(uint _number) public pure returns(uint){
     return _number;
    }

    function getFunctionTwoData(uint _number) public  pure returns(bytes memory){

     return abi.encodeWithSelector(this.functionTwo.selector,_number);

    }

    
}