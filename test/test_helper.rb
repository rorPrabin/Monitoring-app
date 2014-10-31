ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
# # Re-establish db connection for 'performance' mode
# silence_warnings { RAILS_ENV = "performance" }
# ActiveRecord::Base.establish_connection
# # STOP : HAX HAX HAX

# require_dependency 'application'

# require 'test/unit'
# require 'active_support/test_case'
# require 'action_controller/test_case'
# require 'action_controller/integration'

# require 'performance_test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end