require 'spec_helper'

describe Charts do
  before(:each) do
    Charts.all.map &:destroy
    @item = Factory(:charts)
  end
  
  it "should require a name" do
    @item.name = nil
    @item.should_not be_valid
  end
  
  it "should not require a link" do 
    @item.link = nil
    @item.should be_valid
  end
  
  it "should require a valid link if set" do 
    @item.link = "invalid link"
    @item.should_not be_valid
  end  
  
  it "should be valid with a correct link" do 
    @item.link = "http://www.example.com"
    @item.should be_valid
  end    
  
  it "should respond to list_order" do
    @item.should respond_to(:list_order)
  end
  
  it "should respond to list_order_position" do
    @item.should respond_to(:list_order_position)
  end  
end
