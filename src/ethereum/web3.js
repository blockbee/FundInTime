import Web3 from 'web3'

// const provider = ganache.provider();
// const web3 = new Web3(provider);
export const web3 = new Web3(window.web3.currentProvider)

// export const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));