require_relative "booth"

begin

this_booth = Booth.new

begin
	this_booth.receive_vote
end while true
  
rescue Interrupt => _
  exit(true)
end
