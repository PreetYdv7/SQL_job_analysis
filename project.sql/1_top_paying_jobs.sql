SELECT
    job_postings_fact.job_title_short,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_id,
    job_postings_fact.job_schedule_type,
    DATE(job_postings_fact.job_posted_date),
    job_postings_fact.job_location,
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
    10;