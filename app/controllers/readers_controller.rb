class ReadersController < ApplicationController
	def index
		@posts = Reader.all_feeds_posts(Feed.all)
	end
end