require 'sinatra/base'
require_relative "./lib/bookmark.rb"

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get "/" do
    'Bookmark Manager'
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.list
    erb :"bookmarks/index"
  end

  get "/bookmarks/add" do
    erb :"bookmarks/add"
  end

  post "/bookmarks/add" do
    Bookmark.add(url: params[:bookmark_url], title: params[:bookmark_title])
    redirect("/bookmarks")
  end

  delete "/bookmarks/:id" do
    Bookmark.remove(id: params[:id])
    redirect("/bookmarks")
  end

  run! if app_file == $0
end
