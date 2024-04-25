require "test_helper"

module Heroicons
  class Test < ActiveSupport::TestCase
    it "is a module" do
      assert_kind_of Module, Heroicons
    end

    it "has a version" do
      assert_kind_of String, Heroicons::VERSION
    end

    it "isolates namespace for engine" do
      assert_equal "heroicons", Heroicons::Engine.engine_name
    end

    it "sets #root to the current directory" do
      assert_equal Pathname.new(Dir.pwd).to_s, Heroicons.root
    end
  end
end
