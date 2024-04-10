--query to get the no of job openings group by job_posted_month

SELECT 
    EXTRACT (MONTH FROM job_posted_date) as job_month,
    COUNT(job_id) as no_of_jobs
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    job_month
ORDER BY 
    no_of_jobs DESC;