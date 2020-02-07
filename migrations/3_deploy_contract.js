var CrowdFundingWithDeadline = artifacts.require("./CrowdFundingWithDeadline.sol");

module.exports = function(deployer) {
  deployer.deploy(
    CrowdFundingWithDeadline, 
    "Test campaign",
    100,
    6000,
    "0xeC81507ddB1775b0e55a8BA8ebbf0AAe7Ee1Ba89"
  );
};
