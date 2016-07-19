#Given(/^there is a candidate$/) do
#  pending # Write code here that turns the phrase above into concrete actions
#end
#
#When(/^I vote for the candidate$/) do
#  pending # Write code here that turns the phrase above into concrete actions
#end

Given(/^I have cleared the queue$/) do
  vote_requester = VoteRequester.new
  vote_requester.resetQueue()
end 

When(/^I count the total votes$/) do
  total_vote_requester = TotalVoteRequester.new
  @total_votes = total_vote_requester.getTotalVotes()
  
  #loop through string
    #extract candidate and count
    #
end

Then(/^I should have "([^"]*)" votes for "([^"]*)"$/) do |num_votes_expected, candidate|
  #expect(@total_votes.size).to eq(1)  
  expect(@total_votes[0].get_num_votes()).to eq(num_votes_expected.to_i)
  expect(@total_votes[0].get_candidate_name()).to eq("#{candidate}")   
end

Then(/^"([^"]*)" should be declared the winner$/) do |candidate|
  #pending # Write code here that turns the phrase above into concrete actions
end
