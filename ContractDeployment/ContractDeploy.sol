// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Creat2Contract{
    address public owner;
    constructor(address _owner){
        owner=_owner;

    }

    function getOwner() public view returns(address){
        return owner;
    }

}
contract Factory{

    function deploy(uint _salt,address _owner) public  returns(address)
    {
        return address(new Creat2Contract{salt:bytes32(_salt)}(_owner));
    }

    function getByteCode(address _owner) public  returns(bytes memory){
        bytes memory byteCode=type(Creat2Contract).creationCode;

        return abi.encodePacked(byteCode,abi.encode(_owner));
    }

    function getAddress(bytes memory _byteCode,uint _salt) public returns(address){
        bytes32 hash=keccak256(abi.encodePacked(bytes1(0xff),address(this),_salt,keccak256(_byteCode)));
        return address(uint160(uint(hash)));

    }

    




}

