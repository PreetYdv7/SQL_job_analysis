WITH skills_demand AS(
    SELECT
        skills,
        skill_id,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skill_id,
        skills
    LIMIT
        10
), avg_salary AS (
    SELECT
        skills,
        skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
    FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skill_id,
        skills
    LIMIT
        25
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    avg_salary.average_salary
FROM
    avg_salary
    INNER JOIN skills_demand ON avg_salary.skill_id = skills_demand.skill_id;