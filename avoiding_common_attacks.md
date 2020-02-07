Smart contract security is a serious issue and it can be very costly if a mistake is made.

Attack #1: Block Gas Limit

The Ethereum network, specifically the EVM, can only process a certain computational load at a time. This restriction is conceptualized in the form of the block gas limit, as discussed in Chapter 1. If you surpass the limit, the transaction fails. This can happen when a function processes a significant number of state changes like when iterating over a large array.

To avoid exceeding the gas limit, break large—or potentially large—operations into batches.

Attack #2: Timestamp Dependence

Because the blockchain is decentralized, it relies on the computational power of distributed nodes (miners) instead of centralized servers to process transactions. The timestamp of the miner can therefore be manipulated by their owners in an attempt to circumvent any logic based on timestamps within a contract.

In order to avoid this vulnerability, make sure your contract does not use timestamps for randomization seeds. It is also a good idea to make sure that your conditional logic can tolerate 15 second variance and still provide the desired behavior. If you are wondering why 15 seconds are required, it is because both Parity and Geth would reject a block that is more than 15 seconds into the future.

Attack #3: Reentrancy

A reentrancy attack occurs when an important state variable is changed after a contract calls a function of another contract or invokes the fallback function of another contract. In these cases, the malicious contract is able to call back into the original contract, invoking the same function again before the state has been updated.

To avoid this attack update the state of your contract before calling a function on any contract you do not own or before sending or transferring to any address that may be added by your users. It is also best to avoid using lower-level functions on addresses like call when dealing with unknown or untrusted addresses.