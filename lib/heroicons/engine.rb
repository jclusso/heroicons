module Heroicons
  class Engine < ::Rails::Engine
    isolate_namespace Heroicons
    initializer "heroicons.include_view_helpers" do |app|
      ActiveSupport.on_load :action_view do
        def heroicon(name, variant: Heroicons.configuration.variant, options: {}, path_options: {})
          raw Heroicons::Icon.render(
            name: name,
            variant: variant,
            options: options,
            path_options: path_options
          )
        end
      end
    end
  end
end
