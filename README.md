# CharityRegistry - Metacrafters Project

## Overview
The `CharityRegistry` is a smart contract built on the Ethereum blockchain that allows the registration and verification of charities. This contract is designed to ensure that only approved charities can participate in specific activities by providing a mechanism for the administrator to register and verify charities.

## License
This project is licensed under the MIT License. See the `SPDX-License-Identifier: MIT` tag in the contract for details.

## Contract Details
### Prerequisites
- Solidity version `^0.8.0` is required to compile this contract.

### Structure
- **Admin**: The address of the account that deploys the contract is set as the administrator. Only this account can verify registered charities and change the admin account.
- **Registered Charities**: A mapping that tracks addresses of charities that have been registered but not necessarily verified.
- **Verified Charities**: A mapping that tracks addresses of charities that have been verified by the administrator.

## Functions

### `registerCharity(address charity)`
Allows a new charity to be registered. Only unregistered charities can be added, and attempting to register an already registered charity will result in an error.

- **Parameters**:
  - `address charity`: The address of the charity to register.
- **Requirements**:
  - Charity must not already be registered.
- **Events**:
  - None.

### `verifyCharity(address charity)`
Allows the administrator to verify a registered charity. Only registered charities can be verified.

- **Parameters**:
  - `address charity`: The address of the charity to verify.
- **Requirements**:
  - Caller must be the admin.
  - Charity must already be registered.
- **Events**:
  - None.

### `isVerified(address charity) public view returns (bool)`
Checks if a specific charity is verified.

- **Parameters**:
  - `address charity`: The address of the charity to check.
- **Returns**:
  - `bool`: Returns `true` if the charity is verified; otherwise, `false`.

### `changeAdmin(address newAdmin)`
Allows the admin to transfer administrative privileges to a new address.

- **Parameters**:
  - `address newAdmin`: The address of the new administrator.
- **Requirements**:
  - Caller must be the current admin.
  - New admin address must not be the zero address.
- **Events**:
  - None.

## Installation

To use the `CharityRegistry` contract:

1. Clone this repository.
2. Open the contract in an IDE (like [Remix](https://remix.ethereum.org/)).
3. Compile using Solidity compiler `^0.8.0`.
4. Deploy to your Ethereum network of choice.

## Usage Example

1. **Register a Charity**: Call `registerCharity` with the charity’s address.
2. **Verify a Charity** (admin only): Call `verifyCharity` with the address of a registered charity.
3. **Check Verification Status**: Use `isVerified` to check if a charity is verified.
4. **Change Admin**: Use `changeAdmin` to assign a new admin.

## Security Considerations
- Only the admin can verify charities and change the admin address.
- Admin changes require the new admin to be a non-zero address to prevent loss of control.

## Future Enhancements
Potential enhancements include:
- Emitting events on charity registration and verification.
- Adding functionality to remove charities or revoke verification.
