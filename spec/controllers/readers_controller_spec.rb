require 'rails_helper'

RSpec.describe ReadersController, type: :controller do
	context 'GET #index' do
		it 'returns a success reposponse' do
			get :index
			expect(response).to be_successful
		end
	end

end
