// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityRegistry {
    address public admin;
    mapping(address => bool) public verifiedCharities;
    mapping(address => bool) public registeredCharities;

    constructor() {
        admin = msg.sender;
        assert(admin != address(0));
    }

    // Function to register a new charity
    function registerCharity(address charity) public {
        // Revert if the charity is already registered
        if (registeredCharities[charity]) {
            revert("Charity is already registered");
        }
        registeredCharities[charity] = true;
    }

    // Function to verify a registered charity
    function verifyCharity(address charity) public {
        require(msg.sender == admin, "Only admin can verify");
        require(registeredCharities[charity], "Charity not registered");
        verifiedCharities[charity] = true;
    }

    // Check if a charity is verified
    function isVerified(address charity) public view returns (bool) {
        return verifiedCharities[charity];
    }

    // Function to change the admin
    function changeAdmin(address newAdmin) public {
        assert(msg.sender == admin);
        require(newAdmin != address(0), "New admin cannot be zero address");
        admin = newAdmin;
        assert(admin == newAdmin);
    }
}
