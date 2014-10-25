require "rails_helper"

RSpec.describe DailyWorksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/daily_works").to route_to("daily_works#index")
    end

    it "routes to #new" do
      expect(:get => "/daily_works/new").to route_to("daily_works#new")
    end

    it "routes to #show" do
      expect(:get => "/daily_works/1").to route_to("daily_works#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/daily_works/1/edit").to route_to("daily_works#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/daily_works").to route_to("daily_works#create")
    end

    it "routes to #update" do
      expect(:put => "/daily_works/1").to route_to("daily_works#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/daily_works/1").to route_to("daily_works#destroy", :id => "1")
    end

  end
end
