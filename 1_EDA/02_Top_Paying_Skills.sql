/* 
What are highest-paying skills for data engineers ? with focus on remote positions using median salary.
*/




SELECT 

sd.skills,
ROUND(MEDIAN(jpf.salary_year_avg), 0) as median_salary,
count(jpf.*) as demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim as sd 
    ON sd.skill_id = sjd.skill_id
where job_title_short='Data Engineer' AND jpf.job_work_from_home= TRUE
GROUP BY sd.skills
HAVING count(jpf.*) > 100
ORDER BY median_salary DESC
limit 20;

/*
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ node       │      150000.0 │          179 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
└────────────┴───────────────┴──────────────┘
  20 rows                         3 columns



Rust has the highest median salary ($210,000) among the listed skills, although its demand (232 job postings) is relatively low. This suggests it is a specialized, high-paying skill.
Golang and Terraform also command high median salaries ($184,000). However, Terraform appears in 3,248 job postings, making it both highly valuable and widely sought after.
Kubernetes (4,202 postings) and Airflow (9,996 postings) stand out as the most in-demand infrastructure and data engineering technologies, while still offering competitive median salaries of around $150,000.
Airflow is the most frequently requested skill in this dataset, highlighting its importance in modern data engineering workflows.
Skills such as GraphQL, TypeScript, C, and Bitbucket provide a balance between strong salaries and moderate demand, making them valuable complementary skills.
Technologies like Zoom, Crystal, and Neo4j offer relatively high salaries but appear in fewer job postings, indicating niche expertise with potentially higher compensation.

*/