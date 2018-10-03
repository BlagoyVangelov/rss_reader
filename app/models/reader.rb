require 'rss'
require 'open-uri'
require 'open_uri_redirections'

class Reader
	extend TimeFormat
	class << self
		def feed_name(url)
			begin
				rss = rss_feed(url)
				rss.channel.title
			rescue RuntimeError, RSS::NotWellFormedError, OpenURI::HTTPError, RSS::NotAvailableValueError, SocketError => e
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

		def all_feeds_posts feeds
			all_posts = Array.new
			feeds.each do |feed|
				begin
					all_posts.concat feed_posts(feed.url)
				rescue RuntimeError, RSS::NotWellFormedError, OpenURI::HTTPError, RSS::NotAvailableValueError, SocketError => e
					next
				end
			end
			all_posts.sort_by{|h| h[:seconds]}

		end		

		private
		def rss_feed(url)
			open(url, allow_redirections: :safe) do |rss|
				RSS::Parser.parse(rss)
			end
		end

		def feed_posts(url)
			posts = Array.new
			rss = rss_feed(url)

			rss.items.each do |row|
				delta_seconds = delta_time_in_seconds(row.pubDate)
				e = {
					:feed_name=>rss.channel.title.strip,
					:name=>row.title,
					:url=>row.link,
					:seconds=>delta_seconds,
					:period=> formated_delta_time(delta_seconds),
					:feed_url=>url
				}

				posts << e

			end

			return posts
		end
	end

end