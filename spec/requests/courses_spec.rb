require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/courses/show"
      expect(response).to have_http_status(:success)
    end
  end

end
