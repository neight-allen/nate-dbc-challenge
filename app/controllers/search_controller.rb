class SearchController < ApplicationController
  def index
    @artists = Artist.ransack(name_cont: @q.name_cont).result
    @albums = Album.search(name_cont: @q.name_cont).result
    @songs = Song.search(name_cont: @q.name_cont).result
  end
end
