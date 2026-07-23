/*
Question: What are the top paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are avaialble remotely.
- Focus on the job postings with specified salaries (nulls omitted).
- Why? Hihglights the top-paying opputunities for Data Analysts, offering insights into employment opportunities.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    c.name AS company_name
FROM
    job_postings_fact AS j
LEFT JOIN company_dim AS c ON j.company_id = c.company_id
WHERE
    job_title_short ILIKE '%Analyst%' AND
    (job_location = 'Anywhere' OR job_location = 'Johannesburg, South Africa') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10