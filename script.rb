#!/usr/bin/ruby

require "gmail"

torrentID = ARGV[0]
torrentName = ARGV[1]
torrentPath = ARGV[2]

Gmail.new(ENV['GMAIL_ACC'], ENV['GMAIL_PASS']) do |gmail|

  email = gmail.generate_message do
    to "is.markelov@gmail.com"
    subject "[Deluge-daemon] Finished torrent: #{torrentName}"
    html_part do
      content_type 'text/html; charset=UTF-8'
      body "<h3>#{torrentName}</h3><p>File saved to #{torrentPath}</p><p><i>Sincerely,<br> Your Deluge</i>"
    end
  end

  gmail.deliver(email)
end

