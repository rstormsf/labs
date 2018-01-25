pragma solidity ^0.4.18;

import './GES_Proxy.sol';
import './GES_UpgradeabilityStorage.sol';

/**
 * @title GES_UpgradeabilityProxy
 * @dev This contract represents a proxy where the implementation address to which it will delegate can be upgraded
 */
contract GES_UpgradeabilityProxy is GES_Proxy, GES_UpgradeabilityStorage {
  /**
  * @dev This event will be emitted every time the implementation gets upgraded
  * @param version representing the version name of the upgraded implementation
  * @param implementation representing the address of the upgraded implementation
  */
  event Upgraded(string version, address indexed implementation);

  /**
  * @dev Upgrades the implementation address
  * @param version representing the version name of the new implementation to be set
  * @param implementation representing the address of the new implementation to be set
  */
  function upgradeTo(string version, address implementation) public {
    require(_implementation != implementation);
    _version = version;
    _implementation = implementation;
    Upgraded(version, implementation);
  }
}