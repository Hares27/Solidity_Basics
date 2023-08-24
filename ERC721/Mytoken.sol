
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ERC721.sol";
import "./ERC721Metadata.sol";
contract MyToken is ERC721,ERC721Metadata{

    constructor() ERC721("MyToken","MT")
    {

    }
  function _baseURI() internal view virtual override returns (string memory) {
        return "abc";
    }

    function mintToken(uint _tokenId,string memory _tokenURI) public {
        mint(msg.sender,_tokenId);
        setTokenURI(_tokenId,_tokenURI);
    }

    function tokenURIdata(uint _tokenId) public view returns(string memory){
        return tokenURI(_tokenId);
    }

}
