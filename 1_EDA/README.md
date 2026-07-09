# 🔍 Exploratory Data Analysis with SQL: Data Engineer Job Market Analytics

![Project Banner](https://github.com/lukebarousse/SQL_Data_Engineering_Course/blob/main/Resources/images/1_1_Project1_EDA.png?raw=true)


## 📖 Overview

This project explores the **data engineering job market** using SQL and real-world job posting data. The objective is to identify the most in-demand skills, the highest-paying technologies, and the optimal skills that balance both salary and market demand.

Through analytical SQL queries, this project demonstrates data exploration, aggregation, multi-table joins, and business-oriented insight generation.

---

## 🧾 Executive Summary

This project answers three key business questions:

- 📈 Which skills are most in demand for data engineers?
- 💰 Which skills command the highest salaries?
- ⚖️ Which skills offer the best balance between demand and compensation?

The analysis showcases:

- Multi-table joins across a star-schema data warehouse
- Aggregate functions and statistical analysis
- Business-driven SQL querying
- Production-style SQL organization

---

## 🗂 Repository Structure
## 📂 Repository Structure

```text
1_EDA/
├── 01_Top_Demanded_Skills.sql
├── 02_Top_Paying_Skills.sql
├── 03_Optimal_Skills.sql
└── README.md
```

### Files

- 📈 [01_Top_Demanded_Skills.sql](./01_Top_Demanded_Skills.sql)
- 💰 [02_Top_Paying_Skills.sql](./02_Top_Paying_Skills.sql)
- ⚖️ [03_Optimal_Skills.sql](./03_Optimal_Skills.sql)
## 📊 Analysis Performed

### 1. Top Demanded Skills

Identifies the ten most requested skills for remote Data Engineer positions by analyzing job postings and counting skill occurrences.

---

### 2. Top Paying Skills

Calculates the median salary for each skill to determine which technologies command the highest compensation.

---

### 3. Optimal Skills

Combines demand and salary into a single metric using a logarithmic transformation of demand alongside median salary to identify the most valuable skills to learn.

---

## 🏗 Data Warehouse Schema

![Data Warehouse](https://github.com/lukebarousse/SQL_Data_Engineering_Course/raw/main/Resources/images/1_2_Data_Warehouse.png)

The project queries a star-schema data warehouse composed of:

### Fact Table

- **job_postings_fact**
  - Job titles
  - Salary information
  - Work location
  - Company IDs
  - Posting dates

### Dimension Tables

- **company_dim**
- **skills_dim**

### Bridge Table

- **skills_job_dim**

This schema enables many-to-many relationships between job postings and required skills.

---

## 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| SQL | Data analysis |
| DuckDB | Analytical query engine |
| VS Code | SQL development |
| Git & GitHub | Version control |
| Star Schema | Data warehouse model |

---

## 💡 Key Insights

Some notable findings include:

- SQL and Python dominate the data engineering job market.
- AWS and Azure remain essential cloud technologies.
- Kubernetes, Docker, and Terraform are associated with premium salaries.
- Apache Spark combines strong demand with competitive compensation.

---

## 💻 SQL Concepts Demonstrated

### Query Design

- INNER JOIN
- GROUP BY
- ORDER BY
- HAVING
- LIMIT
- Filtering with WHERE

### Aggregation

- COUNT()
- MEDIAN()
- ROUND()

### Analytical Techniques

- Derived metrics
- Logarithmic transformations using `LN()`
- Demand vs salary optimization
- NULL handling

---

## 🎯 Project Objectives

This project demonstrates the ability to:

- Write clean, maintainable SQL
- Analyze large datasets
- Work with normalized relational databases
- Extract actionable business insights
- Answer real-world analytical questions using SQL

---

## Acknowledgements

The dataset used in this project comes from **Luke Barousse's SQL Data Engineering Course**, which provides real-world job posting data for learning SQL and data analytics.

---

## 🚀 Future Improvements

Possible extensions include:

- Salary trends over time
- Geographic salary analysis
- Company-level hiring analysis
- Dashboard creation using Power BI or Tableau
- Interactive SQL dashboards with DuckDB and Streamlit
