# What is EIP165?

EIP 165 is a standard interface detector.

As the name suggest it will help to detect which interfaces are supported and implemented by a contract.

This will helps prevent token from getting stuck in a smart contract that does not support related token standard.What it means.
 If a token owned by a person , the person will intiate the transaction.
 If a token belongs address which is held by contract then it has to support token standards like(ERC20,ERC721,ERC1155,ERC3525) inorder to intiate transaction for transfering tokens.If the contract don't know  about token standards which token realted to ,the tokens will be stuck in that contract.

### Example:

#### Contract One: Do you support "Arjun" tokens.

#### Contract Two: Yes

#### Contract One: Great, here are "Arjun" tokens.

This makes to prevent tokens to be stuck in a contract because we are checking contract before transfering.


How can we ask whether a contract will support a specific interface or not.

Generally an interface contains methods. We can ask the contract whether it will support the methods in interface.It will be difficult if we have more methods defined under a interface.
For this we need to have one identifier for an interface .

#### How can we get identifier for an interface
###### There two approaches to get this:
+ By using Keccak256 hash algorithm . We find Keccak256 hash for every method in interface and doing xor operation on them. At last you will get byte4 format identifier.
+ Another one is  using  ***type(interfaceName).interfaceId***
 

 
