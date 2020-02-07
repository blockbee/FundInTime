FundInTime is a small DApp that collects funds in need base

Follow the steps in order to run it on your local mechine

Initial setup with Node Packet Manager(NPM):
1. Clone the project into your local mechine
2. move into the project directory which is "FundInTime" - this is the main directory and you dont deed to switch folders for any task, every command works fine from this directory alone
3. run "npm install" to install the nesessary dependencies
4. "npm start" to start the  local server
    - Now you should see the front end Home page on your web browser

Setting up Blockchain test network - Ganache:


5. Install ganache GUI into your local computer
6. Start ganache server by pressing quick star button


Stting up Metamask for Signing transactions:


7. Now in metamask chose costom network as your test network
	a. Network Name could be any of your choice
	b. New RPC URL should be Ganache RPC Server address which is HTTP://127.0.0.1:7545  - this would be same for every one
    c. import two or three accounts by entering private keys from ganache accounts section

Compiling and Migrating Smart contracts:


8. run truffle compile to compile contracts
9. run truffle migrate to migrating contracts
10. note down the contract address which is under 3_deploy_contract.js
11. Enter the contract address in input field on home page
12. now you are taken to campaign page where you find details about the contract and your contributions are accepted
13. By entering the contributions and pressing the button you will be prompted with metamask to sign transaction
14. Once you sign the transaction and transaction is conformed state is updated in compain page

This is as simple as that

Thank you