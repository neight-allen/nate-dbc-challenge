class AlbumFavoritesController < ApplicationController
  before_action :set_album

  # POST /album_favorites
  # POST /album_favorites.json
  def create
    @album_favorite = AlbumFavorite.new
    @album_favorite.album = @album
    @album_favorite.user = current_user

    unless @album_favorite.save
      render json: @album_favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /album_favorites/1
  # DELETE /album_favorites/1.json
  def destroy
    AlbumFavorite.find_by({album_id: @album.id, user_id: current_user.id}).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:album_id])
    end
end
