require "rails_helper"

RSpec.describe MonthlyRecodesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/monthly_recodes").to route_to("monthly_recodes#index")
    end

    it "routes to #new" do
      expect(:get => "/monthly_recodes/new").to route_to("monthly_recodes#new")
    end

    it "routes to #show" do
      expect(:get => "/monthly_recodes/1").to route_to("monthly_recodes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/monthly_recodes/1/edit").to route_to("monthly_recodes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/monthly_recodes").to route_to("monthly_recodes#create")
    end

    it "routes to #update" do
      expect(:put => "/monthly_recodes/1").to route_to("monthly_recodes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/monthly_recodes/1").to route_to("monthly_recodes#destroy", :id => "1")
    end

  end
end
