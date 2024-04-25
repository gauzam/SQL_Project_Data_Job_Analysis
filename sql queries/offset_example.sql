
SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg
FROM
    job_postings_fact
ORDER BY
    job_id
LIMIT 2 OFFSET 5;