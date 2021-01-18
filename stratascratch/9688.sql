SELECT activity_date, pe_description FROM los_angeles_restaurant_health_inspections
WHERE score < 95 AND facility_name = 'STREET CHURROS'