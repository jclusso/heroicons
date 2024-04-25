require "test_helper"

class Heroicons::ConfigurationTest < ActiveSupport::TestCase
  it "sets DEFAULT_VARIANT to :solid" do
    assert_equal :solid, Heroicons::Configuration::DEFAULT_VARIANT
  end

  it "sets variant to the DEFAULT_VARIANT" do
    assert_equal :solid, Heroicons::Configuration.new.variant
  end
end
