require 'socket'
require 'parser'
require 'nginx_parser'

server = TCPServer.open(3000)
loop {
  Thread.start(server.accept) do |client|
    while line = client.gets
      case line.split(" ")[0][1..-1].split("-")[0].to_sym
      when :nginx
        NginxParser.new(line)
      end
    end
  end
}
