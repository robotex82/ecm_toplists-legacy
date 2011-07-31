require 'rails/generators/migration'

module Ecm
  module Toplists
    module Generators
      class AdminControllerGenerator < Rails::Generators::NamedBase
        desc "Generates the admin controller for the passed CamelCasedname toplist."
             
        argument :name, :type => :string
        
        source_root File.expand_path('../templates', __FILE__)
        
        def model_class_name
          name
        end
        
        def object_name
          name.underscore
        end  
        
        def collection_name
          object_name.pluralize
        end

        def route_name
          name.underscore.pluralize
        end        
        
        def controller_name
          "Admin::#{name.pluralize}Controller"
        end
        
        def controller_filename
          "#{name.pluralize.underscore}_controller.rb"
        end  
        
        def generate_controller
          template "admin_controller.rb", "app/controllers/admin/#{controller_filename}"
        end
        
        def generate_routes
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

