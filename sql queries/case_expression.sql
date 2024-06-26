SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' then 'Remote'
        WHEN job_location = 'New York, NY' then 'Local'
        ELSE 'Onsite'
    END as location_category
FROM 
    job_postings_fact
LIMIT 100;

--query2

SELECT
    COUNT(job_id),
    CASE
        WHEN job_location = 'Anywhere' then 'Remote'
        WHEN job_location = 'New York, NY' then 'Local'
        ELSE 'Onsite'
    END as location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

Select DISTINCT job_title_short
from job_postings_fact;

Select DISTINCT (job_title_short)
from job_postings_fact;