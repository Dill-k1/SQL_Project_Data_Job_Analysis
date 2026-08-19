/*
 Question: What are the most optimal skills to learn (high-demand and high-paying)?
 - Identify skills in high demand associated with high average salaries for Analyst roles
 - Concentrate on postions in South Africa with salries > $60,000.
 - Why? Targets skills that offer job security with financial benefits,
 offering a strategic insight for development in an Analyst career.
 */
SELECT s.skill_id,
    s.skills AS skill_name,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sjd ON j.job_id = sjd.job_id
    INNER JOIN skills_dim AS s ON sjd.skill_id = s.skill_id
WHERE job_title_short ILIKE '%Analyst%'
    AND job_location ILIKE '%South Africa%'
    AND salary_year_avg IS NOT NULL
GROUP BY s.skill_id,
    s.skills
HAVING ROUND(AVG(j.salary_year_avg), 0) > 60000
ORDER BY demand_count DESC,
    avg_salary DESC
LIMIT 11;
/*
 - SQL is the most important skill for analyst careers in the South African job market, combining
 the highest demand with a strong average salary.
 - Python and Power BI provide the best balance of employability adn earning potential making them
 essential skills for aspiring analysts.
 - Databricks, Spark, AWS, BigQuery, adn PySpark deliver the highest salaryies, highlighting the
 premium placed on cloud and big data expertise by employers.
 - Building a career centred in SQL, Python and Power BI, then adding cloud and big data technologies
 offers the strongest combination of job opportunities and salary growth.
 - This analysis shows that a foundation in analytical skills maximises employment prospects, while
 specialised technologies create pathways to higher-paying and more advanced roles.
 */