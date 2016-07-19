require_relative 'rabbit_plumbing_adapter'

class TotalVoteRequester
  def initialize
    @rabbit_adapter = RabbitPlumbingAdapter.new('amqp://guest:guest@vmlin881:5672')
    @rabbit_adapter.register_topic('team_avenger_total_votes')
  end

  def getTotalVotes()
    # get validated votes from booth
    votes = []
    
    for count in 0..10      
      vote_string = @rabbit_adapter.get_message('team_avenger_total_votes')      
      ary = vote_string.split(':')
      ary.each do | item |
        s = item.split(',')        
        vote = Vote.new(s[0],s[1].to_i)
        if vote != ""
          votes << vote       
        end                        
      end  
      break if vote_string.length > 0
      sleep(1)
    end
    return votes
  end
end