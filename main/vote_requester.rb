require_relative 'rabbit_plumbing_adapter'

class VoteRequester
  def initialize
    @rabbit_adapter = RabbitPlumbingAdapter.new('amqp://guest:guest@vmlin881:5672')
    @rabbit_adapter.register_topic('team_avenger_votes')
  end

  def getVotes()
    # get votes from booth
    votes = []
    for count in 0..1
      vote = @rabbit_adapter.get_message('team_avenger_votes')
      STDOUT.puts "Got vote:#{votes}"
      if vote != ""
        votes << vote
      end
      sleep(1)
    end
    return votes.join(":")
  end
end
