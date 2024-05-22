--SQL Question 6: Average Resolution Time for Tickets

SELECT e.engineer_name, AVG(EXTRACT (EPOCH FROM (t.closed_at - t.raised_at))/3600) AS avg_resolution_time
FROM engineers e
JOIN tickets t ON e.engineer_id = t.engineer_id
GROUP BY e.engineer_name;

--This query first calculates the difference between closed_at and raised_at for each ticket (in hours). 
--It then averages these differences for each engineer.
