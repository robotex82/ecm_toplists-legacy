require "spec_helper"

describe Admin::ChartsController do
  describe "routing" do
    it "routes to #position" do
      put("/admin/charts/1/list_order_position/first").should route_to("admin/charts#list_order_position", :id => "1", :list_order_position => "first")
    end
  end
end
