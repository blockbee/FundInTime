FundInTime is a small DApp that collects funds in need base

Follow the steps in order to run it on your local mechine

Initial setup with Node Packet Manager(NPM):
1. Clone the project into your local mechine
2. move into the project directory which is "FundInTime" - this is the main directory and you dont deed to switch folders for any task, every command works fine from this directory alone
3. run "npm install" to install the nesessary dependencies
4. "npm start" to start the  local server
    - Now you should see the front end Home page on your web browser.
    
    
Setting up local blockchain environment:
1. Install ganache GUI in your local computer.
2. Start ganache by pressing quick start button 
3. now you should see the accounts section with 10 pre funded accounts.


Setting up metamask to sign transactions:
1. Install metamask extention for your web browser
2. Set up the metamask by entering the seed pharse which is available in ganache GUI accounts section and enter password of your own
3. Now Import the pre funded accounts from ganache to metamask by entering the private keys 
4. On top of the metamask extention you will see Network section, go to network to setup custom network
5. In network section at the botton you shell see custom RPC click on it and enter the NETWORK NAME of you choice and NETWORK URL is http://127.0.0.1:7545 which is RPC Server address from ganaache 
6. Save the changes


Compiling and Migrating Smart contracts:
1. Run "truffle compile" to compile contracts
2. Run "truffle migrate" to migrate contracts
3. Note down the contract address which is produced under 3_deploy_contract.js after the compilation
4. Go to the project home page on your web browser enter the contract address
5. Now you shell be taken to campaign page which provides details about the contract and allows user to contibute in ether
6. Enter your contibutions and press the button 
7. Now mwtamask will prompt for your permission/signature to approve transaction
8. Once you conform the transaction it would be recorded into local ganache blockchain network
9. Now the conteract state is updated on campain page

Note: If you see capaign is expired then just restart the ganache server and run "truffle migrate" command

Note: If you see campain is expaired then restart the ganache server and run "truffle migrate" command 

This is as simple as that

Thank you
