require "spec_helper"

describe ChartsController do
  describe "routing" do
    it "routes to #index" do
      get("/charts").should route_to("charts#index")
    end
    
    it "routes to #show" do
      get("/charts/1").should route_to("charts#show", :id => "1")
    end
  end # describe "routing"
end # describe ChartsController
