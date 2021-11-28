// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract BlockdemyLootAttributes {
    string[] private _profile = [
        "Trader",
        "Consultant",
        "Lawyer",
        "Developer",
        "NFT Feak"
    ];

    string[] private _instructor = [
        "Ernesto Garcia",
        "Marco Munoz",
        "Isaac Lopez",
        "Nicolas Garcia",
        "Jorge Tavares",
        "Camila Pineda"
    ];

    string[] private _exchange = [
        "Coinbase",
        "Bitso",
        "Binance",
        "Buda",
        "Kraken",
        "Uniswap",
        "PancakeSwap"
    ];

    string[] private _token = [
        "UNI",
        "SUSHI",
        "ENS",
        "DAI",
        "USDC",
        "USDT",
        "SHIBA",
        "DOGE",
        "CAKE",
        "WETH"
    ];

    string[] private _blockchain = [
        "Ethereum",
        "Binance Smart Chain",
        "Solana",
        "Tron",
        "Stellar",
        "Terra",
        "Tezos",
        "Fantom",
        "Hyperledger",
        "Avalanche",
        "Polygon"
    ];

    string[] private _wallet = [
        "Metamask",
        "Phantom",
        "Binance Wallet",
        "Ledger",
        "Trezor",
        "Brave Wallet",
        "MyEtherWallet",
        "Trust"
    ];

    string[] private _youtubeProgram = [
        "Code and Hacks",
        "Crypto Webinar Series",
        "Blockdemy Legal",
        "Trading Nights",
        "Crypto News"
    ];

    string[] private _NFT = [
        "Bored Apes Yacht Club",
        "Crypto Punks",
        "Loot",
        "DegenApes",
        "Crypto Kitties",
        "Thug Birds",
        "NFL"
    ];

    function deterministicNoise(bytes memory _input)
        internal
        pure
        returns (uint256)
    {
        bytes32 _noise = keccak256(_input);
        return uint256(_noise);
    }

    function getAttribute(
        uint256 _tokenId,
        string memory _prefix,
        string[] memory _sourceArray
    ) internal pure returns (string memory) {
        uint256 noise = deterministicNoise(abi.encodePacked(_tokenId, _prefix));
        return _sourceArray[noise % _sourceArray.length];
    }

    function getProfile(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "PROFILE", _profile);
    }
    
    function getInstructor(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "INSTRUCTOR", _instructor);
    }
    
    function getExchange(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "EXCHANGE", _exchange);
    }
    
    function getToken(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "TOKEN", _token);
    }
    
    function getBlockchain(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "BLOCKCHAIN", _blockchain);
    }
    
    function getWallet(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "WALLET", _wallet);
    }
    
    function getYoutubeProgram(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "YOUTUBE_PROGRAM", _youtubeProgram);
    }
    
    function getNFT(uint256 _tokenId)
        internal
        view
        returns (string memory)
    {
        return getAttribute(_tokenId, "NFT", _NFT);
    }
}
