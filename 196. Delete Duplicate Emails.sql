DELETE FROM person p 
USING person q 
WHERE p.email = q.email AND p.id > q.id
