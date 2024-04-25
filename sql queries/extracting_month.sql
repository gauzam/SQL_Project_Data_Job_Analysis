SELECT 
    job_title_short AS job_title,
    job_location as location,
    --but this date is with timestamp which we dont need
    --so lets just show the date
    job_posted_date::DATE as date,
    --extracting month out
    EXTRACT (MONTH FROM job_posted_date) as job_month
FROM 
    job_postings_fact
LIMIT 100;