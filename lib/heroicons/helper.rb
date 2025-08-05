module Heroicons
  module Helper
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
