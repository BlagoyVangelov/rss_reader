require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "Feed" do
	scenario "Shows the feeds" do
		Feed.create!(url: "http://feeds.bbci.co.uk/news/rss.xml")
		visit feeds_path
		expect(page).to have_content("BBC News - Home")
	end

	scenario "Creates new feed" do
		visit feeds_path

		click_on("New Feed")

		fill_in "feed_url", with: "http://feeds.bbci.co.uk/news/technology/rss.xml"
		click_on("Create Feed")
		expect(page).to have_content("BBC News - Technology")
	end

	scenario "Edit existing feed" do
		Feed.create!(url: "http://feeds.bbci.co.uk/news/rss1.xml")

		visit feeds_path

		click_on("Edit feed")
		fill_in "feed_url", with: "http://feeds.bbci.co.uk/news/rss.xml"
		click_on("Update Feed")
		expect(page).to have_content("Feed was successfully updated.")
	end
end