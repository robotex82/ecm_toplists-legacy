class Admin::ChartsController < AdminController
  def list_order_position
    @charts = Charts.find(params[:id])
    
    respond_to do |format|
      if @charts.update_attribute(:list_order_position, params[:list_order_position])
        format.html { redirect_to(rails_admin_list_path(:model_name => Charts), :notice => 'Charts list order position was successfully updated.') }
        format.xml  { render :xml => @charts }
      end  
    end
  end
end
