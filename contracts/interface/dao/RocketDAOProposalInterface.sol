pragma solidity 0.6.12;

// SPDX-License-Identifier: GPL-3.0-only

interface RocketDAOProposalInterface {

    // Possible states that a proposal may be in
    enum ProposalState {
        Pending,
        Active,
        Cancelled,
        Defeated,
        Succeeded,
        Queued,
        Expired,
        Executed
    }

    function getTotal() external view returns (uint256);
    function getDAO(uint256 _proposalID) external view returns (string memory);
    function getProposer(uint256 _proposalID) external view returns (address);
    function getStart(uint256 _proposalID) external view returns (uint256);
    function getEnd(uint256 _proposalID) external view returns (uint256);
    function getETA(uint256 _proposalID) external view returns (uint256);
    function getCreated(uint256 _proposalID) external view returns (uint256);
    function getVotesFor(uint256 _proposalID) external view returns (uint256);
    function getVotesAgainst(uint256 _proposalID) external view returns (uint256);
    function getCancelled(uint256 _proposalID) external view returns (bool);
    function getExecuted(uint256 _proposalID) external view returns (bool);
    function getExecutedEnded(uint256 _proposalID) external view returns (bool);
    function getPayload(uint256 _proposalID) external view returns (bytes memory);
    function getReceiptHasVoted(uint256 _proposalID, address _nodeAddress) external view returns (bool);
    function getReceiptSupported(uint256 _proposalID, address _nodeAddress) external view returns (bool);
    function getState(uint256 _proposalID) external view returns (ProposalState);
    function add(string memory _proposalDAO, uint256 _proposalType, string memory _proposalMessage, bytes memory _payload) external returns (bool);
    function vote(uint256 _proposalID, bool _support) external; 
    function cancel(uint256 _proposalID) external;
    function execute(uint256 _proposalID) external;
}
