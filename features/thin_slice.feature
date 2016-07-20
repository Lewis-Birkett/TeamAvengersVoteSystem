Feature: cast a vote

#Scenario: 1 vote for 1 candidate
#Given there is a candidate
#When I vote for the candidate
#And I count the votes
#Then I should have one vote for the candidate
#And the candidate should be declared the winner
Background: 
Given I have cleared the queue

Scenario: 1 vote for 1 candidate
Given candidate "candidate1" is registered
And voter "voter1" is registered
When "voter1" votes for "candidate1"
And I count the total votes
Then I should have "1" votes for "candidate1"
#And "candidate1" should be declared the winner


Scenario: 5 votes for 1 candidate
Given candidate "candidate1" is registered
And voter "voter1" is registered
And voter "voter2" is registered
And voter "voter3" is registered
And voter "voter4" is registered
And voter "voter5" is registered
When "voter1" votes for "candidate1"
And I count the total votes
Then I should have "1" votes for "candidate1"
And "voter2" votes for "candidate1"
And I count the total votes
Then I should have "2" votes for "candidate1"
And "voter3" votes for "candidate1"
And I count the total votes
Then I should have "3" votes for "candidate1"
And "voter4" votes for "candidate1"
And I count the total votes
Then I should have "4" votes for "candidate1"
And "voter5" votes for "candidate1"
And I count the total votes
Then I should have "5" votes for "candidate1"

