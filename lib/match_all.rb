# frozen_string_literal: true

require_relative "match_all/version"
require_relative "ruby_core_extensions/string/match_all"

module MatchAll
  class Error < StandardError; end

  include RubyCoreExtensions::String::MatchAll
end
