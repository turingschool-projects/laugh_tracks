require "rails_helper"

RSpec.describe ComediansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/comedians").to route_to("comedians#index")
    end

    it "routes to #new" do
      expect(:get => "/comedians/new").to route_to("comedians#new")
    end

    it "routes to #show" do
      expect(:get => "/comedians/1").to route_to("comedians#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comedians/1/edit").to route_to("comedians#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/comedians").to route_to("comedians#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/comedians/1").to route_to("comedians#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/comedians/1").to route_to("comedians#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comedians/1").to route_to("comedians#destroy", :id => "1")
    end
  end
end
