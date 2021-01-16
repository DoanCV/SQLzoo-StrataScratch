SELECT ((COUNT(CASE WHEN position <= 3 THEN 1 END)::FLOAT)/COUNT(*)::FLOAT) * 100
FROM fb_search_results

/*
SELECT (
        (SELECT COUNT(*) FROM fb_search_results WHERE position <= 3)::float /
        (SELECT COUNT(*) FROM fb_search_results)::float
       ) * 100
*/

/*
SELECT (COUNT(b.result_id)/COUNT(a.result_id)::float) * 100 
FROM fb_search_results a LEFT JOIN (SELECT result_id FROM fb_search_results WHERE position <= 3) AS b ON (b.result_id = a.result_id)
*/