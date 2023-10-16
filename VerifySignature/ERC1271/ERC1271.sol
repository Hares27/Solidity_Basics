
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract ERC1271{
    bytes4 constant internal MAGICVALUE = 0x1626ba7e;
    address public owner;
    

    constructor(){
        owner=msg.sender;

    }

  
  function isValidSignature( bytes32 _hash,  bytes memory _signature) public view returns (bytes4 magicValue)
    {
      
         if (recoverSigner(_hash, _signature) == owner) {
      return 0x1626ba7e;
    } else {
      return 0xffffffff;
    }

    }


 function recoverSigner(bytes32 _hash,bytes memory _signature) internal pure returns (address signer) {
    require(_signature.length == 65, "SignatureValidator#recoverSigner: invalid signature length");
bytes32[3] memory _sig;
    
      assembly { 
      _sig := _signature
    }
    bytes32 r = _sig[1];
    bytes32 s = _sig[2];
    uint8 v = uint8(_signature[64]);

    if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
      revert("SignatureValidator#recoverSigner: invalid signature 's' value");
    }

    if (v != 27 && v != 28) {
      revert("SignatureValidator#recoverSigner: invalid signature 'v' value");
    }

    // Recover ECDSA signer
    signer = ecrecover(_hash, v, r, s);
    
    // Prevent signer from being 0x0
    require(
      signer != address(0x0),
      "SignatureValidator#recoverSigner: INVALID_SIGNER"
    );
    

    

    return signer;
  }
}
