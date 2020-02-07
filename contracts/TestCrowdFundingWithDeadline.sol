//Solidity compiler version
pragma solidity ^0.5.0;

//Importing crowdFunding solidity file
import "./CrowdFundingWithDeadline.sol";


//Inhereting CrowdFundingWithDeadline for code reusability
contract TestCrowdFundingWithDeadline is CrowdFundingWithDeadline {
    uint time;

    //Initial values that are needed at the time of contract deployement
    constructor(
        string memory contractName,
        uint targetAmountEth,
        uint durationInMin,
        address payable beneficiaryAddress
    )
        CrowdFundingWithDeadline(contractName, targetAmountEth, durationInMin, beneficiaryAddress)
        public
    {

    }

    //Returns the time now
    function currentTime() internal view returns(uint) {
        return time;
    }

    //Setting current time as new time
    function setCurrentTime(uint newTime) public {
        time = newTime;
    }
}