require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get "/bookmarks" do
    "List of bookmarks:"
  end

  run! if app_file == $0
end
