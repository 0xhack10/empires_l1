
// @notice constructs the amount that needs to be paid to the opensea fullfillBasicOrder function
// and the parameters needed for BasicOrderParameters
// @param data: the data retrieved from calling the listing API from Opensea
export function constructAmountAndBasicOrderParameters(data) { 
    const params = data['orders'][0]['protocol_data']['parameters'];

    // constructs the total amount to be paid to the Opensea contract
    let payableAmount = parseInt(params['consideration'][0]['startAmount']);
    // constructs the tuple of additional recipients (except first one which is main recipient)
    const additionalRecipients: string[][] = [];
    for (let i=1; i<params['consideration'].length; i++){
        additionalRecipients.push([params['consideration'][i].startAmount,params['consideration'][i].recipient])
        payableAmount+=parseInt(params['consideration'][i].startAmount)
    }

    const basicOrderParams = {
        considerationToken: "0x0000000000000000000000000000000000000000",
        considerationIdentifier: 0,
        considerationAmount: params['consideration'][0]['startAmount'],
        offerer: params['consideration'][0]['recipient'],
        zone: "0x0000000000000000000000000000000000000000",
        offerToken: params["offer"][0]["token"],
        offerIdentifier: params["offer"][0]['identifierOrCriteria'],
        offerAmount:  params["offer"][0]['startAmount'],
        basicOrderType: params['orderType'],
        startTime: params['startTime'], 
        endTime: params['endTime'],  
        zoneHash: params['zoneHash'], 
        salt: params['salt'],  
        offererConduitKey: params['conduitKey'], 
        fulfillerConduitKey: params['conduitKey'],
        totalOriginalAdditionalRecipients: params['consideration'].length-1,
        additionalRecipients: additionalRecipients,
        signature: data['orders'][0]['protocol_data']['signature']
    }

    return {payableAmount: payableAmount, basicOrderParams: Object.values(basicOrderParams)};
}