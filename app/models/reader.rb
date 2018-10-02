require 'rss'
require 'open-uri'
require 'open_uri_redirections'

class Reader
	class << self
		def feed_name(url)
			begin
				rss = rss_feed(url)
				rss.channel.title
			rescue RuntimeError, OpenURI::HTTPError, RSS::NotAvailableValueError, SocketError => e
				"Not working"
			end
		end

		def all_feed_names feeds
			names = Array.new
			feeds.each do |feed|
				temp = {
						:id=>feed.id,
						:url=>feed.url,
						:name=>feed_name(feed.url)
						}
				names << temp
			end

			names
		end

		private
		def rss_feed(url)
			open(url, allow_redirections: :safe) do |rss|
				RSS::Parser.parse(rss)
			end
		end

	end

end