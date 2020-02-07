
Auto deprecate pattern

The auto deprecate pattern allows time-based access to certain function calls. In Solidity, using the block.timestamp and now calls, you can get the time of the block when it is mined. Using this time, you can allow or restrict certain function calls in Solidity. There are also some globally available time units present in the Solidity language that you can use. These time units are seconds, minutes, hours, days, weeks, and years. You can use these time units to calculate the Unix epoch time in the past or in the future.





Destroying contracts using the selfdestruct function

selfdestruct(address recipient) is a globally available function. This is used to destroy an already deployed contract instance. Once the contract is destroyed on blockchain, all of its storage is released from blockchain. 

The address argument of the function takes the recipient's address. If any ether balance is present in the contract, all of the ether balance will be sent to the recipient address.

As the selfdestruct function call releases storage from the blockchain, there are some gas refunds, which reduces the gas consumption and eventually leads to lower transaction fees.