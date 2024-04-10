
WITH jan_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT 
    job_title_short,
    job_location
FROM 
    jan_jobs
WHERE
    salary_year_avg > 70000;