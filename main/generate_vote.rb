require_relative 'rabbit_plumbing_adapter'

class VoteGenerator
  def initialize
    @rabbit_adapter = RabbitPlumbingAdapter.new('amqp://guest:guest@vmlin881:5672')
    @rabbit_adapter.register_topic('team_avenger_validated_votes')
  end

  def generateValidatedVote(voter_name, candidate_name)
    # send message to rabbit
    @rabbit_adapter.send_message('team_avenger_validated_votes', voter_name + ',' + candidate_name)
  end
	
	
end