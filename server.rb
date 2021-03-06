require 'websocket-eventmachine-server'
require 'puma'

EM.run do
@clients=[]
  WebSocket::EventMachine::Server.start(:host => "localhost", :port => "2345") do |ws|
    
    
    ws.onopen do
      puts "Client connected"
      
      
    end

    ws.onmessage do |msg, type|
      puts "Received message: #{msg}"
      ws.send msg, :type => type
    end

    ws.onclose do
      puts "Client disconnected"
    end
  end

end