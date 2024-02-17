require 'socket'
require 'json'

server = TCPServer.new 8080
loop do
  client = server.accept

  headers = {}
  header = ""
  while data = client.read(1)
    header += data
    break if header == "\r\n"

    if header.end_with?("\r\n")
      header = header.delete("\r\n")
      header_name, value = header.split(" ", 2)
      headers[header_name.delete(":")] = value
      header = ""
    end
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
