require 'test_helper'
require 'rails/performance_test_help'

class HomepageTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }
  # def setup
  # 	# Application requires logged-in user
  # 	login_as(:prabin)
  # end

  test "homepage" do
    get 'check_admin'
  end

  test "creating new post" do
  	post '/post', post: {body: 'Prabin is there.'}
  end
end
