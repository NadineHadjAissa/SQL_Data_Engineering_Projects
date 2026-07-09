-- .read Lessons/DDL_DML.sql

CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;

SELECT * FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_roles (
    role_id INTEGER,
    role_name VARCHAR
);

select * 
from information_schema.tables
where table_catalog='jobs_mart';

ALTER TABLE staging.preferred_roles 
ADD COLUMN preferred_roles BOOLEAN;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN preferred_roles TO priority_lvl;

select * from staging.priority_roles;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;