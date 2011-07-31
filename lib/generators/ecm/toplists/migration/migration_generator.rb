require 'rails/generators/migration'

module Ecm
  module Toplists
    module Generators
      class MigrationGenerator < Rails::Generators::NamedBase
        include Rails::Generators::Migration
        
        desc "Generates a toplist migration file."
             
        argument :name, :type => :string
        
        source_root File.expand_path('../templates', __FILE__)
        
        def migration_name
          "Create#{name.pluralize}"
        end
        
        def migration_filename
          "create_#{name.underscore.pluralize}"
        end
        
        def table_name
          name.underscore.pluralize
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
          migration_template "create_migration.rb", "db/migrate/#{migration_filename}.rb"
        end
        
      end
    end
  end
end

