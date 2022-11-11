module RubyCoreExtensions
  module String
    module MatchAll
      def match_all(pattern)
        raise ArgumentError, "must pass a Regexp pattern" unless pattern.is_a?(Regexp)

        recursive_match(pattern)
      end

      private

      def recursive_match(pattern, matches = [], prev_match = nil)
        index = prev_match.nil? ? 0 : prev_match.offset(0)[1]

        matching_item = match(pattern, index)
        return matches unless matching_item

        # prevent infinite matches
        return matches if matching_item == prev_match

        matches << matching_item
        recursive_match(pattern, matches, matching_item)
      end
    end
  end
end
