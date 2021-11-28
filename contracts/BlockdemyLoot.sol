// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./Base64.sol";
import "./BlockdemyLootAttributes.sol";

contract BlockdemyLoot is ERC721Enumerable, BlockdemyLootAttributes {
    using Strings for uint256;
    using Base64 for bytes;

    uint256 public maxSupply;

    constructor(uint256 _maxSupply) ERC721("BlockdemyLoot", "BLT") {
        maxSupply = _maxSupply;
    }

    function mint(address _to, uint256 _tokenId) public {
        // require(msg.value >= 1e16, "Non enough value"); // 0.01 eth
        require(
            totalSupply() < maxSupply - 1,
            "There are no Blockdemy Loots available"
        );

        _safeMint(_to, _tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        string memory image;
        string memory svg;
        string[17] memory parts;

        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        parts[1] = getProfile(tokenId);

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = getInstructor(tokenId);

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[5] = getExchange(tokenId);

        parts[6] = '</text><text x="10" y="80" class="base">';

        parts[7] = getToken(tokenId);

        parts[8] = '</text><text x="10" y="100" class="base">';

        parts[9] = getBlockchain(tokenId);

        parts[10] = '</text><text x="10" y="120" class="base">';

        parts[11] = getWallet(tokenId);

        parts[12] = '</text><text x="10" y="140" class="base">';

        parts[13] = getYoutubeProgram(tokenId);

        parts[14] = '</text><text x="10" y="160" class="base">';

        parts[15] = getNFT(tokenId);

        parts[16] = "</text></svg>";

        svg = string(
            abi.encodePacked(
                parts[0],
                parts[1],
                parts[2],
                parts[3],
                parts[4],
                parts[5],
                parts[6],
                parts[7],
                parts[8]
            )
        );

        svg = string(
            abi.encodePacked(
                svg,
                parts[9],
                parts[10],
                parts[11],
                parts[12],
                parts[13],
                parts[14],
                parts[15],
                parts[16]
            )
        );

        image = string(
            abi.encodePacked("data:image/svg+xml;base64,", bytes(svg).encode())
        );

        string memory json = abi
            .encodePacked(
                '{"name": "Tribe #',
                tokenId.toString(),
                '", "description": "Blockdemy Loot is a set of randomized Blockchain Academy Tribe attributes. Images are omitted intentionally for others to interpret. Feel free to use in any way you want. Perhaps to build next unicorn?", "image":"',
                image,
                '"}'
            )
            .encode();

        // 1. Create attributes
        // 2. Crear el svg con los atributos
        // 3. Convertir svg a base64
        // 4. Construir el data URI con el base64

        // 1. Crear el json
        // 2. Codificar a base 64
        // 3. Construir el data URI con el base 64
        return string(abi.encodePacked("data:application/json;base64,", json));
    }
}
