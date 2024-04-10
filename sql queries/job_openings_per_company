-- no of job openings per each company

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) as total_jobs
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name as company_name,
    company_job_count.total_jobs as no_of_jobs
FROM
    company_dim
JOIN
    company_job_count on company_dim.company_id = company_job_count.company_id;


