
-- Question 2 :- top high paying job skills : -- 

 

with top_paying_skills AS (

SELECT 
job_id,  
job_title,
company_dim.name ,
-- job_location ,
salary_year_avg 


 
FROM  job_postings_fact  
 LEFT JOIN company_dim 
 ON company_dim.company_id = job_postings_fact.company_id 

WHERE  job_title_short='Data Analyst'  AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL 
 
 order BY salary_year_avg DESC
 LIMIT 10 

)  



SELECT  
top_paying_skills .*  ,
skills_dim.skills

FROM top_paying_skills  

INNER join skills_job_dim ON skills_job_dim.job_id = top_paying_skills.job_id 
INNER join skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
ORDER BY salary_year_avg DESC 



