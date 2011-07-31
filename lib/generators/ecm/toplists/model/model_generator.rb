require 'rails/generators/migration'

module Ecm
  module Toplists
    module Generators
      class ModelGenerator < Rails::Generators::NamedBase
        include Rails::Generators::Migration
        
        desc "Generates a toplist model with the given CamelCasedName"
             
        argument :name, :type => :string
        
        source_root File.expand_path('../templates', __FILE__)
        
        def model_name
          name
        end  
        
        def model_filename
          "#{name.underscore}.rb"
        end  
        
        def route_name
          underscored_name.pluralize
        end
        
        def underscored_name
          name.underscore
        end


        def generate_model
          template("model.rb", "app/models/#{model_filename}")
        end          

      end
    end
  end
end

