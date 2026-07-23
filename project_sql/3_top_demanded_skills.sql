/*
 Question: What are the most in-demand skills for data analysts?
 - Identify the top 5 in-demand skills for a data anlyst.
 - Focus on all job postings.
 - Why? Retieves the top 5 skills with the higest demand in the job market,
 providing insigts into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sjd ON j.job_id = sjd.job_id
INNER JOIN skills_dim AS s ON sjd.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst' AND job_location ILIKE '%South Africa%'
GROUP BY
skills
ORDER BY
demand_count DESC
LIMIT 5