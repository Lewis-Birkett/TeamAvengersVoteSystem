require_relative 'rabbit_plumbing_adapter'

class ResultSubmitter
	def initialize
    @rabbit_adapter = RabbitPlumbingAdapter.new('amqp://guest:guest@vmlin881:5672')
    @rabbit_adapter.register_topic('team_avenger_total_votes')
  end

  def submit_results(candidate_results)
    # send message to rabbit
		@rabbit_adapter.send_message('team_avenger_total_votes', candidate_results)
  end
end