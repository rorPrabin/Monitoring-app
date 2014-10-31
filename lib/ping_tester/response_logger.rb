require 'net/http'

class ResponseLogger
	attr_accessor :response_body, :response_time

	def initialize(url)
		@url = url
		@response_body = nil
		@response_time = nil
	end

	def log
		begin
		  start_time = Time.now
		  @response_body = Net::HTTP.get_response(URI.parse(@url))
	      @response_time = (Time.now - start_time) * 1000
		  self
		  rescue 
      	    @response_body = :invalid
	        @response_time = nil
	        self
        end
	end
end

# response_logger = ResponseLogger.new
# response_logger.log(URI.parse(@siteurl))

# # Net::HTTP.get_response(URI.parse(@siteurl))