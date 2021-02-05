npx truffle migrate --network kovan --reset 

Contract on Kovan: 0x9Ab4A777679e1Ab8302181E26313aE3689F52dc2

npx truffle console --network kovan 

Euro = await Euro.deployed()



var rawTransaction = {"from":myAddress, "gasPrice":web3.utils.toHex(2 * 1e9),"gasLimit":web3.utils.toHex(210000),"to":contractAddress,"value":"0x0","data":contract.methods.transfer(toAddress, amount).encodeABI(),"nonce":web3.utils.toHex(count)} 
var transaction = new Tx(rawTransaction)
transaction.sign(privateKey)

web3.eth.sendSignedTransaction('0x' + transaction.serialize().toString('hex'))
