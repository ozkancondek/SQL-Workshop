
--------------------------------------
--https://pgexercises.com/questions/basic/date.html

 --You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
 SELECT name,membercost
 FROM cd.FACILITIES;
 
 --How can you produce a list of facilities that charge a fee to members?
 
 SELECT *
 FROM FACILITIES
 WHERE MEMBERCOST > 0
 ;
 
 --How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
 --Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
 
 
 
 SELECT FACID, NAME, MEMBERCOST, MONTHLYMAINTENANCE
 FROM FACILITIES
 WHERE MEMBERCOST < MONTHLYMAINTENANCE/50 AND MEMBERCOST > 0
 ;
 
 
--How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT *
FROM FACILITIES
WHERE NAME LIKE '%Tennis%'
;
 
 
 --How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
 
 SELECT *
 FROM FACILITIES
 WHERE FACID IN (1,5)
 ;
 
 
 --How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100?
 -- Return the name and monthly maintenance of the facilities in question.
 
 
 SELECT NAME,
       CASE
           WHEN MONTHLYMAINTENANCE > 100 THEN 'expensive'
           ELSE 'cheap'
       END AS cost
FROM FACILITIES;
 
 
--How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question. 
 
