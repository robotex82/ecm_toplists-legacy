class Ecm::Admin::ToplistsController < Ecm::AdminController
  before_filter :_set_model
  
  unloadable
  
  class_inheritable_accessor :model
  
  def list_order_position
    @object = @_model.find(params[:id])
    
    respond_to do |format|
      if @object.update_attribute(:list_order_position, params[:list_order_position])
        format.html { redirect_to(rails_admin_list_path(:model_name => @_model.class), :notice => '@_model.class.human_name list order position was successfully updated.') }
        # format.xml  { render :xml => @_model.all }
      end  
    end
  end  
  
  protected
    def self.set_model(model)
      self.model = model.to_s.camelize.constantize
    end  
    
    def _set_model
      @_model = self.model
    end  
end  
