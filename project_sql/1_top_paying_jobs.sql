/*
 Question: What are the top paying analyst jobs?
 - Identify the top 10 highest-paying Analyst roles that are avaialble in South Africa.
 - Focus on the job postings with specified salaries (nulls omitted).
 - Why? Hihglights the top-paying opputunities for Analysts, offering insights
 into employment opportunities.
 */
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    c.name AS company_name
FROM job_postings_fact AS j
    LEFT JOIN company_dim AS c ON j.company_id = c.company_id
WHERE job_title_short ILIKE '%Analyst%'
    AND job_location ILIKE '%South Africa%'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;
/*
 Key Insights
 - Median salary of $216750 is a better indicator of a typical 'hihg-paying' analyst role
 than the average due to the influecne of outliers.
 - 50% of jobs offer salaries between $200k and $220k, showing a clear concentration at
 the upper end of the market.
 - Leadership Analyst roles consistently exceed $250k, refelcting the premium placed on
 strategic and managerial expertise.
 - The highest paying opportunities are concentrated in technology, fintech, and data-driven
 organisations, emphasisig the value of advanced data analytics skills in these industries.
 - Removing the outlier role with a $650k salary lowers the average salary by about 15%, illustrating
 the impotance of analysing both the mean and median when summarising salary data.
 */