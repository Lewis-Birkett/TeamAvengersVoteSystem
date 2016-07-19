require_relative "vote_requester.rb"
require_relative "generate_vote.rb"

class Booth
	def initialize
		@candidates = ['Jack', 'Jill']
		@filepath = './recorded_votes'
		@internal_counter = 1
		@vote_requester = VoteRequester.new
		@vote_generator = VoteGenerator.new
	end
	
	def candidate_list
		@candidates
	end
	
	def display_candidate_list
		puts "Here is the list of candidates"
		@candidates.each {|candidate| puts candidate}
		puts "Please choose one"
	end
	
	def receive_vote
		votes = @vote_requester.getVotes
		voter_candidate_pair_array = votes.split(':')
		
		voter_candidate_pair_array.each do |pair| 
			pair_array = pair.split(',')
			if(check_voter(pair_array[0]))
				if(check_candidate(pair_array[1]))
					record_vote_and_push(pair_array[0],pair_array[1])
				else
					puts 'candidate invalid'
				end
			else
				puts 'voter invalid'
			end
		end
	end
	
	def check_voter(voter)
		true
	end
	
	def check_candidate(candidate)
		true
	end
	
	def record_vote_and_push(voter,candidate)
		@vote_generator.generateValidatedVote(voter,candidate)
		absolute_path = File.absolute_path(@filepath)
		puts absolute_path
		# File.new("#{absolute_path}/#{@internal_counter.to_s.rjust(4,'0')}_#{candidate}.txt", File::CREAT)
		@internal_counter += 1
	end
	
	
end