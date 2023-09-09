//0xa175D64C21b3A9B0A5aCCc305ACeF6bf71a6607d
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

library Array{
    function remove(uint[] storage arr,uint index) internal {

      require(arr.length >0," array length must be greater than zero");
       arr[index]=arr[arr.length-1];
       arr.pop();

    }
}
contract TestArray{

    using Array for uint[];

    uint[] public arr;
    
    function addElementsToArray(uint _arrayElement) public{
        arr.push(_arrayElement);

    }
     function testArrayRemove(uint _elementIndex) public{
        arr.remove(_elementIndex);
         
     }

}
