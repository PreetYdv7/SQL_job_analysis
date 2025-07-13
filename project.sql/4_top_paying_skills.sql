SELECT
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT
    25;

/*
 🔍 Insights from Skill-wise Average Salary Data:
 
 1. SVN commands the highest average salary at $400,000, likely due to its presence in niche or highly senior roles.
 
 2. High-paying technologies like Solidity, Golang, and Couchbase (avg. > $150K) suggest strong demand in blockchain and backend-focused data roles.
 
 3. Machine learning libraries such as MXNet, Keras, PyTorch, and TensorFlow appear frequently, reflecting the premium salaries for AI-driven analyst positions.
 
 4. Infrastructure and automation tools like Terraform, Puppet, Ansible, and Kafka highlight the growing overlap of data and DevOps skill sets.
 
 5. Collaboration tools like Bitbucket, Notion, and Atlassian show that project and team integration skills are valued even in high-paying technical roles. */