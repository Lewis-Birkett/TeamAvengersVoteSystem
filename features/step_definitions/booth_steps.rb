Given(/^candidate "([^"]*)" is registered$/) do |candidate_name|
  candidate_register = CandidateRegister.new
  candidate_register.register(candidate_name)  
end

Given(/^voter "([^"]*)" is registered$/) do |voter_name|
  voter_register = VoterRegister.new
  voter_register.register(voter_name)  
end

When(/^"([^"]*)" votes for "([^"]*)"$/) do |voter, candidate|
  vote_generator = VoteGenerator.new
  vote_generator.generateVote(voter, candidate)
end

When(/^I request the votes at the booth$/) do
  vote_requester = VoteRequester.new
  @votes = vote_requester.getVotes()
end

Then(/^the booth should report "([^"]*)" voted for "([^"]*)"$/) do |voter, candidate|  
  expect(@votes).to eq("#{voter},#{candidate}")
end