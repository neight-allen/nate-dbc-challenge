$('a.song-favorite[data-song-id=<%= @song.id %>]').html('<%= j song_favorite_unfavorite_link(@song) %>')