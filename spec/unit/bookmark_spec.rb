require "bookmark.rb"

describe Bookmark do
  describe ".list" do
    it "give all bookmarks" do
      expect(described_class.list).to include "http://www.google.com"
    end
  end
end
