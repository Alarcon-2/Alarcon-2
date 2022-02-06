// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Bank{

    struct dataBase{
        uint depositAmount;
        address accountNumber;
    }

    dataBase[] public dbArray;

    mapping (address => uint) public ledger;

    function depositMoney() public payable{
        address _just= msg.sender;
        uint depositAmount = msg.value;
        dbArray.push(dataBase(depositAmount, _just));
        ledger[_just] = depositAmount;
    }

    function sendMoney(address payable sendAddress) public payable{
        require (msg.value <= ledger[msg.sender]);
        sendAddress.transfer(msg.value);
    }


}
