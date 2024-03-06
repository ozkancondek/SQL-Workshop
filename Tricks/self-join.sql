--sql self join

--I want to see employees and their mangers name

SELECT p1.name ||  ' ' || p1.surname AS Employee, p2.name ||  ' '|| p2.surname AS Manager
FROM PERSONAL_INFO p1
INNER JOIN PERSONAL_INFO p2 ON p1.MANAGER = p2.PERSONELID
;

SELECT p1.name ||  ' ' || p1.surname AS Employee, p2.name ||  ' '|| p2.surname AS Manager
FROM PERSONAL_INFO p1
LEFT JOIN PERSONAL_INFO p2 ON p1.MANAGER = p2.PERSONELID
;
 