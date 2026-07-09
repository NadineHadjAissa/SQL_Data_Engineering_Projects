CREATE OR REPLACE TABLE main.priority_jobs_snapshot (
    job_id INTEGER PRIMARY KEY,
    job_title_short VARCHAR,
    company_name VARCHAR,
    job_posted_date TIMESTAMP,
    salary_year_avg DOUBLE,
    priority_lvl INTEGER,
    updated_at TIMESTAMP
);

INSERT INTO main.priority_jobs_snapshot (
    job_id,
    job_title_short,
    company_name,
    job_posted_date,
    salary_year_avg,
    priority_lvl,
    updated_at
)
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priority_lvl,
    CURRENT_TIMESTAMP
FROM data_jobs.job_postings_fact AS jpf
LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id
INNER JOIN staging.priority_roles AS r
    ON jpf.job_title_short = r.role_name
    limit 5;

/*  
    ┌────────┬──────────────────────┬───────────────────────────┬─────────────────────┬─────────────────┬──────────────┬───────────────────────────────┐
    │ job_id │   job_title_short    │       company_name        │   job_posted_date   │ salary_year_avg │ priority_lvl │       CURRENT_TIMESTAMP       │
    │ int32  │       varchar        │          varchar          │      timestamp      │     double      │    int32     │   timestamp with time zone    │
    ├────────┼──────────────────────┼───────────────────────────┼─────────────────────┼─────────────────┼──────────────┼───────────────────────────────┤
    │   4618 │ Data Engineer        │ Resume Library            │ 2023-01-01 00:01:17 │            NULL │            1 │ 2026-07-09 08:55:07.332544+01 │
    │   4635 │ Senior Data Engineer │ Cox Automotive            │ 2023-01-01 00:01:55 │            NULL │            2 │ 2026-07-09 08:55:07.332544+01 │
    │   4656 │ Data Engineer        │ Tata Consultancy Services │ 2023-01-01 00:02:59 │            NULL │            1 │ 2026-07-09 08:55:07.332544+01 │
    │   4657 │ Data Engineer        │ Business & Decision       │ 2023-01-01 00:02:59 │            NULL │            1 │ 2026-07-09 08:55:07.332544+01 │
    │   4658 │ Data Engineer        │ Link Consulting           │ 2023-01-01 00:02:59 │            NULL │            1 │ 2026-07-09 08:55:07.332544+01 │
    └────────┴──────────────────────┴───────────────────────────┴─────────────────────┴─────────────────┴──────────────┴───────────────────────────────┘
    