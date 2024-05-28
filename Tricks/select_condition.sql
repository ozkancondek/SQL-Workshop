--filter can be applied in select

--normal query

SELECT name,surname,job
FROM PERSON
WHERE job = 'developer'
;

--instead

SELECT name,surname, 'developer' as job
FROM PERSON
;

--comes only developers 
