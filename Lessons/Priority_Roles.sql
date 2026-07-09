
CREATE OR REPLACE TABLE staging.priority_roles(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR,
    priority_lvl INTEGER
);


insert into staging.priority_roles( role_id, role_name, priority_lvl) VALUES
(1,'Data Engineer',1),
(2,'Senior Data Engineer',2),
(3,'Software Engineer',3);


SELECT * FROM staging.priority_roles;

SHOW SCHEMAS;