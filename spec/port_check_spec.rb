require_relative '../port_check.rb'
require 'rack/test'
require 'simplecov'
require 'capybara/rspec'
require 'rspec-mocks'

SimpleCov.start
set :environment, :test
require ::File.expand_path('../../port_check', __FILE__)

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
    Sinatra::Application
end

describe 'check port' do
  is_port_open? = double("is_port_open?")
    it "should report if the localhost port is open" do

        get '/check_ports/ip/localhost/port/4567'
        last_response.body.should == 'The port is open'
    end
end
