# frozen_string_literal: true

require_relative "lib/match_all/version"
require_relative "lib/match_all"

Gem::Specification.new do |spec|
  include MatchAll

  spec.name = "match_all"
  spec.version = MatchAll::VERSION
  spec.authors = ["Jeff Lange"]
  spec.email = ["jeffersonian.lange@gmail.com"]

  spec.summary = "Provides #match_all method to String class"
  spec.description = <<~DESC
    Ruby String's native #match method will only return the first instance of a
    pattern match. This gem provides the #match_all method, returns all instances
    of a pattern match in a String as an array.

    EXAMPLES:
    # Given the test string:
    string = "My cat is asleep on the couch. Now the cat is playing."

    # #match only returns the first match:

    string.match(/cat/)
    => #<MatchData "cat">

    # However, I've found I often want to match _all_ instances of the pattern, and
    # then e.g. iterate through them and do something with them. #match_all does that:

    string.match_all(/cat/)
    => [
         [0] #<MatchData "cat">,
         [1] #<MatchData "cat">
       ]

    This is especially useful if, e.g. you want to interrogate the matches to find
    out their starting/ending indexes within the string, etc
  DESC
  spec.homepage = "https://github.com/jeffdlange/match_all"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/jeffdlange/match_all"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jeffdlange/match_all"
  spec.metadata["changelog_uri"] = "https://github.com/jeffdlange/match_all/blob/main/CHANGELOG.md"

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry", "~> 0.13.1"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
