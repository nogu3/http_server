require 'socket'
require 'json'

server = TCPServer.new 8080
loop do
  client = server.accept


  request_line = client.gets()
  method, uri ,http_version = request_line.split(" ")
  p method
  p uri
  p http_version

  headers = {}
  while header = client.gets().chomp
    break if header == ""
    header_name, value = header.split(": ")
    headers[header_name] = value
  end

  p headers

  content_length = headers["Content-Length"].to_i
  body = client.read(content_length)

  p JSON.load(body)

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/plain"
  client.puts
  client.puts '{"jsonrpc": "2.0", "id": 1, result: 2}'
  client.close
end
