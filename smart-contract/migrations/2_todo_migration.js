const Todo = artifacts.require("Todo");

module.exports = function deployer(deployer) {
  deployer.deploy(Todo);
};
