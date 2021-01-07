SELECT DISTINCT facebook_posts.post_id, facebook_posts.poster, post_text, post_keywords, post_date 
FROM facebook_reactions JOIN facebook_posts ON (facebook_posts.post_id = facebook_reactions.post_id)
WHERE reaction = 'heart'