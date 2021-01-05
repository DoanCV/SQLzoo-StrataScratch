SELECT DENSE_RANK() OVER(ORDER BY SUM(n_messages) DESC) AS ranking, id_guest, SUM(n_messages) AS total FROM airbnb_contacts
GROUP BY id_guest
ORDER BY total DESC