# 🏗️ Data Warehouse & Data Mart ETL Pipeline


## 📖 Overview

This project demonstrates a complete ETL workflow:

Raw CSV Files → Star Schema Data Warehouse → Analytical Data Marts → BI & Analytics

### Pipeline Architecture

![Pipeline Architecture](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_2_Project2_Data_Pipeline.png)

---

## 🏛️ Data Warehouse

The warehouse follows a Star Schema composed of one fact table, two dimension tables, and one bridge table.

![Data Warehouse Schema](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_2_Data_Warehouse.png)

---

## 📊 Flat Mart

The Flat Mart is a denormalized representation of the warehouse that joins all dimensions into a single table for fast ad-hoc analysis.

![Flat Mart](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_2_Flat_Mart.png)

---

## 📈 Skills Mart

The Skills Mart aggregates monthly hiring demand by skill and job title, enabling time-series analysis with additive measures.

![Skills Mart](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_2_Skills_Mart.png)

---

## 🏢 Company Mart *(Optional)*

The Company Mart summarizes hiring activity by company, location, and job title to support organizational hiring analysis.

![Company Mart](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_2_Company_Mart.png)




## 🙏 Acknowledgements

These projects were completed while following the SQL Data Engineering course by Luke Barousse. The datasets and architecture diagrams originate from the course
