require 'spec_helper'

module Admin
  describe ChartsController do
    describe "PUT 'list_order_position'" do
      before(:each) do
        Charts.all.map &:destroy
        @charts = Factory(:charts)
      end
      
      it "should assign a charts to @charts" do
        put :list_order_position, :id => @charts, :list_order_position => :first
        assigns(:charts).should eq(@charts)
      end
    end
  end
end  
