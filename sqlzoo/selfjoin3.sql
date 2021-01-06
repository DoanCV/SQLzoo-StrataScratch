SELECT id, name FROM stops JOIN route ON (stops.id = route.stop) 
WHERE num = '4' AND company = 'LRT'