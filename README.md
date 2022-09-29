# Empires L1 Contract

## Overview

//TODO: copy overview from other empires git

In order for the Empire to conduct L1 activity such as buying a Realm on Opensea,
we introduce an L1 contract that can receive messages from the L2 Empires contact and perform actions based on these messages.

## L1 <-> L2 messaging

//TODO: explain

## Copy Realms on Goerli Testnet

//TODO

## Buy Realms ERC-721 on OpenSea

### BasicOrderParams

Example of parameters to give when calling fullBasicOrder:
0 parameters.considerationToken address 0x0000000000000000000000000000000000000000
0 parameters.considerationIdentifier uint256 0
0 parameters.considerationAmount uint256 9750000000000
0 parameters.offerer address 0x8C2055A440a880aE667Aa99a7EE17c90DF1E3BBe
0 parameters.zone address 0x0000000000000000000000000000000000000000
0 parameters.offerToken address 0xA112C8E2784c10Db5A8aF1b19985ff97E34C1e59
0 parameters.offerIdentifier uint256 14
0 parameters.offerAmount uint256 1
0 parameters.basicOrderType uint8 0
0 parameters.startTime uint256 1664164499
0 parameters.endTime uint256 1666756499
0 parameters.zoneHash bytes32 0x0000000000000000000000000000000000000000000000000000000000000000
0 parameters.salt uint256 24446860302761739304752683030156737591518664810215442929800501151223426166994
0 parameters.offererConduitKey bytes32 0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000
0 parameters.fulfillerConduitKey bytes32 0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000
0 parameters.totalOriginalAdditionalRecipients uint256 1
0 parameters.additionalRecipients tuple 250000000000,0x0000a26b00c1F0DF003000390027140000fAa719
0 parameters.signature bytes 0xf2f3ae6cf82aa3a0243a3f38ecf0a8da0621479f4c29cdef972bcd6a9906a2b254c07afc96edc3a4353b7db825e38db3b8dee6c5dbc962aaf69f74b8ea2e04cc1b

### OpenSea API
