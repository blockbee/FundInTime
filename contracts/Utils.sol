//Solidity compiler version
pragma solidity ^0.5.0;

//Writing own library for small tasks named utils
library Utils {

    //Converting the cryptocurrency from eather to Wei units
    function etherToWei(uint sumInEth) public pure returns(uint) {
        return sumInEth * 1 ether;
    }

    //Converting time from minutes to Seconds
    function minutesToSeconds(uint timeInMin) public pure returns(uint) {
        return timeInMin * 1 minutes;
    }
}