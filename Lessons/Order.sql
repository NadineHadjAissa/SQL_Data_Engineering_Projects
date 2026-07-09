/* top 10 countries for posting jobs
they must have > 3000 postings
limit it only to US jobs */

EXPLAIN ANALYZE
SELECT
cd.name AS company_names , 
COUNT (jpf.job_id) AS posting_count

FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE jpf.job_country='United States'
GROUP BY cd.name
HAVING COUNT(jpf.job_id) > 3000
ORDER BY posting_count DESC
limit 10;



/* ANALYZE adds total time across all cpus to run the query and amount of time for each step
 + exact number of rows 
not just an estimation like explain */
