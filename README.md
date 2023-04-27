# Solidity escrow contract example

This is a smart contract written in the Solidity programming language. The purpose of the contract is to act as an escrow service between a payer and a payee, with the help of a third-party mediator. The payer deposits funds into the contract, which are held in escrow until the payee confirms delivery of the goods or services. If the payee does not confirm delivery, the mediator can initiate a refund to the payer.


## How to use
This is a smart contract written in the Solidity programming language. The purpose of the contract is to act as an escrow service between a payer and a payee, with the help of a third-party mediator. The payer deposits funds into the contract, which are held in escrow until the payee confirms delivery of the goods or services. If the payee does not confirm delivery, the mediator can initiate a refund to the payer.


1. To use this contract, you'll need to interact with it using a web3-enabled wallet such as MetaMask. Here are the steps to use the contract:

2. Deploy the contract: You'll need to deploy the contract to the Ethereum network using a tool such as Remix or Truffle. When you deploy the contract, you'll need to specify the addresses of the payer, payee, and mediator, as well as the address of the ERC20 contract for the stablecoin you want to use.

3. Deposit funds: The payer should call the deposit function on the contract and specify the amount of stablecoin they want to deposit. The payer should also transfer the corresponding amount of stablecoin from their wallet to the contract address.

4. Confirm delivery: Once the payee has delivered the goods or services, they should call the confirmDelivery function on the contract. This will release the funds from escrow and transfer them to the payee.

5. Refund: If the payee does not confirm delivery, the mediator can initiate a refund by calling the refund function on the contract. This will transfer the funds from escrow back to the payer.

That's it! This contract provides a secure and transparent way for parties to engage in transactions with the help of a third-party mediator.
