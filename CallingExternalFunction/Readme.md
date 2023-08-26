
# There are two ways of calling a external function one is with ABI(Application binary interface) another one is without ABI.

## What is ABI 

It is a JSON representation of functions and events of a solidity program.

Solidity is a high level language which is not understoos by machine. Machine only understood only machine code . But user understand solidity , user can't understand machine code. If the user and machine needs communicate they need a common language JSON. JSON is understood by any environment.



If I need to call a function in another solidity file I could call it using ABI or without ABI.


## Example for calling without ABI

```
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
```


## Calling with ABI
```// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TargetContract{

    function targetFunction(uint _number) public payable returns(uint)
    {
        return _number++;
    }
}


contract CallerContract{

    TargetContract private target;
     uint public number;

   constructor(address _addr)
   {
       target=TargetContract(_addr);
   }

   function callExternal() public payable{
      uint _number=target.targetFunction(2);
      number=_number;


   }


    
} ```
```



**Question**: Does `pragma solidity ^0.8.0;` will get converted to EVM byte code when you compile your solidity 


**Answer** : Pragma directives are not compiled into EVM bytecode they are only used  by compiler to check compatability.




