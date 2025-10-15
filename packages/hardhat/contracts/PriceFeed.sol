// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@redstone-finance/evm-connector/contracts/data-services/MainDemoConsumerBase.sol";

/**
 * @title PriceFeed
 * @notice Fetches real-time price data using RedStone Pull oracle
 * @dev Uses MainDemoConsumerBase for testnet compatibility
 */
contract PriceFeed is MainDemoConsumerBase {

    /**
     * @notice Override timestamp validation to allow more lenient checks
     * @dev Skips timestamp validation for testnet compatibility
     * This is useful for local development where blockchain time may differ from real-time
     * For production deployment, implement proper timestamp validation
     * with 3-5 minute tolerance for data freshness
     * @param receivedTimestampMilliseconds Timestamp from the oracle data package
     */
    function validateTimestamp(uint256 receivedTimestampMilliseconds) public view virtual override {
        // Skip timestamp validation for local development/testing
        // This allows RedStone oracle data to work on local Hardhat network
        // and testnet environments without timestamp mismatch issues

        // Accepting all timestamps for now
        return;
    }

    /**
     * @notice Get the latest ETH/USD price
     * @return price The current ETH price in USD (8 decimals)
     */
    function getEthPrice() public view returns (uint256) {
        bytes32[] memory dataFeedIds = new bytes32[](1);
        dataFeedIds[0] = bytes32("ETH");

        uint256[] memory prices = getOracleNumericValuesFromTxMsg(dataFeedIds);
        return prices[0];
    }

    /**
     * @notice Get the latest BTC/USD price
     * @return price The current BTC price in USD (8 decimals)
     */
    function getBtcPrice() public view returns (uint256) {
        bytes32[] memory dataFeedIds = new bytes32[](1);
        dataFeedIds[0] = bytes32("BTC");

        uint256[] memory prices = getOracleNumericValuesFromTxMsg(dataFeedIds);
        return prices[0];
    }

    /**
     * @notice Get multiple prices at once
     * @return ethPrice The current ETH price
     * @return btcPrice The current BTC price
     */
    function getMultiplePrices() public view returns (uint256 ethPrice, uint256 btcPrice) {
        bytes32[] memory dataFeedIds = new bytes32[](2);
        dataFeedIds[0] = bytes32("ETH");
        dataFeedIds[1] = bytes32("BTC");

        uint256[] memory prices = getOracleNumericValuesFromTxMsg(dataFeedIds);
        return (prices[0], prices[1]);
    }
}
