--query to get the no of job openings wrt NY time posted in 2023 grouped in months

SELECT 
    COUNT(job_id) as no_of_job_openings,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT') as NY_timezone_month
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT') = 2023
GROUP BY 
    NY_timezone_month
ORDER BY 
    NY_timezone_month;