require 'sinatra/base'
require_relative "./lib/bookmark.rb"

class BookmarkManager < Sinatra::Base

  get "/" do
    'Bookmark Manager'
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.list
    erb :"bookmarks/index"
  end

  run! if app_file == $0
end
