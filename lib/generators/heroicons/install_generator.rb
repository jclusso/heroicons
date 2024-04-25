module Heroicons
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(__dir__, "templates")

      def copy_config
        template "heroicons.rb", "config/initializers/heroicons.rb"
      end
    end
  end
end
