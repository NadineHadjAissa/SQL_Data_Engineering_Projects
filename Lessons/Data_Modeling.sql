/* bridge between skills and jobs*/
SELECT *
from skills_job_dim
limit 5;

/* unique identefiers for the skills and their types  */
SELECT *
from skills_dim
limit 5; 

/* quering information_schema */
SELECT *
from information_schema.tables
where table_catalog='data_jobs';

/* info about columns */
SELECT *
from information_schema.columns
where table_catalog='data_jobs';

/* what we need only */
SELECT table_name , column_name , data_type
from information_schema.columns
where table_catalog='data_jobs';

/* info about constraints */
SELECT *
from information_schema.table_constraints
where table_catalog='data_jobs';

/* key info */
SELECT *
from information_schema.key_column_usage
where table_catalog='data_jobs';

PRAGMA show_tables_expanded;

DESCRIBE job_postings_fact;