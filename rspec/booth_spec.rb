require_relative '../main/booth.rb'

describe 'the voting booth' do
	context 'when casting a vote' do
		it 'shows you a list of candidates' do
			#arrange
			voting_booth = Booth.new
			expected_candidates = ['Jack', 'Jill']
			#act
			actual_candidates = voting_booth.candidate_list
			#assert
			expect(actual_candidates).to eq(expected_candidates)
		end
		
		it 'asks you to select a candidate' do
		 	#arrange
			voting_booth = Booth.new
			expected_candidate = 'Jack'
			allow_any_instance_of(Kernel).to receive_message_chain("gets.chomp") { 'Jack' }
			
			#act
			voting_booth.display_candidate_list
			selected_candidate = voting_booth.register_selection
			
			#assert
			expect(selected_candidate).to eq(expected_candidate)
		end
		
		it 'records the vote' do
			#arrange
			output_file_location = './recorded_votes/0001_Jill.txt'
			voting_booth = Booth.new
			
			#act
			voting_booth.record_vote('Jill')
			
			#assert
			expect(File.exist?(output_file_location)).to be(true)
		end
	end
end