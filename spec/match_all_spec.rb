# frozen_string_literal: true

RSpec.describe MatchAll do
  it "has a version number" do
    expect(MatchAll::VERSION).not_to be nil
  end

  describe "#match_all" do
    let(:string) do
      <<~STRING
        The quick brown fox jumped over the lazy dog. What a foxy fox he is!
      STRING
    end

    context "is passed an arg that is not a Regexp pattern" do
      it "raises an ArgumentError" do
        expect { string.match_all("foo") }.to raise_error ArgumentError
      end
    end

    context "there are no matches" do
      it "returns an empty array" do
        expect(string.match_all(/foo/)).to eq []
      end
    end

    context "there is a single match" do
      it "returns an array with one item" do
        matches = string.match_all(/dog/)
        match1 = matches[0]

        expect(matches.length).to eq 1
        expect(match1.offset(0)).to eq [41, 44]
      end
    end

    context "there are multiple matches" do
      it "returns an array containing all matches" do
        matches = string.match_all(/fox/)
        match1 = matches[0]
        match2 = matches[1]
        match3 = matches[2]

        expect(matches.length).to eq 3
        expect(match1.offset(0)).to eq [16, 19]
        expect(match2.offset(0)).to eq [53, 56]
        expect(match3.offset(0)).to eq [58, 61]
      end
    end
  end
end
