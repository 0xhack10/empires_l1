## Opensea Seaport Parameters

params = {
considerationToken: "0x0000000000000000000000000000000000000000",
considerationIdentifier: 0,
considerationAmount: 55500000000000000,
offerer: "ownerAddress",
zone: "0x004C00500000aD104D7DBd00e3ae0A5C00560C00", //same for all
offerToken: "0x7AFe30cB3E53dba6801aa0EA647A0EcEA7cBe18d", //realms contract
offerIdentifier: "tokenId",
offerAmount: 1, // same for all
basicOrderType: 2, // same for all
startTime: 1663649763, // what is it ?
endTime: 1679201763, //what is it?
zoneHash:
"0x0000000000000000000000000000000000000000000000000000000000000000",
salt: "24446860302761739304752683030156737591518664810215442929801634366420960235688", // what is it? not same for all
offererConduitKey:
"0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000", // same for all
fulfillerConduitKey:
"0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000", //same for all
totalOriginalAdditionalRecipients: 2, //same for all
additionalRecipients:
"1500000000000000,0x0000a26b00c1F0DF003000390027140000fAa719,3000000000000000,0x9282E821b052880fAF362F2De3240eF474BbC84E",
signature: "wat is it ?", //not same
};

## Parameters to give when calling fullBasicOrder

0 parameters.considerationToken address 0x0000000000000000000000000000000000000000 //ok
0 parameters.considerationIdentifier uint256 0 //ok
0 parameters.considerationAmount uint256 975000 //
0 parameters.offerer address 0x0F4b1a1c8B5d1cA4C15B463aDF037D8370381052
0 parameters.zone address 0x0000000000000000000000000000000000000000
0 parameters.offerToken address 0x804159144AEFB1Dc17B171afCefA5B33746c722F
0 parameters.offerIdentifier uint256 6917386473567610436533176691103595204565081659136229676389708905834583425124
0 parameters.offerAmount uint256 1
0 parameters.basicOrderType uint8 5
0 parameters.startTime uint256 1663890438
0 parameters.endTime uint256 1666482438
0 parameters.zoneHash bytes32 0x0000000000000000000000000000000000000000000000000000000000000000
0 parameters.salt uint256 24446860302761739304752683030156737591518664810215442929808392757966642147833
0 parameters.offererConduitKey bytes32 0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000
0 parameters.fulfillerConduitKey bytes32 0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000
0 parameters.totalOriginalAdditionalRecipients uint256 1
0 parameters.additionalRecipients tuple 25000,0x0000a26b00c1F0DF003000390027140000fAa719
0 parameters.signature bytes 0xcb05683e8120b68f003c257c9d105b64b14e081192a101c17b2840a0c50f3f60441421b8c516fdde4743d7583af99f3b409cb05b26fbcc2ebf0541723e8df1be1b

## Pararmetrs erc-721 nft

0 parameters.considerationToken address 0x0000000000000000000000000000000000000000 //ok
0 parameters.considerationIdentifier uint256 0 //ok
0 parameters.considerationAmount uint256 9750000000000 //ok -> consideration[0][startamount]
0 parameters.offerer address 0x8C2055A440a880aE667Aa99a7EE17c90DF1E3BBe // ok -> consideration[0][recipient]
0 parameters.zone address 0x0000000000000000000000000000000000000000 // ok
0 parameters.offerToken address 0xA112C8E2784c10Db5A8aF1b19985ff97E34C1e59 //collection contract
0 parameters.offerIdentifier uint256 14 // tokenID
0 parameters.offerAmount uint256 1 // offer[startAmount]
0 parameters.basicOrderType uint8 0 // 0 -> ETH_TO_ERC721_FULL_OPEN orderType
0 parameters.startTime uint256 1664164499 // startTime
0 parameters.endTime uint256 1666756499 // endtime
0 parameters.zoneHash bytes32 0x0000000000000000000000000000000000000000000000000000000000000000 // zoneHash
0 parameters.salt uint256 24446860302761739304752683030156737591518664810215442929800501151223426166994 // salt
0 parameters.offererConduitKey bytes32 0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000 // conduitKey
0 parameters.fulfillerConduitKey bytes32 0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000 //conduitKey
0 parameters.totalOriginalAdditionalRecipients uint256 1 // len(consideration) - 1
0 parameters.additionalRecipients tuple 250000000000,0x0000a26b00c1F0DF003000390027140000fAa719 // consideration[1]...
0 parameters.signature bytes 0xf2f3ae6cf82aa3a0243a3f38ecf0a8da0621479f4c29cdef972bcd6a9906a2b254c07afc96edc3a4353b7db825e38db3b8dee6c5dbc962aaf69f74b8ea2e04cc1b //signature

## Opensea Seaport API

On goerli we retrieve the info of a listing using:
curl --request GET \
 --url 'https://try.readme.io/https://testnets-api.opensea.io/v2/orders/goerli/seaport/listings?asset_contract_address=0xA112C8E2784c10Db5A8aF1b19985ff97E34C1e59&token_ids=14&limit=1' \
 --header 'accept: application/json'

The reponse is:

{
"next": null,
"previous": null,
"orders": [
{
"created*date": "2022-09-26T03:57:07.654055",
"closing_date": "2022-10-26T03:54:59",
"listing_time": 1664164499,
"expiration_time": 1666756499,
"order_hash": "0x4e167efae087d775b61785eeb2c98aca61443e9ab5221fa20d4fd76fcbf6417a",
"protocol_data": {
"parameters": {
"offerer": "0x8c2055a440a880ae667aa99a7ee17c90df1e3bbe",
"offer": [
{
"itemType": 2,
"token": "0xA112C8E2784c10Db5A8aF1b19985ff97E34C1e59",
"identifierOrCriteria": "14",
"startAmount": "1",
"endAmount": "1"
}
],
"consideration": [
{
"itemType": 0,
"token": "0x0000000000000000000000000000000000000000",
"identifierOrCriteria": "0",
"startAmount": "9750000000000",
"endAmount": "9750000000000",
"recipient": "0x8C2055A440a880aE667Aa99a7EE17c90DF1E3BBe"
},
{
"itemType": 0,
"token": "0x0000000000000000000000000000000000000000",
"identifierOrCriteria": "0",
"startAmount": "250000000000",
"endAmount": "250000000000",
"recipient": "0x0000a26b00c1F0DF003000390027140000fAa719"
}
],
"startTime": "1664164499",
"endTime": "1666756499",
"orderType": 0,
"zone": "0x0000000000000000000000000000000000000000",
"zoneHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
"salt": "0x360c6ebe000000000000000000000000000000000000000001a4dd473831b0d2",
"conduitKey": "0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000",
"totalOriginalConsiderationItems": 2,
"counter": 0
},
"signature": "0xf2f3ae6cf82aa3a0243a3f38ecf0a8da0621479f4c29cdef972bcd6a9906a2b254c07afc96edc3a4353b7db825e38db3b8dee6c5dbc962aaf69f74b8ea2e04cc1b"
},
"protocol_address": "0x00000000006c3852cbef3e08e8df289169ede581",
"maker": {
"user": 227218,
"profile_img_url": "https://storage.googleapis.com/opensea-static/opensea-profile/11.png",
"address": "0x8c2055a440a880ae667aa99a7ee17c90df1e3bbe",
"config": ""
},
"taker": null,
"current_price": "10000000000000",
"maker_fees": [
{
"account": {
"user": null,
"profile_img_url": "https://storage.googleapis.com/opensea-static/opensea-profile/29.png",
"address": "0x0000a26b00c1f0df003000390027140000faa719",
"config": ""
},
"basis_points": "250"
}
],
"taker_fees": [],
"side": "ask",
"order_type": "basic",
"cancelled": false,
"finalized": false,
"marked_invalid": false,
"client_signature": "0xf2f3ae6cf82aa3a0243a3f38ecf0a8da0621479f4c29cdef972bcd6a9906a2b254c07afc96edc3a4353b7db825e38db3b8dee6c5dbc962aaf69f74b8ea2e04cc1b",
"relay_id": "T3JkZXJWMlR5cGU6ODMyNzYx",
"criteria_proof": null,
"maker_asset_bundle": {
"assets": [
{
"id": 128803127,
"num_sales": 0,
"background_color": null,
"image_url": "https://lh3.googleusercontent.com/bX-Opw6YZZ9rLvoEdFmJ6WZ50QdQmpbu7uvKoHSH5cl8sYOTqZPifaQFqoYxk1tMA2OCO5ge1c*-RjWlaXqWAEUXVIlFivfPaDS1",
"image*preview_url": "https://lh3.googleusercontent.com/bX-Opw6YZZ9rLvoEdFmJ6WZ50QdQmpbu7uvKoHSH5cl8sYOTqZPifaQFqoYxk1tMA2OCO5ge1c*-RjWlaXqWAEUXVIlFivfPaDS1=s250",
"image*thumbnail_url": "https://lh3.googleusercontent.com/bX-Opw6YZZ9rLvoEdFmJ6WZ50QdQmpbu7uvKoHSH5cl8sYOTqZPifaQFqoYxk1tMA2OCO5ge1c*-RjWlaXqWAEUXVIlFivfPaDS1=s128",
"image_original_url": "https://opensea-private.mypinata.cloud/ipfs/QmbcWzteFsAvdwiaZyC1YJVNsApDaPRmqkQDyrYAvP4u48",
"animation_url": null,
"animation_original_url": null,
"name": null,
"description": null,
"external_link": null,
"asset_contract": {
"address": "0xa112c8e2784c10db5a8af1b19985ff97e34c1e59",
"asset_contract_type": "non-fungible",
"created_date": "2022-09-22T06:57:39.223145",
"name": "BoredApeYachtClub",
"nft_version": "3.0",
"opensea_version": null,
"owner": 10170571,
"schema_name": "ERC721",
"symbol": "BAYC",
"total_supply": "20",
"description": null,
"external_link": null,
"image_url": null,
"default_to_fiat": false,
"dev_buyer_fee_basis_points": 0,
"dev_seller_fee_basis_points": 0,
"only_proxied_transfers": false,
"opensea_buyer_fee_basis_points": 0,
"opensea_seller_fee_basis_points": 250,
"buyer_fee_basis_points": 0,
"seller_fee_basis_points": 250,
"payout_address": null
},
"permalink": "https://testnets.opensea.io/assets/goerli/0xa112c8e2784c10db5a8af1b19985ff97e34c1e59/14",
"collection": {
"banner_image_url": null,
"chat_url": null,
"created_date": "2022-09-22T06:57:43.209011",
"default_to_fiat": false,
"description": null,
"dev_buyer_fee_basis_points": "0",
"dev_seller_fee_basis_points": "0",
"discord_url": null,
"display_data": {
"card_display_style": "contain",
"images": []
},
"external_url": null,
"featured": false,
"featured_image_url": null,
"hidden": false,
"safelist_request_status": "not_requested",
"image_url": null,
"is_subject_to_whitelist": false,
"large_image_url": null,
"medium_username": null,
"name": "BoredApeYachtClub - 5vWa6Fm2Gd",
"only_proxied_transfers": false,
"opensea_buyer_fee_basis_points": "0",
"opensea_seller_fee_basis_points": "250",
"payout_address": null,
"require_email": false,
"short_description": null,
"slug": "boredapeyachtclub-5vwa6fm2gd",
"telegram_url": null,
"twitter_username": null,
"instagram_username": null,
"wiki_url": null,
"is_nsfw": false,
"fees": {
"seller_fees": {},
"opensea_fees": {
"0x0000a26b00c1f0df003000390027140000faa719": 250
}
},
"is_rarity_enabled": false
},
"decimals": null,
"token_metadata": "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/14",
"is_nsfw": false,
"owner": {
"user": null,
"profile_img_url": "https://storage.googleapis.com/opensea-static/opensea-profile/1.png",
"address": "0x0000000000000000000000000000000000000000",
"config": ""
},
"token_id": "14"
}
],
"maker": null,
"slug": null,
"name": null,
"description": null,
"external_link": null,
"asset_contract": {
"address": "0xa112c8e2784c10db5a8af1b19985ff97e34c1e59",
"asset_contract_type": "non-fungible",
"created_date": "2022-09-22T06:57:39.223145",
"name": "BoredApeYachtClub",
"nft_version": "3.0",
"opensea_version": null,
"owner": 10170571,
"schema_name": "ERC721",
"symbol": "BAYC",
"total_supply": "20",
"description": null,
"external_link": null,
"image_url": null,
"default_to_fiat": false,
"dev_buyer_fee_basis_points": 0,
"dev_seller_fee_basis_points": 0,
"only_proxied_transfers": false,
"opensea_buyer_fee_basis_points": 0,
"opensea_seller_fee_basis_points": 250,
"buyer_fee_basis_points": 0,
"seller_fee_basis_points": 250,
"payout_address": null
},
"permalink": "https://testnets.opensea.io/bundles/None",
"seaport_sell_orders": null
},
"taker_asset_bundle": {
"assets": [
{
"id": 1507176,
"num_sales": 0,
"background_color": null,
"image_url": "https://openseauserdata.com/files/6f8e2979d428180222796ff4a33ab929.svg",
"image_preview_url": "https://openseauserdata.com/files/6f8e2979d428180222796ff4a33ab929.svg",
"image_thumbnail_url": "https://openseauserdata.com/files/6f8e2979d428180222796ff4a33ab929.svg",
"image_original_url": "https://openseauserdata.com/files/6f8e2979d428180222796ff4a33ab929.svg",
"animation_url": null,
"animation_original_url": null,
"name": "Ether",
"description": "",
"external_link": null,
"asset_contract": {
"address": "0x0000000000000000000000000000000000000000",
"asset_contract_type": "fungible",
"created_date": "2021-03-12T15:05:22.062326",
"name": "Ether",
"nft_version": null,
"opensea_version": null,
"owner": null,
"schema_name": "ERC20",
"symbol": "ETH",
"total_supply": null,
"description": null,
"external_link": null,
"image_url": null,
"default_to_fiat": false,
"dev_buyer_fee_basis_points": 0,
"dev_seller_fee_basis_points": 0,
"only_proxied_transfers": false,
"opensea_buyer_fee_basis_points": 0,
"opensea_seller_fee_basis_points": 250,
"buyer_fee_basis_points": 0,
"seller_fee_basis_points": 250,
"payout_address": null
},
"permalink": "https://testnets.opensea.io/assets/goerli/0x0000000000000000000000000000000000000000/0",
"collection": {
"banner_image_url": null,
"chat_url": null,
"created_date": "2022-08-05T17:12:11.501958",
"default_to_fiat": false,
"description": null,
"dev_buyer_fee_basis_points": "0",
"dev_seller_fee_basis_points": "0",
"discord_url": null,
"display_data": {
"card_display_style": "contain",
"images": []
},
"external_url": null,
"featured": false,
"featured_image_url": null,
"hidden": true,
"safelist_request_status": "not_requested",
"image_url": null,
"is_subject_to_whitelist": false,
"large_image_url": null,
"medium_username": null,
"name": "OpenSea PaymentAssets",
"only_proxied_transfers": false,
"opensea_buyer_fee_basis_points": "0",
"opensea_seller_fee_basis_points": "250",
"payout_address": null,
"require_email": false,
"short_description": null,
"slug": "opensea-paymentassets",
"telegram_url": null,
"twitter_username": null,
"instagram_username": null,
"wiki_url": null,
"is_nsfw": false,
"fees": {
"seller_fees": {},
"opensea_fees": {
"0x0000a26b00c1f0df003000390027140000faa719": 250
}
},
"is_rarity_enabled": false
},
"decimals": 18,
"token_metadata": "",
"is_nsfw": false,
"owner": {
"user": null,
"profile_img_url": "https://storage.googleapis.com/opensea-static/opensea-profile/1.png",
"address": "0x0000000000000000000000000000000000000000",
"config": ""
},
"token_id": "0"
}
],
"maker": null,
"slug": null,
"name": null,
"description": null,
"external_link": null,
"asset_contract": {
"address": "0x0000000000000000000000000000000000000000",
"asset_contract_type": "fungible",
"created_date": "2021-03-12T15:05:22.062326",
"name": "Ether",
"nft_version": null,
"opensea_version": null,
"owner": null,
"schema_name": "ERC20",
"symbol": "ETH",
"total_supply": null,
"description": null,
"external_link": null,
"image_url": null,
"default_to_fiat": false,
"dev_buyer_fee_basis_points": 0,
"dev_seller_fee_basis_points": 0,
"only_proxied_transfers": false,
"opensea_buyer_fee_basis_points": 0,
"opensea_seller_fee_basis_points": 250,
"buyer_fee_basis_points": 0,
"seller_fee_basis_points": 250,
"payout_address": null
},
"permalink": "https://testnets.opensea.io/bundles/None",
"seaport_sell_orders": null
}
}
]
}
