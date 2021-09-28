// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Election {

  // Model a Candidate
  struct Candidate {
    uint id;             // unsigned integer type
    string name;
    uint voteCount;      //unsigned integer type
  }

  // Read/write Candidates
  mapping(uint => Candidate) public candidates; // store and fetch candidate id-based look up for each candidate

  // Store Candidates Count
  uint public candidatesCount;


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
}
