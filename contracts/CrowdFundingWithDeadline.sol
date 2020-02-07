//Solidity 0.5.* any miner version compatable
pragma solidity ^0.5.0;

//Using utils library features by importing
import "./Utils.sol";

//Declaring contract named CrowdFundingWithDeadline
contract CrowdFundingWithDeadline {

    //Utils library feature can be used any where in contract
    using Utils for *;

    //Putting the various states in enum data structure for further use
    enum State { Ongoing, Failed, Succeeded, PaidOut }

    //Event for checking status of the campain
    event CampaignFinished(
        address addr,
        uint totalCollected,
        bool succeeded
    );

    //State variables
    string public name;
    uint public targetAmount;
    uint public fundingDeadline;
    address payable public beneficiary;
    address public owner;
    State public state;
    mapping(address => uint) public amounts;
    bool public collected;
    uint public totalCollected;

    //Checking state of the contract before funds transfar
    modifier inState(State expectedState) {
        require(state == expectedState, "Invalid state");
        _;
    }

    //This is for to declare initial values while deploying contract
    constructor(
        string memory contractName,
        uint targetAmountEth,
        uint durationInMin,
        address payable beneficiaryAddress
    )
        public
    {
        name = contractName;
        targetAmount = Utils.etherToWei(targetAmountEth);
        fundingDeadline = currentTime() +
            Utils.minutesToSeconds(durationInMin);
        beneficiary = beneficiaryAddress;
        owner = msg.sender;
        state = State.Ongoing;
    }

    //Allowing users to contibute funds
    function contribute() public payable inState(State.Ongoing) {
        require(beforeDeadline(), "No contributions after a deadline");
        amounts[msg.sender] += msg.value;
        totalCollected += msg.value;

        if (totalCollected >= targetAmount) {
            collected = true;
        }
    }

    //Declaring function for finishing the campain
    function finishCrowdFunding() public inState(State.Ongoing) {
        require(!beforeDeadline(), "Cannot finish campaign before a deadline");

        if (!collected) {
            state = State.Failed;
        } else {
            state = State.Succeeded;
        }

        emit CampaignFinished(address(this), totalCollected, collected);
    }

    //Checking if the collecting reached the target
    function collect() public inState(State.Succeeded) {
        if (beneficiary.send(totalCollected)) {
            state = State.PaidOut;
        } else {
            state = State.Failed;
        }
    }

    //Allowing to withdraw funds
    function withdraw() public inState(State.Failed) {
        require(amounts[msg.sender] > 0, "Nothing was contributed");
        uint contributed = amounts[msg.sender];
        amounts[msg.sender] = 0;

        if (!msg.sender.send(contributed)) {
            amounts[msg.sender] = contributed;
        }
    }

    //Checking whether the contract is under the deadline
    function beforeDeadline() public view returns(bool) {
        return currentTime() < fundingDeadline;
    }

    //Returning current time
    function currentTime() internal view returns(uint) {
        return now;
    }

    //returns total funds collected
    function getTotalCollected() public view returns(uint) {
        return totalCollected;
    }

    //Returns true if still ongoing
    function inProgress() public view returns (bool) {
        return state == State.Ongoing || state == State.Succeeded;
    }

    //Returns true if success
    function isSuccessful() public view returns (bool) {
        return state == State.PaidOut;
    }
}