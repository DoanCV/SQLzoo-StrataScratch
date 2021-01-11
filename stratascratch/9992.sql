SELECT artist, COUNT(artist) FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY COUNT(artist) DESC