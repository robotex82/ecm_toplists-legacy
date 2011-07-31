require 'rails/generators/migration'

module Ecm
  module Toplists
    module Generators
      class ViewsGenerator < Rails::Generators::NamedBase
        desc "Generates views for the passed CamelCasedname toplist."
             
        argument :name, :type => :string, :default => "Toplist"
        
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
        
        def view_path
          File.join "app", "views", name.pluralize.underscore
        end
        
        
        def generate_index_view
          template "index.html.erb", File.join(view_path, "index.html.erb")
        end
        
        def generate_item_partial
          template "_item.html.erb", File.join(view_path, "_item.html.erb")            
        end
        
        def generate_item_list_partial
          template "_list_item.html.erb", File.join(view_path, "_list_item.html.erb")            
        end
        
        def generate_show_view
          template "show.html.erb", File.join(view_path, "show.html.erb")
        end                
      end
    end
  end
end

