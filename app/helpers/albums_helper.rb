module AlbumsHelper
  def album_favorite_unfavorite_link(album)
    if get_album_favorite(album)
      album_unfavorite_link album, get_album_favorite(album)
    else
      album_favorite_link album
    end
  end

  private
    def album_favorite_link(album)
      link_to(
        'Favorite',
        album_album_favorites_path(album, params: {album_id: album.id}, format: :js),
        method: :post,
        class: 'album-favorite',
        remote: true,
        data: {
          album_id: album.id 
        }
      )
    end 

    def album_unfavorite_link(album, album_favorite)
      link_to(
        'Unfavorite',
        album_album_favorite_path(album, album_favorite, format: :js),
        method: :delete,
        class: 'album-unfavorite',
        remote: true,
        data: {
          confirm: 'Are you sure?',
          album_id: album.id 
        }
      )
    end

    def album_favorite_params(album)
      {album_id: album.id, user_id: current_user.id}
    end

    def get_album_favorite(album)
      AlbumFavorite.find_by(album_favorite_params(album))
    end
end
