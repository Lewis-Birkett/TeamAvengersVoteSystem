require_relative 'valid_vote_requester.rb'
require_relative 'result_submitter.rb'

class VoteCounter
	#candidate name, number of votes : cand2, votes2, etc
	def initialize
		@vote_requester = ValidVoteRequester.new
		@result_submitter = ResultSubmitter.new
		@vote_tally = {}
	end

	def count_votes_for_candidates
		all_votes = receive_valid_votes
		process_votes(all_votes) unless all_votes.empty?
	end
	
	def process_votes(all_votes)
		candidates = split_votes(all_votes)
		candidate_votes = calculate_vote_totals(candidates)
		submit_results(format_results(candidate_votes))
	end
	
	def receive_valid_votes
		@vote_requester.get_votes
	end
	
	def split_votes(votes)
		unique_votes = votes.split(':')
		candidates_selected = []
		unique_votes.each do | votes |
			puts "VOTE:#{votes}"
			candidates_selected << votes.split(',')[1]
			puts "CANDIDATE:#{candidates_selected}"
		end
		candidates_selected
	end
	
	def calculate_vote_totals(candidates)
		candidates.each do |candidate|
			@vote_tally[candidate] ||= 0
			@vote_tally[candidate] += 1
		end
		@vote_tally
	end
	
	def format_results(results)
		result_string = ''
		results.each do | candidate, votes_received |
			result_string += "#{candidate},#{votes_received}:"
		end
		result_string.chomp(':')
	end
	
	def submit_results(results)
		@result_submitter.submit_results(results)
	end
end