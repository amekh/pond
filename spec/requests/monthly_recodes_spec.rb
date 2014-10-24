require 'rails_helper'

RSpec.describe "MonthlyRecodes", :type => :request do
  describe "GET /monthly_recodes" do
    it "works! (now write some real specs)" do
      get monthly_recodes_path
      expect(response).to have_http_status(200)
    end
  end
end
