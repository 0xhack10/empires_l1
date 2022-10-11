// SPDX-License-Identifier: Apache-2.0.
pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IStarknetCore.sol";
import "./interfaces/ISeaport.sol";

/**
  Contract for L1 <-> L2 interaction between an L2 StarkNet contract and this L1 solidity
  contract.
*/
contract Empires {
    // The StarkNet core interface
    IStarknetCore starknetCore;
    // The Opensea Seaport interface
    ISeaport seaPort;

    // Constants to make sure we take the right action
    // TODO: add the constants when consuming messages from L2
    uint256 constant MESSAGE_BUY = 0;
    uint256 constant MESSAGE_BRIDGE_BACK = 1;
    //TODO: write depositor address to send funds back

    // Contrat address of the L2 Empires Contract
    uint256 public l2ContractAddress;
    // Contrat address of the Realms ERC-721 Contract Address
    address public realmsContractAddress;

    // Events
    event Received(uint256 _from, uint256 _tokenId, uint256 _price);

    // Modifiers

    /*
      @notice Initializes the contract state
      @param starknetCore_: the address of the starknet L1 contract containing message queue
      @param seaPort_: the address of the L1 Seaport contract
      @param _l2ContractAddress: the address of the L2 starknet contract
      @param realmsContract_: the address of the realms contract
    */
    constructor(
        address starknetCore_,
        address seaPort_,
        uint256 l2ContractAddress_,
        address realmsContract_
    ) {
        starknetCore = IStarknetCore(starknetCore_);
        seaPort = ISeaport(seaPort_);
        l2ContractAddress = l2ContractAddress_;
        realmsContractAddress = realmsContract_;
    }

    // @notice buy an NFT on OpenSea
    // @param tokenID: the id of the token, decided on the L2 contract
    // @param price: the price of the token in wei, decided on the L2 contract
    // @param params: parameters to buy through fullfillBasicOrder on Seaport
    function buy(
        uint256 tokenId,
        uint256 price,
        BasicOrderParameters calldata params
    ) external payable {
        // require that the params for Opensea respect the tokenId and realms contract address
        require(
            params.offerIdentifier == tokenId,
            "The specified tokenId does not match the BasicOrderParameters"
        );
        require(
            params.offerToken == realmsContractAddress,
            "The realms contract address does not match the BasicOrderParameters"
        );

        // Construct the withdrawal message's payload.
        uint256[] memory payload = new uint256[](3);
        payload[0] = MESSAGE_BUY;
        payload[1] = tokenId;
        payload[2] = price;

        // Consume the message from the StarkNet core contract.
        // This will revert the (Ethereum) transaction if the message does not exist.
        // The message can only be consumed once.
        //TODO: check that the amount of eth in the contract is enough before consuming the message
        starknetCore.consumeMessageFromL2(l2ContractAddress, payload);

        // Buys on Opensea
        seaPort.fulfillBasicOrder{value: price}(params);

        // event that indicates that token has been bought
        emit Received(l2ContractAddress, tokenId, price);
    }

    //TODO: implement function to bridge funds back to L2

    //TODO: implement function to bridge back NFT to L2

    receive() external payable {}
}
