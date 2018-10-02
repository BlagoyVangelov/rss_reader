class FeedsController < ApplicationController
	before_action :set_feed, only: [:show, :edit, :update, :destroy]

	def index
		@feeds = Reader.all_feed_names(Feed.all)
	end

	def show
		@feed_name = Reader.feed_name(@feed[:url])
	end

	def new
		@feed = Feed.new
	end

	def edit
	end

	def create
		@feed = Feed.new(feed_params)

		if @feed.save
			redirect_to @feed, notice: 'Feed was successfully created.'
		else
			render :new
		end
	end

	def update
		if @feed.update(feed_params)
			redirect_to @feed, notice: 'Feed was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@feed.destroy
		redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_feed
		@feed = Feed.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def feed_params
		params.require(:feed).permit(:url)
	end
end
