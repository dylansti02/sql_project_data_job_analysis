/*
Question:  What are the top-paying skills for data roles?
    - Look at the average salary by each skill
    - Exclude rows with null salary data
    - Reveals how different skills impact salary level and helps identify the optimal skills to learn.
*/

SELECT
    ROUND(AVG(salary_year_avg),0) AS average_salary,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25;

SELECT
    ROUND(AVG(salary_year_avg),0) AS average_salary,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short='Data Scientist' AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25;

SELECT
    ROUND(AVG(salary_year_avg),0) AS average_salary,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short='Data Engineer' AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25;
