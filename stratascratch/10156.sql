SELECT airbnb_hosts.nationality, COUNT(airbnb_apartments.apartment_id) AS total FROM airbnb_hosts JOIN airbnb_apartments ON airbnb_hosts.host_id = airbnb_apartments.host_id
WHERE airbnb_hosts.age < 30
GROUP BY airbnb_hosts.nationality
ORDER BY total DESC