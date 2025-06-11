/* 
Question:  What are the most optimal skills to learn?
 - Identify skills in high demand and associated with high average salaries.
 - Focus on positions with specified salaries (non-null).
 - Target skills that offer job security and financial benefits to offer strategic insight for career growth.
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id)>10
ORDER BY
    demand_count DESC
LIMIT 25;


SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id)>10
ORDER BY
    demand_count DESC
LIMIT 25;

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id)>10
ORDER BY
    demand_count DESC
LIMIT 25;

--comment out old CTE
/*WITH skills_demand AS (
    SELECT  
          skills_dim.skill_id,
          skills_dim.skills, 
        COUNT(skills_job_dim.job_id)  AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id

), average_salary AS (
    SELECT
        ROUND(AVG(salary_year_avg),0) AS average_salary,
        skills_dim.skill_id
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
 
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
WHERE demand_count > 10
ORDER BY average_salary DESC, demand_count DESC
LIMIT 25;
*/