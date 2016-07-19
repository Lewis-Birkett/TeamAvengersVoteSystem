require_relative 'valid_vote_requester.rb'

class VoteCounter
	#candidate name, number of votes : cand2, votes2, etc
	def initialize
		@vote_requester = VoteRequester.new
	end

	def count_votes_for_candidates
		all_votes = receive_valid_votes
		candidates = split_votes(all_votes)
		calculate_vote_totals(candidates)
	end
	
	def receive_valid_votes
		@vote_requester.get_votes
	end
	
	def split_votes(votes)
		unique_votes = votes.split(':')
		candidates_selected = []
		unique_votes.each do | votes |
			candidates_selected << votes.split(',')[1]
		end
	end
	
	def calculate_vote_totals(candidates)
		vote_tally = {}
		candidates.each do |candidate|
			vote_tally[candidate] ||= 0
			vote_tally[candidate] += 1
		end
		vote_tally
		
		puts vote_tally.inspect
	end

end