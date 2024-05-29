--Laptop vs. Mobile Viewership

SELECT COUNT(*) FILTER (WHERE device_type = 'laptop') as laptop_views,
COUNT(*) FILTER (WHERE device_type NOT IN ( 'laptop')) as mobile_views 
FROM viewership;



--or 

SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;
