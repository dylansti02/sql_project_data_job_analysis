/*
Question:  What skills are required for the top-paying jobs?
 - Use results from first query.
 - Add specific skills required for these roles.
 - Provides a more detailed look at which skills are demanded by high-paying jobs.
    - Helps job seekers learn which skills to develop that align with top salaries.
*/

WITH top_da_jobs AS (
    SELECT 
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
    WHERE
        job_title_short='Data Analyst' AND (job_location='Anywhere' OR job_location LIKE '%, MA') AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_da_jobs.*,
    skills
FROM top_da_jobs
INNER JOIN skills_job_dim ON top_da_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC