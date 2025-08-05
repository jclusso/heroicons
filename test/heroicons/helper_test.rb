require "test_helper"

class Heroicons::HelperTest < ActiveSupport::TestCase
  # Simulate a ViewComponent-like class that includes our helper
  class DummyComponent
    include Heroicons::Helper

    # Provide a minimal implementation of raw method that ViewComponent would have
    def raw(html)
      html
    end
  end

  describe "Heroicons::Helper" do
    it "exists as a module" do
      assert_kind_of Module, Heroicons::Helper
    end

    it "can be included in a class" do
      assert_includes DummyComponent.included_modules, Heroicons::Helper
    end

    it "provides heroicon method when included" do
      component = DummyComponent.new
      assert_respond_to component, :heroicon
    end

    it "heroicon method works when called from included class" do
      component = DummyComponent.new
      result = component.heroicon("user", variant: :outline)

      # The result should be an SVG string
      assert_match(/^<svg/, result.to_s)
    end
  end
end
