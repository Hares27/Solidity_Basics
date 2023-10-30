
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract SoulBoundToken{

    struct Credentials{
        string name;
        string password;
    }


    mapping(address => bytes32) public CredentialHash;

    function createCredentials(string memory _name,string memory _password) public{
        require(CredentialHash[msg.sender] == bytes32(0),"The user has already created the credentials");
      CredentialHash[msg.sender]=keccak256((abi.encode(_name,_password)));


    }

    function verifyCredentials(string memory _name,string memory _password)  view public returns(bool validation){
        bytes32 verifyingHash=keccak256(abi.encode(_name,_password));
        require(verifyingHash==CredentialHash[msg.sender],"The user credentials are not matching");
        bool success=true;
        return success;


    
        
    }
}
