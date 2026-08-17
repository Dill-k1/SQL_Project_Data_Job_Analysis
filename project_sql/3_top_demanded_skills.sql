/*
 Question: What are the most in-demand skills for analysts?
 - Identify the top 10 in-demand skills for an anlyst in South Africa
 - Focus on all job postings.
 - Why? Retieves the top 10 skills with the higest demand in the job market,
 providing insigts into the most valuable skills for job seekers.
 */
SELECT skills,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sjd ON j.job_id = sjd.job_id
    INNER JOIN skills_dim AS s ON sjd.skill_id = s.skill_id
WHERE job_title_short ILIKE '%Analyst%'
    AND job_location ILIKE '%South Africa%'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;
/*
 - SQL is the dominant technical skill, appearing in 1,828 job postings and remaining the cornerstone
 of data analytics roles.
 - Excel and Python are the next most in-demand skills, demonstrating that employers value both
 traditional spreadsheet analysis and modern programming capabilities.
 - Power BI has stronger demand than Tableau, making it the leading business intelligence platform
 in this dataset.
 - The inclusion of Azure and AWS among the top ten skills reflects the increasing adoption of 
 cloud-based analytics solutions in South Africa.
 - Analysts with expertise in SQL, Excel, Python, and Power BI are well-positioned to meet the 
 core technical requirements of the South African job market, while adding cloud or statistical tools 
 can further strengthen their competitiveness.
 */