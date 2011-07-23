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
          "create_#{underscored_name.pluralize}"
        end
        
        def route_name
          underscored_name.pluralize
        end
        
        def underscored_name
          name.underscore
        end

        def generate_model
          # Rails::Generators.invoke("active_record:model", [name, "#{fields} --parent=Ecm::Toplist::Base"])
          options = "--parent=Ecm::Toplist"
          generate("model", name, model_fields, options)
          # gsub_file 'app/models/#{underscored_name}.rb', /ActiveRecord::Base/, 'Ecm::Toplist'
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
          # generate("migration", migration_name, ["list_order:string","name:string","description:text","link:string","preview_image_file_name:string","preview_image_content_type:string"])
          
          migration_template "create_toplists.rb", "db/migrate/#{migration_name}.rb"
        end         
        
        def generate_toplist_controller
          options = "--controller-specs=false --view-specs=false --no-helper"
          generate("controller", controller_name, "", options)
          # template "controller.rb", "app/controllers/#{controller_name}_controller.rb"
        end
        
        def generate_controller_parent
          gsub_file "app/controllers/#{controller_filename}", /ApplicationController/, 'Ecm::Frontend::ToplistsController'
        end
        
        def generate_controller_content
          inject_into_class "app/controllers/#{controller_filename}", "#{controller_name}Controller".constantize do
            "  set_model :#{underscored_name}\n"
          end
        end
        
        def generate_routes
          route "resources :#{route_name}, :only => [:index, :show]"
        end
      end
    end
  end
end

