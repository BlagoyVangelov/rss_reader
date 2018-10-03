require 'rails_helper'

RSpec.describe Reader, type: :model do
	context ".all_feed_names" do
		it "parses the feed names" do
			Feed.create!(url: "http://feeds.bbci.co.uk/news/rss.xml")
			allow(Reader).to receive(:feed_name).and_return("BBC News - Home")

			names = Reader.all_feed_names(Feed.all)
			expect(names.first[:name]).to eq("BBC News - Home")
		end

		it "returns empty list if no feeds" do
			expect(Reader.all_feed_names(Feed.all)).to eq([])
		end
	end

	context ".all_feeds_posts" do
		it "orders feed posts by time, newest first" do
			Feed.create!(url: "http://feeds.bbci.co.uk/news/rss.xml")

			allow(Reader).to receive(:feed_posts).and_return([
				{feed_name: "BBC", name: "post1", url: "http://bbc.co.uk/1", seconds: 100000, period: "1 d", feed_url: "http//:feeds.bbci.co.uk/news/technology/rss.xml"},
				{feed_name: "BBC", name: "post2", url: "http://bbc.co.uk/1", seconds: 80000, period: "22 h", feed_url: "http//:feeds.bbci.co.uk/news/technology/rss.xml"},
				{feed_name: "BBC", name: "post3", url: "http://bbc.co.uk/1", seconds: 1000, period: "16 m", feed_url: "http//:feeds.bbci.co.uk/news/technology/rss.xml"},				
				{feed_name: "BBC", name: "post4", url: "http://bbc.co.uk/1", seconds: 10000, period: "2 h", feed_url: "http//:feeds.bbci.co.uk/news/technology/rss.xml"}
				
			])

			expect(Reader.all_feeds_posts(Feed.all).first[:name]).to eq("post3")
		end
	end
end
