require 'rails_helper'

RSpec.describe "DailyWorks", :type => :request do
  describe "GET /daily_works" do
    it "works! (now write some real specs)" do
      get daily_works_path
      expect(response).to have_http_status(200)
    end
  end
end
