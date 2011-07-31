require 'rails/generators/migration'

module Ecm
  module Toplists
    module Generators
      class ControllerGenerator < Rails::Generators::NamedBase
        desc "Generates the controller for the passed CamelCasedname toplist."
             
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
          "#{name.pluralize}Controller"
        end
        
        def controller_filename
          "#{name.pluralize.underscore}_controller.rb"
        end  
        
        def generate_controller
          template "controller.rb", "app/controllers/#{controller_filename}"
        end
        
        def generate_routes
          route "resources :#{route_name}, :only => [:index, :show]"
        end
      end
    end
  end
end

