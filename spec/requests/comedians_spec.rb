require 'rails_helper'

RSpec.describe "Comedians", type: :request do
  describe "GET /comedians" do
    it "works! (now write some real specs)" do
      get comedians_path
      expect(response).to have_http_status(200)
    end
  end
end
