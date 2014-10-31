require_relative 'ping_tester.rb'

class PingMonitor

  def initialize
    @urls_monitor = Array.new
  end

  def add_url(url)
    @urls_monitor << url
    return self
  end

  def start_monitoring_web
    @responses = Hash.new
    @urls_monitor.each_with_index do |url, index|
      each_url = PingTester.new(url)
      @class = return_class(each_url)
      @responses[url] = each_url.track_once
    end
    @responses
  end

  def return_class(url)
    if url.track_once.to_s == 'OK'
      @class = 'green' 
    else
      @class = 'red'
    end
  end
end


# can add urls to monitor.
# monitors each url
# p = PingMonitor.new(5)
# p.add_url(url1)
# p.add_url(url2)
# p.add_url(url3)
# p.remove_url(url2)
# p.change_interval(10)
# p.start_monitoring
# Ping Test at current time 
# Site 1 : url = aksjdk : status : ok 
# 
# Site 2 : url = sahdjs : status : not ok, sjak returned


# ruby monitor_app.rb
# Please enter urls you want to monitor seperated by spaces and press enter.
# Please enter the interval you would want to set for monitoring and press enter.
# Print in current screen.

