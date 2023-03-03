// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.9.0;

//group 47 Capstone Project
contract Choppings{
    uint256 public totalSupply = 100000000000000000000000000;
    string public name = 'choppings token';
    string public symbol = 'CSH';
    string public standard = 'CSH v1.0';
    uint8 public decimals = 18;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

 constructor() {

     balanceOf[msg.sender] = totalSupply;

    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        assert(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        // Add spender to the allowed addresses to spend a value
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Checks spender(@var _from) has enough balance
        assert(balanceOf[_from] >= _value && allowance[_from][msg.sender] >= _value);
        // Update balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        // Updates/resets the allowance previously set
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
}
