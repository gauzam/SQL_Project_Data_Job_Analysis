SELECT 
    company_dim.name as company_name,
    company_job_count.total_jobs as no_of_jobs
FROM
    company_dim
JOIN
    company_job_count on company_dim.company_id = company_job_count.company_id;


SELECT 
    skills
FROM 
    skills_dim
WHERE
    skill_id IN (
        SELECT
    skill_id
FROM 
    skills_job_dim
GROUP BY 
    skill_id
ORDER BY 
    count(*) DESC
LIMIT 5
    );


SELECT * from job_postings_fact Limit 10;
select * from skills_dim limit 10;
select * from skills_job_dim limit 10;

SELECT
    s.skill_id as skill_id,
    s.skills as skill_name,
    COUNT(job.job_id) as no_of_remote_openings
FROM
    skills_dim s
JOIN skills_job_dim sj ON s.skill_id = sj.skill_id
JOIN job_postings_fact job ON sj.job_id = job.job_id
WHERE job.job_work_from_home = TRUE
GROUP BY
    s.skill_id
ORDER BY
    no_of_remote_openings DESC
LIMIT 5;

--using CTE

WITH remote_job_skills AS (
    SELECT 
        sj.skill_id,
        COUNT(*) as no_of_openings
    FROM skills_job_dim sj
    JOIN job_postings_fact job ON sj.job_id = job.job_id
    WHERE job.job_work_from_home = TRUE
    GROUP BY
        sj.skill_id
)

SELECT 
    skills_dim.skill_id as id,
    skills_dim.skills as skillName,
    remote_job_skills.no_of_openings
FROM skills_dim
JOIN remote_job_skills ON skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY remote_job_skills.no_of_openings DESC
LIMIT 5;

SELECT * from job_postings_fact Limit 10;

SELECT
    job_id,
    job_title_short,
    job_location,
    job_posted_date,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_posted_date::DATE BETWEEN '2023-01-01' AND '2023-03-31'
    AND
    salary_year_avg > 70000;


select 
    job_title_short,
    job_location
from
    january_jobs

UNION ALL

select 
    job_title_short,
    job_location
from
    february_jobs
