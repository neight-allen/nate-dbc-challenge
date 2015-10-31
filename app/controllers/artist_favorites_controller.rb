class ArtistFavoritesController < ApplicationController
  before_action :set_artist

  # POST /artist_favorites
  # POST /artist_favorites.json
  def create
    @artist_favorite = ArtistFavorite.new
    @artist_favorite.artist = @artist
    @artist_favorite.user = current_user

    unless @artist_favorite.save
      render json: @artist_favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artist_favorites/1
  # DELETE /artist_favorites/1.json
  def destroy
    ArtistFavorite.find_by({artist_id: @artist.id, user_id: current_user.id}).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
end
