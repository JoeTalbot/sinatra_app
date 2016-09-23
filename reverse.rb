require 'sinatra'
require 'rack/test'
require 'socket'
require 'timeout'

def is_port_open?(ip, port)
  begin
    Timeout::timeout(1) do
      begin
        s = TCPSocket.new(ip, port)
        s.close
        return true
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
        return false
      end
    end
  rescue Timeout::Error
  end

  return false
end

get '/check_ports/ip/:ip/port/:port' do
    ip = params['ip']
    port = params['port']
    ports = is_port_open? ip, port
    if ports == true
      "The port is open"
    else
      "the port is NOT open"
    end
end
