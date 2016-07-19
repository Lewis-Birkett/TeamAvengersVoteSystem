# Require configuration
require_relative 'configuration'
require_relative 'rabbit_plumbing_adapter'
require_relative 'lyric_sender'
begin
rabbit_plumbing_adapter=RabbitPlumbingAdapter.new(Configuration.rabbitmq_url)
lyric_sender=LyricSender.new(rabbit_plumbing_adapter)
lyric_sender.send_job
lyric_sender.stop
begin
	sleep(10)
end while true
  
rescue Interrupt => _
  exit(true)
end
