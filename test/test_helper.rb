require "rails"
require "heroicons"
require "nokogiri"
require "minitest/spec"
require "minitest/reporters"
require "mocha/minitest"

Minitest::Reporters.use! [
  Minitest::Reporters::ProgressReporter.new(color: true)
]

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

module Kernel
  alias_method :context, :describe
end

class ActiveSupport::TestCase
  extend Minitest::Spec::DSL
end
