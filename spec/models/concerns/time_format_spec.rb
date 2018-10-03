require 'rails_helper'

class TestTimeFormat
	extend TimeFormat
end

RSpec.describe TestTimeFormat do
	context ".formated_delta_time" do
		it "returns formated delta time in minutes" do 
			t = Time.now.to_i - ( Time.new.to_i - (30 + 10*60) )

			expect( TestTimeFormat.formated_delta_time(t) ).to eq("10 m")
		end

		it "returns formated delta time in hours" do 
			t = Time.now.to_i - ( Time.new.to_i - (30 + 10*60 + 60*60) )

			expect( TestTimeFormat.formated_delta_time(t) ).to eq("1 h")
		end		

		it "returns formated delta time in days" do 
			t = Time.now.to_i - ( Time.new.to_i - (30 + 10*60 + 60*60*24) )

			expect( TestTimeFormat.formated_delta_time(t) ).to eq("1 d")
		end	

		it "returns formated delta time in weeks" do 
			t = Time.now.to_i - ( Time.new.to_i - (30 + 10*60 + 60*60*24*7) )

			expect( TestTimeFormat.formated_delta_time(t) ).to eq("1 w")
		end	
	end
end