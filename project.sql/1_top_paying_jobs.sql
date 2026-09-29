-- ____***** PROJECT WORK ____*****

-- Q.1 ===>>> high paying remote data analyst jobs 

SELECT 
job_id,  
job_title,
company_dim.name ,
job_location ,
job_schedule_type ,
salary_year_avg ,
job_posted_date  

 
FROM  job_postings_fact  
 LEFT JOIN company_dim 
 ON company_dim.company_id = job_postings_fact.company_id 

WHERE   job_title = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL 
 
 order BY salary_year_avg DESC
 LIMIT 10

