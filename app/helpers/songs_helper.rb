module SongsHelper
  def song_favorite_unfavorite_link(song)
    if get_song_favorite(song)
      song_unfavorite_link song, get_song_favorite(song)
    else
      song_favorite_link song
    end
  end

  private
    def song_favorite_link(song)
      link_to(
        'Favorite',
        song_song_favorites_path(song, params: {song_id: song.id}, format: :js),
        method: :post,
        class: 'song-favorite',
        remote: true,
        data: {
          song_id: song.id 
        }
      )
    end 

    def song_unfavorite_link(song, song_favorite)
      link_to(
        'Unfavorite',
        song_song_favorite_path(song, song_favorite, format: :js),
        method: :delete,
        class: 'song-unfavorite',
        remote: true,
        data: {
          confirm: 'Are you sure?',
          song_id: song.id 
        }
      )
    end

    def song_favorite_params(song)
      {song_id: song.id, user_id: current_user.id}
    end

    def get_song_favorite(song)
      SongFavorite.find_by(song_favorite_params(song))
    end
end
