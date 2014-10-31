require 'test_helper'
require 'rails/performance_test_help'

class PostpageTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  test "homepage" do
    get '/'
  end

  test "Creating new project" do
    post '/projects', project: { name: "My new Project", url: "http://newproject.com"} 
  end

  test "Creare new user" do
    post '/users', user: { email: "abc@abc.come", password: "password" }
  end
end
