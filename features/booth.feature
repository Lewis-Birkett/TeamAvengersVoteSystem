Feature: record vote for a candidate

Scenario: 1 vote for 1 candidate at a booth
Given candidate "candidate1" is registered
And voter "voter1" is registered
When "voter1" votes for "candidate1"
And I request the votes at the booth
Then the booth should report "voter1" voted for "candidate1"
