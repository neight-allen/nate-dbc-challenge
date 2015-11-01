class AlbumOwnershipsController < ApplicationController
  before_action :set_album

  # POST /album_ownerships
  # POST /album_ownerships.json
  def create
    @album_ownership = AlbumOwnership.new
    @album_ownership.album = @album
    @album_ownership.user = current_user

    unless @album_ownership.save
      render json: @album_ownership.errors, status: :unprocessable_entity
    end
  end

  # DELETE /album_ownerships/1
  # DELETE /album_ownerships/1.json
  def destroy
    AlbumOwnership.find_by({album_id: @album.id, user_id: current_user.id}).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:album_id])
    end
end
