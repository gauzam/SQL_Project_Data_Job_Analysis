--avg salary wrt skills
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 2) as avg_salary,
    COUNT(job_postings_fact.*) as no_of_openings
FROM
    skills_dim
JOIN
    skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
JOIN 
    job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(job_postings_fact.*) > 10
ORDER BY
    avg_salary DESC
LIMIT 20;

-- same query for data analysts:
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 2) as avg_salary,
    COUNT(job_postings_fact.*) as no_of_openings
FROM
    skills_dim
JOIN
    skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
JOIN 
    job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
ORDER BY
    avg_salary DESC
LIMIT 20;

/*
Here are some insights into the trends for the top paying skills for data analysts based on the provided data:

Emerging Technologies: Skills such as solidity, datarobot, mxnet, terraform, and twilio are among the top paying skills, indicating a demand for professionals with expertise in emerging technologies. This suggests that companies are investing in cutting-edge technologies and platforms.

Programming Languages: Several programming languages appear in the top paying skills list, including golang, perl, and python frameworks such as keras and pytorch. This highlights the importance of programming proficiency for data analysts, particularly in languages commonly used for data analysis and machine learning.

DevOps and Infrastructure Automation: Skills like terraform, ansible, gitlab, and puppet are related to DevOps practices and infrastructure automation. This suggests a growing demand for data analysts who can work with infrastructure as code and automate deployment processes.

Machine Learning and AI Frameworks: Frameworks such as mxnet, keras, pytorch, and tensorflow are among the top paying skills, indicating a significant demand for expertise in machine learning and artificial intelligence. This aligns with the increasing adoption of machine learning technologies across various industries.

Big Data Technologies: Technologies like kafka, cassandra, and couchbase are related to big data processing and storage. The inclusion of these skills suggests a need for data analysts who can work with large volumes of data and distributed systems.

Containerization and Virtualization: Skills like vmware and docker are related to containerization and virtualization technologies. This indicates a demand for data analysts who can work with containerized environments and manage virtualized infrastructure.
[
  {
    "skill_id": 224,
    "skills": "svn",
    "avg_salary": "400000.00",
    "no_of_openings": "1"
  },
  {
    "skill_id": 38,
    "skills": "solidity",
    "avg_salary": "179000.00",
    "no_of_openings": "1"
  },
  {
    "skill_id": 65,
    "skills": "couchbase",
    "avg_salary": "160515.00",
    "no_of_openings": "1"
  },
  {
    "skill_id": 206,
    "skills": "datarobot",
    "avg_salary": "155485.50",
    "no_of_openings": "1"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "avg_salary": "155000.00",
    "no_of_openings": "2"
  },
  {
    "skill_id": 109,
    "skills": "mxnet",
    "avg_salary": "149000.00",
    "no_of_openings": "2"
  },
  {
    "skill_id": 119,
    "skills": "dplyr",
    "avg_salary": "147633.33",
    "no_of_openings": "3"
  },
  {
    "skill_id": 73,
    "skills": "vmware",
    "avg_salary": "147500.00",
    "no_of_openings": "1"
  },
  {
    "skill_id": 212,
    "skills": "terraform",
    "avg_salary": "146733.83",
    "no_of_openings": "3"
  },
  {
    "skill_id": 250,
    "skills": "twilio",
    "avg_salary": "138500.00",
    "no_of_openings": "2"
  },
  {
    "skill_id": 220,
    "skills": "gitlab",
    "avg_salary": "134126.00",
    "no_of_openings": "7"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "avg_salary": "129999.16",
    "no_of_openings": "40"
  },
  {
    "skill_id": 222,
    "skills": "puppet",
    "avg_salary": "129820.00",
    "no_of_openings": "2"
  },
  {
    "skill_id": 100,
    "skills": "keras",
    "avg_salary": "127013.33",
    "no_of_openings": "3"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "avg_salary": "125226.20",
    "no_of_openings": "20"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "avg_salary": "124685.75",
    "no_of_openings": "20"
  },
  {
    "skill_id": 223,
    "skills": "ansible",
    "avg_salary": "124370.00",
    "no_of_openings": "2"
  },
  {
    "skill_id": 121,
    "skills": "hugging face",
    "avg_salary": "123950.00",
    "no_of_openings": "2"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "avg_salary": "120646.83",
    "no_of_openings": "24"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "avg_salary": "118406.68",
    "no_of_openings": "11"
  }
]