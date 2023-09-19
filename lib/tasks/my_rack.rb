require 'rack'

app = Proc.new do |env|
  ['200', {'Content-type' => 'text/html'}, ["Hello World"]]
end

Rack::Handler::WEBrick.run(app, Port: 3000, Host: '0.0.0.1')
