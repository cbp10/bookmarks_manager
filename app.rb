require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/' do

    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    url = params[:add_url]
    flash[:notice] = "You must submit a valid URL" unless Bookmark.create(url)
    redirect '/bookmarks' 
  end
end
