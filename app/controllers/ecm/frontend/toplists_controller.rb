class Ecm::Frontend::ToplistsController < Ecm::FrontendController
  before_filter :_set_model
  
  unloadable
  
  class_inheritable_accessor :model

  def index
    @objects = @_model.all

    respond_to do |format|
      format.html do
        if Ecm::Toplists.config.scoped_views
          render 'index'
        else
          render '/ecm/frontend/toplists/index'
        end
      end 
      format.xml  { render :xml => @objects }
    end
  end
  
  def show
    @object = @_model.find(params[:id])
    
    respond_to do |format|
      format.html do
        if Ecm::Toplists.config.scoped_views
          render 'show'
        else
          render '/ecm/frontend/toplists/show'
        end
      end 
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
