require_relative "vote_counter.rb"

begin

this_counter = VoteCounter.new

begin
	this_counter.count_votes_for_candidates
end while true
  
rescue Interrupt => _
  exit(true)
end
