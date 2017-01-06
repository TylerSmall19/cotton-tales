require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it 'responds successfully with and HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
