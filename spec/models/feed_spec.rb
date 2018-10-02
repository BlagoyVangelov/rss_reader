require 'rails_helper'

RSpec.describe Feed, type: :model do
	context 'validation tests' do
		it 'ensures url presence' do
			feed = Feed.new().save
			expect(feed).to eq(false)
		end

		it 'ensures url validation' do
			feed = Feed.new(url: "foo").save
			expect(feed).to eq(false)
		end

		it 'ensure url uniqueness' do
			feed1 = Feed.new(url: "http://feeds.bbci.co.uk/news/technology/rss.xml").save
			feed2 = Feed.new(url: "http://feeds.bbci.co.uk/news/technology/rss.xml").save
			expect(feed2).to eq(false)
		end

		it 'should save successfully' do
		feed = Feed.new(url: "http://feeds.bbci.co.uk/news/technology/rss.xml").save
			expect(feed).to eq(true)
		end
	end
end

