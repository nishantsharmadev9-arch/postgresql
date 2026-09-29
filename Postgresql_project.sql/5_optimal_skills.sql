
-- WHAT ARE THE MOST OPTIMAL SKILLS TO LEARN (AKA IT"S IN HIGH DEMAND AND A HIGH-PAYING SKILLS )..? 
-- USE QUERY 3 OR 4 :- 

 









WITH optimal_skill_salary AS (
    SELECT  
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS count_job
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_title = 'Data Analyst'
      AND job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id,
        skills_dim.skills
),

optimal_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_title = 'Data Analyst'
      AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id,
        skills_dim.skills
)

SELECT 
    optimal_skill_salary.skill_id,
    optimal_skill_salary.skills,
    optimal_skill_salary.count_job,
    optimal_salary.avg_salary
FROM optimal_skill_salary
INNER JOIN optimal_salary 
    ON optimal_skill_salary.skill_id = optimal_salary.skill_id
ORDER BY 
    optimal_skill_salary.count_job DESC,
    optimal_salary.avg_salary DESC
LIMIT 10;
