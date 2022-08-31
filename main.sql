/*-- Q1 --*/
CREATE TABLE call_log(
	number_dialled varchar(255),
    date_dialled date,
    time_dialled time,
    result varchar(255),
    user_extension varchar(255)
);
/*-- Q2 --*/
SELECT 
   user_extension, 
   date_dialled, 
   count(*) AS num_dials 
FROM 
   call_log 
GROUP BY 
   user_extension, 
   date_dialled 
ORDER BY 
   user_extension, 
   date_dialled;

/*-- Q3 --*/   
SELECT 
   number_dialled, 
   count(*) AS num_dials 
FROM 
   call_log 
GROUP BY 
   number_dialled 
ORDER BY 
   num_dials DESC;

/*-- Q4 --*/
SELECT 
   number_dialled, 
   count(*) AS num_dials,
   SUM(CASE WHEN result = 'Answered' THEN 1 ELSE 0 END) AS num_answered
FROM 
   call_log 
GROUP BY 
   number_dialled 
ORDER BY 
   num_dials DESC;

/*-- Q5 --*/   
SELECT 
   user_extension, 
   date_dialled, 
   ROUND(100.0 * SUM(CASE WHEN result = 'Answered' THEN 1 ELSE 0 END) / count(*), 1) AS answered_percent
FROM 
   call_log 
GROUP BY 
   user_extension, 
   date_dialled 
ORDER BY 
   answered_percent DESC;

/*-- Q6 --*/   
SELECT 
   number_dialled, 
   count(*) AS num_dials 
FROM 
   call_log 
GROUP BY 
   number_dialled 
ORDER BY 
   num_dials DESC
LIMIT 10;

/*-- Q7 --*/
SELECT 
   user_extension, 
   date_dialled, 
   count(*) AS num_dials 
FROM 
   call_log 
GROUP BY 
   user_extension, 
   date_dialled 
HAVING 
   count(*) < 100 
ORDER BY 
   user_extension, 
   date_dialled;

/*-- Q8 --*/   
SELECT 
   user_extension, 
   date_dialled, 
   MIN(time_dialled) AS start_time, 
   MAX(time_dialled) AS end_time, 
   MAX(time_dialled) - MIN(time_dialled) AS duration 
FROM 
   call_log 
GROUP BY 
   user_extension, 
   date_dialled 
ORDER BY 
   user_extension, 
   date_dialled;

/*
Breakdown Explanation:
Q1.
The table should have the number dialled, with the date and time dialled and the result of the call also as the user's extension who made the call. The result of the call can be one of the following: ['Voicemail', 'Wrong Number', 'Answered'].
Q2.
The query returns the number of dials made by each user per day. The results are sorted by user then by date. This query is useful in order to determine the productivity of each user, as well as to identify any patterns in terms of the numbers dialled.
Q3.
The query returns the number of times each number was dialled. The results are sorted by number in descending order. This query is useful in order to identify the most popular numbers that are being dialled.
Q4.
The query returns all the fields with an additional column indicating the number of times that specific number was dialled to date. This query is useful in order to identify which numbers are being dialled the most frequently.
Q5.
The query calculates the percentage answered per user per day. The results are rounded to 1 decimal place. This query is useful in order to determine the success rate of each user in terms of the calls that are being answered.
Q6.
The query shows the top 10 most dialled numbers ordered in a descending order. This query is useful in order to identify the most popular numbers that are being dialled.
Q7.
The query highlights all the users who have made less than 100 dials in a day. This query is useful in order to identify any users who may be underperforming.
Q8.
The query shows the work duration for each user per day. The duration is calculated as the difference between the time of the first and last dial made by the user in a day. This query is useful in order to determine the work hours of each user

*/




