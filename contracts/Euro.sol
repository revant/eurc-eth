// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Euro is ERC20Burnable, Ownable {
event Mint(address indexed to, uint256 amount);

    uint public INITIAL_SUPPLY = 1000000000;
    bool public mintingFinished = false;

    modifier canMint() {
        require(!mintingFinished);
        _;
    }

    event MintFinished();

    constructor() ERC20("Euro stable coin", "EURC") public {
        _setupDecimals(6);
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount) public onlyOwner canMint returns (bool) {
        _mint(_to, _amount);
        emit Mint(_to, _amount);
        return true;
    }

    /**
    * @dev Function to stop minting new tokens.
    * @return True if the operation was successful.
    */
    function finishMinting() public onlyOwner returns (bool) {
        mintingFinished = true;
        MintFinished();
        return true;
    }
}
