require_relative '../reverse.rb'
require 'rack/test'
require 'simplecov'

SimpleCov.start
set :environment, :test

def app
    Sinatra::Application
end

describe 'check port' do
    include Rack::Test::Methods
    it "should report if the localhost port is open" do
        get '/check_ports/ip/localhost/port/4567'
        last_response.body.should == 'The port is open'
    end
end
