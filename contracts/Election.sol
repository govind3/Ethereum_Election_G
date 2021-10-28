// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Election {

  // Model a Candidate
  struct Candidate {
    uint id;             // unsigned integer type
    string name;
    uint voteCount;      //unsigned integer type
  }

  // Store accounts that have voted
  mapping(address => bool) public voters;

  // Read/write Candidates
  mapping(uint => Candidate) public candidates; // store and fetch candidate id-based look up for each candidate

  // Store Candidates Count
  uint public candidatesCount;

  // Voted event
  event votedEvent (
        uint indexed _candidateId
    );

  // Constructor
  constructor () public {
    // candidate = "Candidate 1"; // state variable
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }
  function addCandidate (string memory _name) private {
        candidatesCount ++;                                // increment the candidate counter
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);  //update the mapping with a new Candidate struct, using the current candidate count as the key
   }

  function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
       emit votedEvent(_candidateId);
    }

}
