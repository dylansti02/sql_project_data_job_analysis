/*
Question:  What are the most in-demand skills for data roles?
    - Join job postings to inner join table like query 2
    - Identify top 5 in-demand skills for data roles
    - Focus on all job postings
    - Retrieves top 5 most demanded skills in job marketm providing insights into most valuable skills.
*/

SELECT  
      skills, 
      COUNT(skills_job_dim.job_id)  AS demand_count

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

SELECT  
      skills, 
      COUNT(skills_job_dim.job_id)  AS demand_count

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

SELECT  
      skills, 
      COUNT(skills_job_dim.job_id)  AS demand_count

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;