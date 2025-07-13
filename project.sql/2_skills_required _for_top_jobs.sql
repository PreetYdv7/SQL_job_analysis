WITH top_jobs AS (
    SELECT
        job_postings_fact.job_title,
        job_postings_fact.salary_year_avg,
        job_postings_fact.job_id,
        company_dim.name AS company
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_postings_fact.job_work_from_home = TRUE
        AND job_postings_fact.job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    ORDER BY
        job_postings_fact.salary_year_avg DESC
    LIMIT
        10
)
SELECT
    top_jobs.*,
    skills_dim.skills AS required_skills
FROM
    top_jobs
    INNER JOIN skills_job_dim ON top_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;

---- Insights:
-- This query surfaces the top 10 highest-paying remote Data Analyst roles.
-- Most roles demand core skills like SQL, Python, and Tableau, with an average of 8 skills per job.
-- Companies like SmartAsset, Inclusively, and AT&T lead in high-skill, high-salary listings.
-- Average salary among these roles is ~$207K/year, with the top offer reaching $255K.
-- The data reflects a strong preference for well-rounded analysts with both tech and BI skills.
--results: [
/* {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "sql"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "python"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "r"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "azure"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "databricks"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "aws"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "pandas"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "pyspark"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "jupyter"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "excel"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "tableau"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "power bi"
 },
 {
 "job_title": "Associate Director- Data Insights",
 "salary_year_avg": "255829.5",
 "job_id": 552322,
 "company": "AT&T",
 "required_skills": "powerpoint"
 },
 {
 "job_title": "Data Analyst, Marketing",
 "salary_year_avg": "232423.0",
 "job_id": 99305,
 "company": "Pinterest Job Advertisements",
 "required_skills": "sql"
 },
 {
 "job_title": "Data Analyst, Marketing",
 "salary_year_avg": "232423.0",
 "job_id": 99305,
 "company": "Pinterest Job Advertisements",
 "required_skills": "python"
 },
 {
 "job_title": "Data Analyst, Marketing",
 "salary_year_avg": "232423.0",
 "job_id": 99305,
 "company": "Pinterest Job Advertisements",
 "required_skills": "r"
 },
 {
 "job_title": "Data Analyst, Marketing",
 "salary_year_avg": "232423.0",
 "job_id": 99305,
 "company": "Pinterest Job Advertisements",
 "required_skills": "hadoop"
 },
 {
 "job_title": "Data Analyst, Marketing",
 "salary_year_avg": "232423.0",
 "job_id": 99305,
 "company": "Pinterest Job Advertisements",
 "required_skills": "tableau"
 },
 {
 "job_title": "Data Analyst (Hybrid/Remote)",
 "salary_year_avg": "217000.0",
 "job_id": 1021647,
 "company": "Uclahealthcareers",
 "required_skills": "sql"
 },
 {
 "job_title": "Data Analyst (Hybrid/Remote)",
 "salary_year_avg": "217000.0",
 "job_id": 1021647,
 "company": "Uclahealthcareers",
 "required_skills": "crystal"
 },
 {
 "job_title": "Data Analyst (Hybrid/Remote)",
 "salary_year_avg": "217000.0",
 "job_id": 1021647,
 "company": "Uclahealthcareers",
 "required_skills": "oracle"
 },
 {
 "job_title": "Data Analyst (Hybrid/Remote)",
 "salary_year_avg": "217000.0",
 "job_id": 1021647,
 "company": "Uclahealthcareers",
 "required_skills": "tableau"
 },
 {
 "job_title": "Data Analyst (Hybrid/Remote)",
 "salary_year_avg": "217000.0",
 "job_id": 1021647,
 "company": "Uclahealthcareers",
 "required_skills": "flow"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "sql"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "python"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "go"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "snowflake"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "pandas"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "numpy"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "excel"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "tableau"
 },
 {
 "job_title": "Principal Data Analyst (Remote)",
 "salary_year_avg": "205000.0",
 "job_id": 168310,
 "company": "SmartAsset",
 "required_skills": "gitlab"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "sql"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "python"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "azure"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "aws"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "oracle"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "snowflake"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "tableau"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "power bi"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "sap"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "jenkins"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "bitbucket"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "atlassian"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "jira"
 },
 {
 "job_title": "Director, Data Analyst - HYBRID",
 "salary_year_avg": "189309.0",
 "job_id": 731368,
 "company": "Inclusively",
 "required_skills": "confluence"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "sql"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "python"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "r"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "git"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "bitbucket"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "atlassian"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "jira"
 },
 {
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "salary_year_avg": "189000.0",
 "job_id": 310660,
 "company": "Motional",
 "required_skills": "confluence"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "sql"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "python"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "go"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "snowflake"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "pandas"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "numpy"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "excel"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "tableau"
 },
 {
 "job_title": "Principal Data Analyst",
 "salary_year_avg": "186000.0",
 "job_id": 1749593,
 "company": "SmartAsset",
 "required_skills": "gitlab"
 },
 {
 "job_title": "ERM Data Analyst",
 "salary_year_avg": "184000.0",
 "job_id": 387860,
 "company": "Get It Recruit - Information Technology",
 "required_skills": "sql"
 },
 {
 "job_title": "ERM Data Analyst",
 "salary_year_avg": "184000.0",
 "job_id": 387860,
 "company": "Get It Recruit - Information Technology",
 "required_skills": "python"
 },
 {
 "job_title": "ERM Data Analyst",
 "salary_year_avg": "184000.0",
 "job_id": 387860,
 "company": "Get It Recruit - Information Technology",
 "required_skills": "r"
 }
 ]*/