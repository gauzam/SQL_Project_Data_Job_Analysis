--all the companies that have a job that doesnt require a degree using subquery
--inner query gets executed first

SELECT 
    company_id,
    name as company_name
FROM 
    company_dim
WHERE
    company_id IN (
                    SELECT
                        company_id
                    FROM 
                        job_postings_fact
                    WHERE
                        job_no_degree_mention = TRUE
    );

--same query using join

SELECT 
    companies.company_id,
    companies.name as company_name
FROM
    job_postings_fact as jobs
JOIN
    company_dim as companies ON jobs.company_id = companies.company_id
WHERE
    job_no_degree_mention = TRUE
GROUP BY
    companies.company_id
ORDER BY company_id;
