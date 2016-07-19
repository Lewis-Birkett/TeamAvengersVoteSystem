####################
## Configuration  ##
####################

# Configuration, to be more DRY
# add connection urls here
class Configuration
  def self.rabbitmq_url
    command_line_url || default_url
  end

  def self.default_url
    "amqp://guest:guest@vmlin881:15672"
  end
  
  def self.command_line_url
    ARGV[0]
  end
end