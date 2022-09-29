import axios from 'axios';

//@notice retrieves the listing of a token id and contract, will return null if no listing
// respecting these criterias
// @param contract: address of the nft contract, e.g. realms contract
// @param tokenId: id of the ERC-721 token
export async function getListingData(contract: string, tokenId: string) {
    try {
        const {data, status} = await axios.get(`https://testnets-api.opensea.io/v2/orders/goerli/seaport/listings?asset_contract_address=${contract}&token_ids=${tokenId}&limit=1`,
        {headers: {
            "accept": "application/json"
        }})

        if (!data["next"]) {
            return {data: null, error: "The specified token Id is not listed on OpenSea"}
        }

        return {data, error: null};
    }
    catch (error) {
        console.error(error)
        return {data: null, error}
    }
}