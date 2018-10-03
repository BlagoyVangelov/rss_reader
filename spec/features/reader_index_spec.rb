require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "Feed Post" do
	scenario "Redirects to new tab" do
		Feed.create!(url: "http://feeds.bbci.co.uk/news/rss.xml")
		visit readers_index_path

		expect(page).to have_selector(:css, 'a[target="_blank"]')
	end
end