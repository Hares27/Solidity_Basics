
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ERC721.sol";

abstract contract ERC721Metadata is ERC721{

    mapping(uint=>string) private _tokenURIs;
  


    function tokenURI(uint256 _tokenId) internal view returns(string memory){
        string memory _tokenURI=_tokenURIs[_tokenId];
        string memory _baseURI=_baseURI();
        if(bytes(_baseURI).length >0)
        {
            return string(abi.encodePacked(_baseURI,_tokenURI));
        }
        return _tokenURIs[_tokenId];

    }

    function setTokenURI(uint _tokenId,string memory _tokenURI) internal virtual  {

        require(exist(_tokenId),"Token Id does not exist");
        _tokenURIs[_tokenId]=_tokenURI;

    }
}
