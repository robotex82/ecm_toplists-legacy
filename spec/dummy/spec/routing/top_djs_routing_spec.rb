require "spec_helper"

describe TopDjsController do
  describe "routing" do
    it "routes to #index" do
      get("/top_djs").should route_to("top_djs#index")
    end
    
    it "routes to #show" do
      get("/top_djs/1").should route_to("top_djs#show", :id => "1")
    end
  end # describe "routing"
end # describe TopDjsController
