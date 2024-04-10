/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_job_ids as (
    SELECT
    jobs.job_id as job_id,
    company.name as company_name,
    job_title,
    salary_year_avg
    FROM
    job_postings_fact jobs
    JOIN company_dim company ON jobs.company_id = company.company_id
    WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home = TRUE
    ORDER BY
    salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_job_ids.*,
    skills_dim.skill_id,
    skills_dim.skills
FROM
    skills_dim 
INNER JOIN skills_job_dim skilljobs ON skills_dim.skill_id = skilljobs.skill_id
INNER JOIN top_job_ids ON skilljobs.job_id = top_job_ids.job_id
ORDER BY top_job_ids.salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
*/