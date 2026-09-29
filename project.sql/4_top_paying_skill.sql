-- Q.4.= what are the top skills based on salary ......?


-- SELECT job_title , 
-- -- salary_year_avg, 
-- AVG(salary_year_avg) AS yearly_avg 
 

-- FROM job_postings_fact
-- WHERE job_title = 'Data Analyst' 
-- group BY  job_title  
  


  SELECT 
  skills_dim.skills ,
 ROUND(AVG(salary_year_avg) , 0)  AS avg_salary 

  from job_postings_fact 

  INNER join skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id 
INNER join skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id 

WHERE job_title = 'Data Analyst' AND salary_year_avg IS NOT NULL 
GROUP BY skills 
ORDER BY avg_salary  DESC 
LIMIT 50
 
