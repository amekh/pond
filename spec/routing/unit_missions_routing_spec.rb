require "rails_helper"

RSpec.describe UnitMissionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/unit_missions").to route_to("unit_missions#index")
    end

    it "routes to #new" do
      expect(:get => "/unit_missions/new").to route_to("unit_missions#new")
    end

    it "routes to #show" do
      expect(:get => "/unit_missions/1").to route_to("unit_missions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unit_missions/1/edit").to route_to("unit_missions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/unit_missions").to route_to("unit_missions#create")
    end

    it "routes to #update" do
      expect(:put => "/unit_missions/1").to route_to("unit_missions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unit_missions/1").to route_to("unit_missions#destroy", :id => "1")
    end

  end
end
