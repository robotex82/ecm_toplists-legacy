class Ecm::Frontend::ToplistsController < Ecm::FrontendController
  before_filter :_set_model
  
  unloadable
  
  class_inheritable_accessor :model

  def index
    @objects = @_model.all

    respond_to do |format|
      format.html { render '/ecm/frontend/toplists/index' }
      format.xml  { render :xml => @objects }
    end
  end
  
  def show
    @object = @_model.find(params[:id])
    
    respond_to do |format|
      format.html { render 'show' }
      format.xml  { render :xml => @object }
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
