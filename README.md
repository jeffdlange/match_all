# MatchAll

The String class's native `#match` method will only return the first instance of a
pattern match. This gem provides the `#match_all` method, which returns all instances
of a pattern match within a String as an array.

## Installation

Rails:
```
# in your Gemfile
gem "match_all"
```

Otherwise:
```
$ gem install match_all
```

## Usage

#### Given the test string:
```
string = "My cat is asleep on the couch. Now the cat is playing."
```

`#match` only returns the first match:

```
string.match(/cat/)
=> #<MatchData "cat">
```

But `#match_all` finds _all_ of them:

```
string.match_all(/cat/)
=> [
      [0] #<MatchData "cat">,
      [1] #<MatchData "cat">
    ]
```

If the string contains "cat" 50 times, then `#match_all` will return an array with
all 50 of those matches.

Each match is an instance of `MatchData`. This is especially useful if, e.g. you want
to interrogate the matches to find out their starting/ending indexes within the
string, etc.

## Development

This is a very simple gem, with 0 production dependencies (just `rspec` and `pry` as
development/test dependencies for convenience).

## Contributing

The method already does what it's supposed to do, and I don't expect any more
development to be necessary. That being said, issues and PR's are welcome if
anyone notices anything that can be improved or added.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).