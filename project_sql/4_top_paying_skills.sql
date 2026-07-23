/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Analyst postions.
- Focused on the roles with specified salaries only.
Why? It reveals how difficult skills impact salary levels for Analysts and 
    helps identify which skills would be most financially rewarding to learn
    or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary,
    c.name AS company_name,
    j.job_title_short AS job_title
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sjd ON j.job_id = sjd.job_id
INNER JOIN skills_dim AS s ON sjd.skill_id = s.skill_id
INNER JOIN company_dim AS c ON j.company_id = c.company_id
WHERE
    job_title_short ILIKE '%Analyst%' AND
    salary_year_avg IS NOT NULL AND 
    job_location ILIKE '%South Africa%'
GROUP BY
skills, c.name, j.job_title_short
ORDER BY
avg_salary DESC

/*
Here's a breakdown of the results of top paying skills:
- Cloud and big data skills drive the highest salaries. 
Skills such as Spark, AWS, and Databricks are associated with the highest-paying
roles, highlighting strong demand for modern data platform expertise.
- SQL remains the essential core skill.
It is the most frequently requested skill across Data Analyst, Senior Data Analyst, and Business Analyst roles,
making it a foundational requirement for analytics careers.
- Business Intelligence and Python are highly sought after.
Employers consistently seek proficiency in Power BI, Tableau, Looker, and Python,
reflecting the need for strong data visualization and analytical capabilities.
- Senior roles require broader technical expertise.
Higher-level positions increasingly demand experience with technologies such as
Hadoop, Kafka, Spark, Cassandra, and NoSQL, indicating a shift toward
big data and data engineering skills.
- Salary levels vary by industry and employer.
Technology-focused companies generally offer the highest salaries,
while financial services employers show a wider salary range depending on role
seniority and technical skill requirements.
*/
