Feature: cast a vote

Scenario: 1 vote for 1 candidate
Given there is a candidate
When I vote for the candidate
And I count the votes
Then I should have one vote for the candidate
And the candidate should be declared the winner
