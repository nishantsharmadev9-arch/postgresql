-- Q.3 =>>  WHAT ARE THE MOST IN_DEMANED SKILLS FOR DATA ANALYST ....? 



SELECT  
            
  
skills_dim.skills ,
COUNT(skills_job_dim.job_id)  AS COUNTE_JOB 


from job_postings_fact  
INNER join skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id 
INNER join skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
 
where job_title = 'Data Analyst' AND job_work_from_home=TRUE  -- DATA ANALYST KI JOB_ID = 9 
GROUP BY  skills  
ORDER BY  COUNTE_JOB  DESC 
LIMIT 5
 

