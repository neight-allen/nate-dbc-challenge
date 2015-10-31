module ArtistsHelper
  def artist_favorite_unfavorite_link(artist)
    if get_artist_favorite(artist)
      artist_unfavorite_link artist, get_artist_favorite(artist)
    else
      artist_favorite_link artist
    end
  end

  private
    def artist_favorite_link(artist)
      link_to(
        'Favorite',
        artist_artist_favorites_path(artist, params: {artist_id: artist.id}, format: :js),
        method: :post,
        class: 'artist-favorite',
        remote: true,
        data: {
          artist_id: artist.id 
        }
      )
    end 

    def artist_unfavorite_link(artist, artist_favorite)
      link_to(
        'Unfavorite',
        artist_artist_favorite_path(artist, artist_favorite, format: :js),
        method: :delete,
        class: 'artist-unfavorite',
        remote: true,
        data: {
          confirm: 'Are you sure?',
          artist_id: artist.id 
        }
      )
    end

    def artist_favorite_params(artist)
      {artist_id: artist.id, user_id: current_user.id}
    end

    def get_artist_favorite(artist)
      ArtistFavorite.find_by(artist_favorite_params(artist))
    end
end
