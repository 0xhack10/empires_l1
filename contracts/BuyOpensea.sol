// SPDX-License-Identifier: Apache-2.0.
pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IStarknetCore.sol";
import "./interfaces/ISeaport.sol";

/**
  Demo contract for L1 <-> L2 interaction between an L2 StarkNet contract and this L1 solidity
  contract.
*/
contract BuyOpensea {
    // The StarkNet core contract.
    IStarknetCore starknetCore;

    // opensea Seaport contract
    ISeaport seaPort;

    mapping(uint256 => uint256) public userBalances;

    uint256 constant MESSAGE_BUY = 0;

    uint256 l2ContractAddress;

    event Received(uint256 _from, uint256 _tokenId, uint256 _price);

    //TODO: write depositor address to send funds back

    /**
      Initializes the contract state.
    */
    constructor(
        address starknetCore_,
        address seaPort_,
        uint256 _l2ContractAddress
    ) {
        starknetCore = IStarknetCore(starknetCore_);
        seaPort = ISeaport(seaPort_);
        l2ContractAddress = _l2ContractAddress;
    }

    // buy an NFT on OpenSea
    function buy(
        uint256 tokenId,
        uint256 price,
        BasicOrderParameters calldata params
    ) external {
        // Construct the withdrawal message's payload.
        uint256[] memory payload = new uint256[](3);
        payload[0] = MESSAGE_BUY;
        payload[1] = tokenId;
        payload[2] = price;

        // Consume the message from the StarkNet core contract.
        // This will revert the (Ethereum) transaction if the message does not exist.
        // The message can only be consumed once.
        // starknetCore.consumeMessageFromL2(l2ContractAddress, payload);

        // Buy
        seaPort.fulfillBasicOrder(params);

        // Update the L1 balance.
        emit Received(l2ContractAddress, tokenId, price);
    }
}
