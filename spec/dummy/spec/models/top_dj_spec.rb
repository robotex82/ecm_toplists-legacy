require 'spec_helper'

describe TopDj do
  before(:each) do
    TopDj.all.map &:destroy
    @top_dj = Factory(:top_dj)
  end
  
  it "should respond to list_order" do
    @top_dj.should respond_to(:list_order)
  end
  
  it "should respond to list_order_position" do
    @top_dj.should respond_to(:list_order_position)
  end
end
