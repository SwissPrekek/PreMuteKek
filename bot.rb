require "discordrb"
require "socket"

bot = Discordrb::Bot.new token: "Njc5Nzc5NjQzNzMzMDQ5NDc1.Xk2VNw.32tD7ghxSF-50AoC29U_jmAqAnA"

Thread.new do
  server = TCPServer.new("192.168.0.99", 2345)

  loop do
    socket = server.accept

    request = socket.gets

    STDERR.puts request

    case request.split(" ")[1]  #splittet in 3 strings. Split bei jedem leerzeichen
    when "/mute"
      bot.server(274249720736514048).member(160844666953138176).server_mute
    when "/unmute"
      bot.server(274249720736514048).member(160844666953138176).server_unmute
    else
      response = "Error: endpoint not found"
    end

    socket.print "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: text/plain\r\n" +
                 "Connection: close\r\n"

    socket.print "\r\n"

    socket.print response

    socket.close
  end
end

bot.run
