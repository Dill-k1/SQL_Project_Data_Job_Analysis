/*
Question: What are the most optimal skills to learn (high-demand and high-paying)?
- Identify skills in high demand associated with high average salaries for Analyst roles
- Concentrate on postions in South Africa with salries > $60,000.
- Why? Targets skills that offer job security with financial benefits,
    offering a strategic insight for development in an Analyst career.
*/

SELECT
    s.skill_id,
    s.skills AS skill_name,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(j.salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact AS j
INNER JOIN skills_job_dim AS sjd ON j.job_id = sjd.job_id
INNER JOIN skills_dim AS s ON sjd.skill_id = s.skill_id
WHERE
    job_title_short ILIKE '%Analyst%' AND
    job_location ILIKE '%South Africa%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    s.skill_id, s.skills
HAVING
    ROUND(AVG(j.salary_year_avg),0) > 60000
ORDER BY
    demand_count DESC,
    avg_salary DESC
