require "bookmark.rb"

describe Bookmark do
  result = [{ "url" => "http://www.google.com" }]
  let(:database_class) { double :database_class, connect: database}
  let(:database) { double :database, exec: result}

  describe ".list" do
    it "give all bookmarks" do
      expect(described_class.list(database_class)).to include "http://www.google.com"
    end
  end
end
