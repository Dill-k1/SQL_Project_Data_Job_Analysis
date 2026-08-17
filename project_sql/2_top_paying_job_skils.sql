/*
 Question: What skills are requred for the top-paying data anlyst jobs?
 - Use the top 10 highest-paying Analyst Jobs from the first query.
 - And the specific skills required for these roles.
 - Why? It provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand whihc skills to develop that align with top salaries.
 */
WITH top_paying_jobs AS (
    SELECT job_id,
        name AS company_name,
        job_title,
        job_location,
        salary_year_avg
    FROM job_postings_fact AS j
        LEFT JOIN company_dim AS c ON j.company_id = c.company_id
    WHERE job_title_short ILIKE '%Analyst%'
        AND job_location ILIKE '%South Africa%'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT tpj.*,
    skills
FROM top_paying_jobs AS tpj
    INNER JOIN skills_job_dim AS sjd ON tpj.job_id = sjd.job_id
    INNER JOIN skills_dim AS s ON sjd.skill_id = s.skill_id
ORDER BY salary_year_avg DESC;
/*
 - SQL, Python, and Tableau are the three most sought-after skills, each showing up in around 83%
 of the highest job postings.
 - Excel remains relavant, appearing in 50% of the roles despite emphasis placed on modern
 analystics platforms.
 - Could and Big Data technologies such as Azure, AWS, Databricks, PySpark, and Snowflake appear
 in high-paying positions, indicating growing demand for scalable data processing skills.
 - The results suggest employers are seeking analysts who can work across the entire analytical lifecycle
 from querying and processing data to visualisation and communicating insights. These skills
 collectively posisition candidates for senior and leadership-level analytics roles.
 */