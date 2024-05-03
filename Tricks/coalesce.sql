SELECT c.id as client_id, COALESCE(c.email, c.phone) AS contact_method
FROM clients c;

--you now just have one column and you do not need to select both columns individually and compare them.
