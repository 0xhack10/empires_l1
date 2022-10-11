# Empires L1 Contract

A new way to make alliances on Realms.

Visit [https://scroll.bibliothecadao.xyz/](https://scroll.bibliothecadao.xyz/) for more information on Realms.

![Untitled](/static/empireL1.jpeg)

## Starknet L2 Contract

The Empires contracts on Starknet allows players of Realm to come together as one and elect an Emperor to actively manage the Empire. More info on these contracts here:

[https://github.com/anondev1993/empires](https://github.com/anondev1993/empires)

One of the features implemented by the L2 Empire contract is the possibility for the Empire to vote on using the L2 treasury to buy a Realm on Opensea.

Once a vote is passed, the Emperor can bridge the funds to the L1 contract with a message indicating:

- the tokenId of the Realms to buy
- the amount in eth that can be spent

This message is passed to the L1 through the L1 L2 messaging. More info on this here: https://starknet.io/docs/hello_starknet/l1l2.html

## Ethereum L1 Contract

The empires L1 contract is intended to be used in addition to the Empires contract on L2.

His role is to intercept messages from the L2 empires contract and hold the bridged funds. Once a buy message has been received from the L2, anyone can call the buy function to call the Seaport contract and buy the NFT.

### Constructor

4 arguments are needed to deploy the contract.

- The StarnetCore contract address (L2 messages holder)
- The Seaport contract address (Opensea)
- The Empires L2 Contract address
- The Realms L1 NFT address

## Setup

1. npm install

```jsx
npm install
```

1. Rename the .env.example file in .env and full in the necessary information.

## Scripts

```jsx
// buys nft specified in .env file
npx ts-node scripts/buyOpensea.ts
```

This will buy the specified tokenId in the .env file if :

- the Realms NFT corresponding to the tokenId is listed on Opensea
- the listing price corresponds to the specified message from L2 Empire

Both the L1/L2 messaging and Opensea buying have been tested on Ethereum Goerli.

## Seaport Contract Arguments

In order to construct the arguments needed for the Seaport contract (Opensea), we use the Opensea API to retrieve the listing info. The way these arguments are constructed can be found in `scripts/buyOpensea/constructArgs.ts`
