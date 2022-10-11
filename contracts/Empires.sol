// SPDX-License-Identifier: Apache-2.0.
pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IStarknetCore.sol";
import "./interfaces/ISeaport.sol";

/// @title L1 Empire contract
/// @notice This contract is used for L2 to L1 interaction by the Empire starknet contract
contract Empires {
    // The StarkNet core interface
    IStarknetCore starknetCore;
    // The Opensea Seaport interface
    ISeaport seaPort;

    // Constants to make sure we take the right action
    uint256 constant MESSAGE_BUY = 0;

    // Contrat address of the L2 Empires Contract
    uint256 public l2ContractAddress;
    // Contrat address of the Realms ERC-721 Contract Address
    address public realmsContractAddress;

    // Events
    event Received(uint256 _from, uint256 _tokenId, uint256 _price);

    /// @notice Initializes the contract state
    /// @param starknetCore_ The address of the starknet L1 contract containing message queue
    /// @param seaPort_ The address of the L1 Seaport contract
    /// @param l2ContractAddress_ The address of the L2 starknet contract
    /// @param realmsContractAddress_ The address of the realms contract
    constructor(
        address starknetCore_,
        address seaPort_,
        uint256 l2ContractAddress_,
        address realmsContractAddress_
    ) {
        starknetCore = IStarknetCore(starknetCore_);
        seaPort = ISeaport(seaPort_);
        l2ContractAddress = l2ContractAddress_;
        realmsContractAddress = realmsContractAddress_;
    }

    // @notice Buys an NFT on OpenSea
    // @param tokenId The id of the token, decided on the L2 contract
    // @param price The price of the token in wei, decided on the L2 contract
    // @param params The parameters to buy through fullfillBasicOrder on Seaport
    function buy(
        uint256 tokenId,
        uint256 price,
        BasicOrderParameters calldata params
    ) external payable {
        // require that the params for Opensea respect the tokenId and realms contract address
        require(params.offerIdentifier == tokenId, "IT"); // incorrect token
        require(params.offerToken == realmsContractAddress, "IC"); // incorrect contract

        // Construct the withdrawal message's payload.
        uint256[] memory payload = new uint256[](3);
        payload[0] = MESSAGE_BUY;
        payload[1] = tokenId;
        payload[2] = price;

        // Consume the message from the StarkNet core contract.
        // This will revert the (Ethereum) transaction if the message does not exist.
        // The message can only be consumed once.
        starknetCore.consumeMessageFromL2(l2ContractAddress, payload);

        // Buys on Opensea
        seaPort.fulfillBasicOrder{value: price}(params);

        // event that indicates that token has been bought
        emit Received(l2ContractAddress, tokenId, price);
    }

    receive() external payable {}
}
