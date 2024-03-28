-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE

SELECT p.ID,p.NAME,MAX(a.ADDRESS)
FROM PEOPLE p
JOIN 
(SELECT id, MAX(address) as address 
FROM ADDRESS_2
GROUP BY id)  AS a
ON a.ID  = p.ID
GROUP BY p.ID,a.ADDRESS
;
 
