require 'rails_helper'

RSpec.describe "UnitMissions", :type => :request do
  describe "GET /unit_missions" do
    it "works! (now write some real specs)" do
      get unit_missions_path
      expect(response).to have_http_status(200)
    end
  end
end
