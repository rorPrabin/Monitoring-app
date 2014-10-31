require_relative 'response_logger.rb'
class PingTester

  def initialize(siteurl)
    @siteurl = siteurl
  end

  def call_url
    response_logger = ResponseLogger.new(@siteurl)
    response_logger.log
    return response_logger.response_body, response_logger.response_time  
  end

  def track_once
    response, time = call_url
    if response == :invalid
      return "Domain doesn't exist"
    else
      return response.message
    end
  end

end
