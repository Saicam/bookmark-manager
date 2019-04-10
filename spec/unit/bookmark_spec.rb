require "bookmark.rb"

describe Bookmark do
  # result = [{ "url" => "http://www.google.com" },
  #           { "url" => "http://www.makersacademy.com" },
  #           { "url" => "http://www.destroyallsoftware.com" }
  #         ]
  # let(:database_class) { double :database_class, connect: database}
  # let(:database) { double :database, exec: result}

  describe ".list" do
    it "give all bookmarks" do
      bookmarks = Bookmark.list
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq "1"
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe ".add" do
    it "add the given address to the bookmarks" do
      address = "https://medium.com"
      title = "Medium"
      bookmark = described_class.add(url: address, title: title)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq title
      expect(bookmark.url).to eq address
    end
  end

  describe ".remove" do
    it "remove the given address from the bookmarks" do
      address = "https://medium.com"
      title = "Medium"
      bookmark = described_class.add(url: address, title: title)
      described_class.remove(id: bookmark.id)
      bookmarks = Bookmark.list
      expect(bookmarks).not_to include bookmark
    end
  end
end
