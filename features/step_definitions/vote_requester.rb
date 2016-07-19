require_relative 'rabbit_plumbing_adapter'

class VoteRequester
  def initialize
    @rabbit_adapter = RabbitPlumbingAdapter.new('amqp://guest:guest@vmlin881:5672')
    @rabbit_adapter.register_topic('team_avenger_validated_votes')
  end

  def getVotes()
    # get validated votes from booth
    votes = []
    for count in 0..10
      vote = @rabbit_adapter.get_message('team_avenger_validated_votes')
      STDOUT.puts "Got validated vote:#{votes}"
      if vote != ""
        votes << vote
      end
      sleep(1)
    end
    return votes.join(":")
  end
end