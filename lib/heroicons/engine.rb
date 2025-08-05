module Heroicons
  class Engine < ::Rails::Engine
    isolate_namespace Heroicons
    initializer "heroicons.include_view_helpers" do |app|
      ActiveSupport.on_load :action_view do
        include Heroicons::Helper
      end
    end
  end
end
