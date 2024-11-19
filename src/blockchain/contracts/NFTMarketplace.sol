// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMarketplace is ERC721 {
    address public owner;
    uint256 public tokenId = 1;

    struct NFT {
        address owner;
        uint256 price;
        bool isForSale;
        string tokenURL; // URL for the token metadata (e.g., image, description)
    }

    mapping(uint256 => NFT) public nfts;
    mapping(address => mapping(string => bool)) public addressToTokenURL; // Tracks if an address has minted a specific tokenURL

    constructor() ERC721("NFT Marketplace", "NFTM") {
        owner = msg.sender;
    }

    function mintNFT(address _owner, uint256 _price, string calldata _tokenURL) external returns (uint256) {
        require(msg.sender == owner, "Only owner can mint NFT");
        require(!addressToTokenURL[_owner][_tokenURL], "This address has already minted this NFT");

        uint256 newTokenId = tokenId++;
        _safeMint(_owner, newTokenId);
        nfts[newTokenId] = NFT(_owner, _price, false, _tokenURL);

        // Mark this tokenURL as minted by this address
        addressToTokenURL[_owner][_tokenURL] = true;
        return newTokenId;
    }

    function sellNFT(uint256 _tokenId, uint256 _price) external {
        require(msg.sender == nfts[_tokenId].owner, "Only owner can sell NFT");
        require(!nfts[_tokenId].isForSale, "NFT is already for sale");
        nfts[_tokenId].price = _price;
        nfts[_tokenId].isForSale = true;
    }

    function buyNFT(uint256 _tokenId) external payable {
        require(nfts[_tokenId].isForSale, "NFT is not for sale");
        require(msg.value >= nfts[_tokenId].price, "Not enough Ether to buy NFT");

        address seller = nfts[_tokenId].owner;

        // Transfer the NFT to the buyer
        _transfer(seller, msg.sender, _tokenId);

        // Mark the NFT as no longer for sale
        nfts[_tokenId].isForSale = false;

        // Update the owner in the struct
        nfts[_tokenId].owner = msg.sender;

        // Send the Ether to the seller
        payable(seller).transfer(msg.value);
    }

    function getNFTAddress(uint256 _tokenId) external view returns (address) {
        return nfts[_tokenId].owner;
    }

    function getTokenURL(uint256 _tokenId) external view returns (string memory) {
        return nfts[_tokenId].tokenURL;
    }

    function getAvailableNFTs() external view returns (uint256[] memory) {
        uint256 totalNFTs = tokenId - 1;
        uint256 availableCount = 0;

        // Count how many NFTs are for sale
        for (uint256 i = 1; i <= totalNFTs; i++) {
            if (nfts[i].isForSale) {
                availableCount++;
            }
        }

        // Populate an array with token IDs of NFTs for sale
        uint256[] memory availableNFTs = new uint256[](availableCount);
        uint256 index = 0;
        for (uint256 i = 1; i <= totalNFTs; i++) {
            if (nfts[i].isForSale) {
                availableNFTs[index] = i;
                index++;
            }
        }

        return availableNFTs;
    }
}
