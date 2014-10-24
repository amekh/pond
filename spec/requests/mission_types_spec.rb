require 'rails_helper'

RSpec.describe "MissionTypes", :type => :request do
  describe "GET /mission_types" do
    it "works! (now write some real specs)" do
      get mission_types_path
      expect(response).to have_http_status(200)
    end
  end
end
