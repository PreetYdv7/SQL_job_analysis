-- Find out the top 5 skills needed for a particular role and the number of jobs that are demanding those skills.
WITH remote_job_skills AS(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim as skills_for_job
        INNER JOIN job_postings_fact AS job_postings ON skills_for_job.job_id = job_postings.job_id
    WHERE
        job_postings.job_work_from_home = TRUE
        AND job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
    ORDER BY
        skill_count DESC
    LIMIT
        5
)
SELECT
    skills_dim.skill_id,
    skills AS skill_name,
    skill_count
FROM
    remote_job_skills
    INNER JOIN skills_dim ON remote_job_skills.skill_id = skills_dim.skill_id;

--Comaprision of below or above average salaries per job in that country
WITH avg_salaries AS (
    SELECT
        job_country,
        AVG(salary_year_avg) AS average_salary
    FROM
        job_postings_fact
    GROUP BY
        job_country
)
SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.salary_year_avg AS salary_rate,
    company_dim.name AS company,
    CASE
        WHEN job_postings_fact.salary_year_avg > avg_salaries.average_salary THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_category
FROM
    job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    INNER JOIN avg_salaries ON job_postings_fact.job_country = avg_salaries.job_country;