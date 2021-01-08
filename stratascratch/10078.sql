SELECT host_id, guest_id
FROM airbnb_hosts JOIN airbnb_guests ON (airbnb_hosts.nationality = airbnb_guests.nationality AND airbnb_hosts.gender = airbnb_guests.gender)