# frozen_string_literal: true

require "match_all"
require "pry"
require "ruby_core_extensions/string/match_all"

RSpec.configure do |config|
  # in an application, this will run in an initializer
  String.include RubyCoreExtensions::String::MatchAll

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
