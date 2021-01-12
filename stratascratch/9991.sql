SELECT trackname, COUNT(position) AS top_rank FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY trackname
ORDER BY top_rank DESC