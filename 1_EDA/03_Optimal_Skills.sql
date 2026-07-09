/* what are the most valuable skills
balancing demand count and median salary */




SELECT 
sd.skills,
ROUND(MEDIAN(jpf.salary_year_avg), 0) as median_salary,
COUNT(jpf.salary_year_avg) as correct_demand_count,
round(LN(COUNT(jpf.*) ),1)as LN_demand_count,
ROUND((MEDIAN(jpf.salary_year_avg)* LN(COUNT(jpf.*) ))/1_000_000,2) as optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim as sd 
    ON sd.skill_id = sjd.skill_id
where job_title_short='Data Engineer' AND jpf.job_work_from_home= TRUE
AND jpf.salary_year_avg IS NOT NULL 
GROUP BY sd.skills
HAVING count(jpf.*) > 100
ORDER BY optimal_score DESC
limit 20;

/*

┌────────────┬───────────────┬──────────────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ correct_demand_count │ LN_demand_count │ optimal_score │
│  varchar   │    double     │        int64         │     double      │    double     │
├────────────┼───────────────┼──────────────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │                  193 │             5.3 │          0.97 │
│ python     │      135000.0 │                 1133 │             7.0 │          0.95 │
│ sql        │      130000.0 │                 1128 │             7.0 │          0.91 │
│ aws        │      137320.0 │                  783 │             6.7 │          0.91 │
│ airflow    │      150000.0 │                  386 │             6.0 │          0.89 │
│ spark      │      140000.0 │                  503 │             6.2 │          0.87 │
│ snowflake  │      135500.0 │                  438 │             6.1 │          0.82 │
│ kafka      │      145000.0 │                  292 │             5.7 │          0.82 │
│ azure      │      128000.0 │                  475 │             6.2 │          0.79 │
│ java       │      135000.0 │                  303 │             5.7 │          0.77 │
│ scala      │      137290.0 │                  247 │             5.5 │          0.76 │
│ git        │      140000.0 │                  208 │             5.3 │          0.75 │
│ kubernetes │      150500.0 │                  147 │             5.0 │          0.75 │
│ databricks │      132750.0 │                  266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │                  274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │                  196 │             5.3 │          0.72 │
│ hadoop     │      135000.0 │                  198 │             5.3 │          0.71 │
│ nosql      │      134415.0 │                  193 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │                  152 │             5.0 │           0.7 │
│ mongodb    │      135750.0 │                  136 │             4.9 │          0.67 │
└────────────┴───────────────┴──────────────────────┴─────────────────┴───────────────┘
Terraform achieves the highest optimal score (0.97), indicating an excellent balance between high median salary ($184,000) and strong market demand. It represents one of the most valuable skills for data engineers.
Python and SQL rank among the top three skills due to their very high demand (over 1,100 job postings each) combined with competitive salaries. This reinforces their status as core skills for data engineering.
AWS, Airflow, and Spark also score highly, highlighting the growing importance of cloud computing, data orchestration, and distributed data processing in modern data engineering roles.
Skills such as Snowflake, Kafka, Azure, and Databricks demonstrate a strong combination of demand and salary, making them valuable technologies for professionals seeking career growth.
Although Kubernetes offers one of the highest median salaries ($150,500), its lower demand compared to Python or SQL results in a slightly lower optimal score, illustrating the trade-off between specialization and market demand.*/