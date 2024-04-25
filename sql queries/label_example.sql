SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    'ameer job'
FROM
    job_postings_fact
WHERE
    salary_year_avg > 350000
    AND
    salary_year_avg IS NOT NULL;