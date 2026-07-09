# 📊 SQL Data Engineering Projects

A collection of end-to-end SQL data engineering projects built with **DuckDB**, demonstrating data analysis, dimensional modeling, ETL pipeline development, and analytical data mart design using real-world job posting data.

These projects showcase practical SQL skills commonly used in data engineering workflows, from exploratory data analysis to building a production-inspired data warehouse.

---

## 🚀 Projects

### 🔍 Project 1 — Exploratory Data Analysis with SQL: Data Engineer Job Market Analytics

Analyze the Data Engineer job market using SQL to uncover hiring trends, identify the highest-paying technologies, and determine which skills offer the best balance between salary and market demand.

**Highlights**

- Exploratory Data Analysis (EDA)
- Multi-table joins across a star schema
- Aggregate and statistical analysis
- Business-oriented SQL queries
- Market demand and salary insights

**Technologies**

- SQL
- DuckDB
- VS Code
- Git & GitHub

📂 **Project Folder:** [`SQL_Data_Engineering_Projects/1_EDA`](./1_EDA)

📖 **Project Documentation:** [`1_EDA/README.md`](./1_EDA/README.md)

---

### 🏗️ Project 2 — Data Warehouse & Data Mart ETL Pipeline

Build a complete ETL pipeline that transforms raw CSV files into a normalized Star Schema Data Warehouse and multiple analytical Data Marts optimized for reporting and business intelligence.

**Highlights**

- Star Schema Design
- ETL Pipeline Development
- Data Warehouse Modeling
- Analytical Data Mart Design
- Incremental Loading with `MERGE`
- Idempotent SQL Scripts

**Technologies**

- SQL
- DuckDB
- Google Cloud Storage
- VS Code
- Git & GitHub

📂 **Project Folder:** [`SQL_Data_Engineering_Projects/2_WH_Mart_Build`](./2_WH_Mart_Build)

📖 **Project Documentation:** [`2_WH_Mart_Build/README.md`](./2_WH_Mart_Build/README.md)

---

## 🛠️ Technologies Used

- SQL
- DuckDB
- Google Cloud Storage
- Git & GitHub
- VS Code
- Star Schema Data Modeling
- ETL Pipeline Development

---

## 📂 Repository Structure

```text
SQL_Data_Engineering_Projects/
│
├── README.md
│
├── 1_EDA/
│   ├── 01_Top_Demanded_Skills.sql
│   ├── 02_Top_Paying_Skills.sql
│   ├── 03_Optimal_Skills.sql
│   └── README.md
│
└── 2_WH_Mart_Build/
    ├── 01_create_tables_dw.sql
    ├── 02_load_schema_dw.sql
    ├── 03_create_flat_mart.sql
    ├── 04_create_skills_mart.sql
    ├── 05_create_priority_mart.sql
    ├── 06_update_priority_mart.sql
    ├── build_dw_marts.sql
    └── README.md
```

---

## 💡 Skills Demonstrated

### SQL Analytics

- Exploratory Data Analysis
- Statistical Analysis
- Business Intelligence Queries
- Multi-table Joins
- Aggregate Functions
- Window-ready Analytical Queries

### Data Engineering

- ETL Pipeline Development
- Star Schema Design
- Fact & Dimension Modeling
- Bridge Tables
- Data Mart Development
- Incremental Loading (`MERGE`)
- Data Validation
- Idempotent SQL Scripts

---

## 🎯 Learning Objectives

These projects demonstrate the ability to:

- Analyze large datasets using SQL
- Design dimensional data warehouse models
- Build end-to-end ETL pipelines
- Create analytical data marts for reporting
- Apply SQL to solve real-world business problems
- Organize maintainable and production-inspired SQL projects

---

## 📚 Data Source

The datasets used throughout these projects are based on real-world job posting data provided as part of the SQL Data Engineering course by Luke Barousse.

---

## 🙏 Acknowledgements

These projects were completed while following the SQL Data Engineering course by Luke Barousse. The datasets and architecture diagrams originate from the course.