// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Genestealer Infection Timeline – historical log of Tyranid infiltration events
/// @notice Every interaction records a new infection report with full details.
/// @dev No payable functions, no external calls, no selfdestruct, no owner.
contract GenestealerInfectionTimeline {

    /// @notice Maximum allowed size for each text field (1000 characters).
    uint256 public constant MAX_TEXT_SIZE = 1000;

    /// @notice A single infection report entry.
    struct InfectionReport {
        string sector;          // Sector or location of the sighting
        string sightingType;    // Type of encounter (lurker, brood, cult activity, etc.)
        string threatLevel;     // Threat severity (low, confirmed, critical, planetary)
        address reportedBy;     // User who submitted the report
        uint256 timestamp;      // Block timestamp of the report
    }

    /// @notice Public array storing the entire infection timeline.
    InfectionReport[] public reports;

    /// @notice Emitted whenever a new infection report is added.
    event InfectionReported(
        string sector,
        string sightingType,
        string threatLevel,
        address indexed reportedBy,
        uint256 indexed timestamp
    );

    /// @notice Add a new Genestealer infection report to the timeline.
    function reportInfection(
        string calldata sector,
        string calldata sightingType,
        string calldata threatLevel
    ) external {
        require(bytes(sector).length <= MAX_TEXT_SIZE, "Sector text too large");
        require(bytes(sightingType).length <= MAX_TEXT_SIZE, "Sighting text too large");
        require(bytes(threatLevel).length <= MAX_TEXT_SIZE, "Threat text too large");

        InfectionReport memory entry = InfectionReport({
            sector: sector,
            sightingType: sightingType,
            threatLevel: threatLevel,
            reportedBy: msg.sender,
            timestamp: block.timestamp
        });

        reports.push(entry);

        emit InfectionReported(
            sector,
            sightingType,
            threatLevel,
            msg.sender,
            block.timestamp
        );
    }

    /// @notice Returns the total number of infection reports.
    function totalReports() external view returns (uint256) {
        return reports.length;
    }
}
