require 'rails/generators/migration'

module Ecm
  module Toplists
    module Generators
      class InstallGenerator < Rails::Generators::NamedBase
        include Rails::Generators::Migration
        
        desc "Generates a toplist model with the given CamelCasedName (if one does not exist) " <<
             "plus a migration file."
             
        argument :name, :type => :string, :default => "Toplist"
        
        source_root File.expand_path('../templates', __FILE__)
        
        def model_fields
          fields = %q(list_order:string name:string description:text link:string)
          fields <<%q( preview_image_file_name:string preview_image_content_type:string preview_image_file_size:integer preview_image_updated_at:datetime)
          fields <<%q( main_image_file_name:string main_image_content_type:string main_image_file_size:integer main_image_updated_at:datetime)
          fields.split(" ")
          # fields
        end
  
        def controller_name
          name.pluralize
        end
        
        def controller_filename
          "#{name.underscore.pluralize}_controller.rb"
        end
        
        def migration_name
          "Create#{name.pluralize}"
        end
        
        def migration_filename
          "create_#{underscored_name.pluralize}"
        end
        
        def model_name
          name
        end  
        
        def model_filename
          "#{name.underscore}.rb"
        end  
        
        def object_name
          name.underscore
        end
        
        def route_name
          underscored_name.pluralize
        end
        
        def underscored_name
          name.underscore
        end
        
        def generate_initializer
          initializer("ecm_toplists.rb") do
            "Ecm::Toplists.config do |config|\n  config.scoped_views = false\nend"
          end
        end

        def generate_model
          # Rails::Generators.invoke("active_record:model", [name, "#{fields} --parent=Ecm::Toplist::Base"])
          options = "--parent=Ecm::Toplist"
          generate("model", model_name, model_fields, options)
        end   
        
        def generate_model_content
          inject_into_class "app/models/#{model_filename}", model_name.constantize do
            "  include RankedModel\n  ranks :list_order\n  default_scope :order => 'list_order ASC'\n"
          end
        end
        
        def self.next_migration_number(path)
          unless @prev_migration_nr
            @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          else
            @prev_migration_nr += 1
          end
          @prev_migration_nr.to_s
        end
        
        def generate_migration
          migration_template "create_toplists.rb", "db/migrate/#{migration_filename}.rb"
        end         
        
        def generate_toplist_controller
          options = "--controller-specs=false --view-specs=false --no-helper"
          generate("controller", controller_name, "", options)
        end
        
        def generate_controller_parent
          gsub_file "app/controllers/#{controller_filename}", /ApplicationController/, 'Ecm::Frontend::ToplistsController'
        end
        
        def generate_controller_content
          inject_into_class "app/controllers/#{controller_filename}", "#{controller_name}Controller".constantize do
            "  set_model :#{underscored_name}\n"
          end
        end
        
        def generate_admin_toplist_controller
          if AdminController
            options = "--controller-specs=false --view-specs=false --no-helper"
            generate("controller", "admin/#{controller_name}", "", options)
          end
        end
        
        def generate_admin_controller_parent
          if AdminController
            gsub_file "app/controllers/admin/#{controller_filename}", /ApplicationController/, 'AdminController'
          end  
        end
        
        def generate_admin_controller_content
          if AdminController
            inject_into_class "app/controllers/admin/#{controller_filename}", "Admin::#{controller_name}Controller".constantize do
<<-eos
  def list_order_position
    @#{object_name} = #{name}.find(params[:id])
    
    respond_to do |format|
      if @#{object_name}.update_attribute(:list_order_position, params[:list_order_position])
        format.html { redirect_to(rails_admin_list_path(:model_name => #{name}), :notice => '#{name} list order position was successfully updated.') }
        format.xml  { render :xml => @#{object_name.pluralize} }
      end  
    end
  end
eos
            end # inject_into_class
          end
        end # def generate_admin_controller_content      
        
        def generate_routes
          route "resources :#{route_name}, :only => [:index, :show]"
        end
        
        def generate_admin_routes
          if AdminController
            # route "resources :#{route_name}, :only => [:index, :show] do\n    member do\n      put 'position/:list_order_position', :action => 'position', :as => 'position'\n    end\n  end"          
            route "
  namespace :admin do
    resources :#{route_name}, :only => [] do  
      member do      
        put 'list_order_position/:list_order_position', :action => 'list_order_position', :as => 'list_order_position'
      end
    end            
  end            
"
          end  
        end
      end
    end
  end
end

