class SongFavoritesController < ApplicationController
  before_action :set_song

  # POST /song_favorites
  # POST /song_favorites.json
  def create
    @song_favorite = SongFavorite.new
    @song_favorite.song = @song
    @song_favorite.user = current_user

    unless @song_favorite.save
      render json: @song_favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /song_favorites/1
  # DELETE /song_favorites/1.json
  def destroy
    SongFavorite.find_by({song_id: @song.id, user_id: current_user.id}).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:song_id])
    end
end
