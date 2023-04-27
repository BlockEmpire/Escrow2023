pragma solidity ^0.5.0;

import "./IERC20.sol";

contract Escrow {
    address public agent;
    address public payer;
    address public payee;
    address public mediator;
    mapping(address => uint256) public deposits;

    IERC20 public stablecoin; // add an ERC20 contract variable

    enum State { AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE, REFUNDED }
    State public currentState;

    constructor (address _payer, address _payee, address _mediator, address _stablecoinAddress) public {
        agent = msg.sender;
        payer = _payer;
        payee = _payee;
        mediator = _mediator;
        stablecoin = IERC20(_stablecoinAddress); // initialize the ERC20 contract
        currentState = State.AWAITING_PAYMENT;
    }

    function deposit(uint256 _amount) public {
        require(msg.sender == payer, "Only payer can deposit funds");
        require(currentState == State.AWAITING_PAYMENT, "Cannot deposit funds in current state");
        require(stablecoin.transferFrom(msg.sender, address(this), _amount), "ERC20 transfer failed"); // transfer the stablecoin to the contract
        deposits[payer] = deposits[payer] + _amount;
        currentState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() public {
        require(msg.sender == payee, "Only payee can confirm delivery");
        require(currentState == State.AWAITING_DELIVERY, "Cannot confirm delivery in current state");
        uint256 payment = deposits[payer];
        deposits[payer] = 0;
        require(stablecoin.transfer(payee, payment), "ERC20 transfer failed"); // transfer the stablecoin to the payee
        currentState = State.COMPLETE;
    }

    function refund() public {
        require(msg.sender == mediator, "Only mediator can initiate a refund");
        require(currentState == State.AWAITING_DELIVERY, "Cannot initiate refund in current state");
        uint256 payment = deposits[payer];
        deposits[payer] = 0;
        require(stablecoin.transfer(payer, payment), "ERC20 transfer failed"); // transfer the stablecoin back to the payer
        currentState = State.REFUNDED;
    }
}
