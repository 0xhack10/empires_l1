import axios from 'axios';

async function getListing() {
    try {
        const {data, status} = await axios.get('https://testnets-api.opensea.io/v2/orders/goerli/seaport/listings?limit=1',
        {headers: {
            "X-API-KEY": ""
        }})
    }
}