SELECT  *
from (  select *
        from data_jobs.job_postings_fact
        where salary_year_avg is not null 
            OR salary_hour_avg IS NOT NULL 
    
    ) 
    LIMIT 10;

    --CTE
 valid_salaries AS
(
    SELECT *
    FROM data_jobs.job_postings_fact
    WHERE salary_year_avg IS NOT NULL 
        OR salary_hour_avg IS NOT NULL 

) 
SELECT *
FROM valid_salaries;





-- scenario 1 :  subquery in select 
-- select each job's salary next to the overall market median
SELECT
    job_title_short,
    salary_year_avg,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM data_jobs.job_postings_fact
        WHERE salary_year_avg IS NOT NULL
    ) AS market_median
FROM data_jobs.job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 5 ;
/*
            LIMIT 5 ;
┌──────────────────┬─────────────────┬───────────────┐
│ job_title_short  │ salary_year_avg │ market_median │
│     varchar      │     double      │    double     │
├──────────────────┼─────────────────┼───────────────┤
│ Data Scientist   │        110000.0 │      116950.0 │
│ Data Engineer    │         65000.0 │      116950.0 │
│ Business Analyst │         90000.0 │      116950.0 │
│ Data Analyst     │         55000.0 │      116950.0 │
│ Data Scientist   │        120531.0 │      116950.0 │
└──────────────────┴─────────────────┴───────────────┘*/







--Scenario 2 : Subquery in FROM
-- Stage only jobs that are remote before aggregatingo determine the remote medianalary per job 
SELECT
    job_title_short,
    median (salary_year_avg) as median_salary,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM data_jobs.job_postings_fact
    ) AS market_median
FROM ( 
    select 
        job_title_short,
        salary_year_avg 
        from data_jobs.job_postings_fact
        where job_work_from_home = TRUE ) AS clean_jobs
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short;

/*
┌───────────────────────────┬───────────────┬───────────────┐
│      job_title_short      │ median_salary │ market_median │
│          varchar          │    double     │    double     │
├───────────────────────────┼───────────────┼───────────────┤
│ Senior Data Analyst       │      105000.0 │      116950.0 │
│ Machine Learning Engineer │      138433.5 │      116950.0 │
│ Cloud Engineer            │      132000.0 │      116950.0 │
│ Senior Data Engineer      │      145000.0 │      116950.0 │
│ Data Engineer             │      135000.0 │      116950.0 │
│ Data Analyst              │       87500.0 │      116950.0 │
│ Software Engineer         │      180000.0 │      116950.0 │
│ Senior Data Scientist     │      160000.0 │      116950.0 │
│ Business Analyst          │       90000.0 │      116950.0 │
│ Data Scientist            │      132500.0 │      116950.0 │
└───────────────────────────┴───────────────┴───────────────┘ */










-- Scenario 3 : subquery in HAVING
-- keep only job titles whose median salaries above the overall median

SELECT
    job_title_short,
    median (salary_year_avg) as median_salary,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM data_jobs.job_postings_fact
    ) AS market_median
FROM ( 
    select 
        job_title_short,
        salary_year_avg 
        from data_jobs.job_postings_fact
        where job_work_from_home = TRUE ) AS clean_jobs
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short
HAVING  median_salary > 
(select median(salary_year_avg)
from data_jobs.job_postings_fact );

/*
┌───────────────────────────┬───────────────┬───────────────┐
│      job_title_short      │ median_salary │ market_median │
│          varchar          │    double     │    double     │
├───────────────────────────┼───────────────┼───────────────┤
│ Cloud Engineer            │      132000.0 │      116950.0 │
│ Machine Learning Engineer │      138433.5 │      116950.0 │
│ Senior Data Engineer      │      145000.0 │      116950.0 │
│ Software Engineer         │      180000.0 │      116950.0 │
│ Data Engineer             │      135000.0 │      116950.0 │
│ Senior Data Scientist     │      160000.0 │      116950.0 │
│ Data Scientist            │      132500.0 │      116950.0 │
└───────────────────────────┴───────────────┴───────────────┘*/



-- CTE example
-- compare how much more or less remote roles pay compared to on site rolesfor each job title
-- Use a CTE to caluclate the median salary by title and work arrangement then compare these medians.



WITH median AS (
select 
job_title_short,
job_work_from_home,
MEDIAN(salary_year_avg) AS median_salary
FROM data_jobs.job_postings_fact
GROUP BY  job_title_short , job_work_from_home
) 
SELECT 
job_title_short , 
job_work_from_home, 
median_salary
FROM median ;

