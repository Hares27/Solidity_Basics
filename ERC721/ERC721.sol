// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract ERC721{

    string private _name;
    string private _symbol;
    constructor(string memory name_,string  memory symbol_){
        _name=name_;
        _symbol=symbol_;


    }

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);


    mapping(address=>uint) private _balanceOf;
    mapping(uint=>address)  private  _ownerOf;
    mapping(uint => address) private tokenIdApprover;

 function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    function mint(address _addr,uint _tokenId) internal{
        
        require(_addr !=address(0),"Minting to zero address");
    require(! exist(_tokenId),"Token is already minted");
         _balanceOf[_addr]++;
         _ownerOf[_tokenId]=_addr;

    }
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable{
        require(_from!=address(0),"From address must not be zero address");
        require(_to!=address(0),"To address must not be zero");
        require(exist(_tokenId),"Token must be existed to transfer");
        _balanceOf[_from]--;
        _balanceOf[_to]++;
        _ownerOf[_tokenId]=_to;
     emit Transfer( _from,  _to, _tokenId);

    }
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable{
         require(_from!=address(0),"From address must not be zero address");
        require(_to!=address(0),"To address must not be zero");
        require(exist(_tokenId),"Token must be existed to transfer");
        _balanceOf[_from]--;
        _balanceOf[_to]++;
        _ownerOf[_tokenId]=_to;
        emit Transfer( _from,  _to, _tokenId);

    }

     function approve(address _approved, uint256 _tokenId) external payable
     {
         require(_ownerOf[_tokenId]==msg.sender,"Approval must be done by owner of tokenId");
         tokenIdApprover[_tokenId]=_approved;

     }

     function exist(uint _tokenId) internal view virtual returns(bool){
         return _ownerOf[_tokenId] != address(0);
     }



}
