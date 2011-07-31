module Ecm
  module Toplists
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Installs ECM Toplists"

#        source_root File.expand_path('../templates', __FILE__)

        def generate_initializer
          initializer("ecm_toplists.rb") do
            "Ecm::Toplists.config do |config|\n  config.scoped_views = false\nend"
          end
        end
      end
    end
  end
end

