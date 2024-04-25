--query to get the companies names that posted jobs in Q2 2023 with health insurance

SELECT 
    companies.company_id,
    companies.name as company_name
FROM 
    job_postings_fact jobs
JOIN
    company_dim companies on jobs.company_id = companies.company_id
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023 AND
    EXTRACT(QUARTER FROM job_posted_date) = 2 AND
    job_health_insurance = true
GROUP BY
    companies.company_id;