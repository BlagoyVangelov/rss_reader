require 'rails_helper'

RSpec.describe FeedsController, type: :controller do
	context 'GET #index' do
		it 'returns a success reposponse' do
			get :index
			expect(response).to be_successful
		end
	end

	context 'GET #show' do
		it 'returns a success response' do
			feed = Feed.create!(url: "http://feeds.bbci.co.uk/news/technology/rss.xml")
			get :show, params: {id: feed.to_param}
			expect(response).to be_successful
		end
	end
end