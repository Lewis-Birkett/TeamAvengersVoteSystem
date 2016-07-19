class Vote
  
  def initialize(candidate_name, number_of_votes)
    @candidate_name = candidate_name
    @number_of_votes = number_of_votes
  end

  def get_num_votes()
    return @number_of_votes
  end 
  
  def get_candidate_name()
    return @candidate_name
  end  
end