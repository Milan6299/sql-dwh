# Data Warehouse Project
---
A project to showcase data engineering capabilities.

## Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into Postgres Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---

## Project Overview

Goals

1. **Design the architecture:** a modern data warehouse with three layers, bronze, silver and gold.
2. **Build the ETL pipelines:** load the source files and move the data through the layers.
3. **Model the data:** facts and dimensions, ready for reports.
4. **Analyze it:** answer business questions with SQL.

---

## Important Links & Tools

- **Postgres:** to store and operate on databases.
- **[draw.io](https://www.drawio.com/):** to draw the architecture and the data model.
- **[Notion template](https://app.notion.com/p/Data-Warehouse-Project-3fabae9e42568095acd0f2aa28667f7b?source=copy_link):** the project plan, ready to copy.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using **Postgres** to consolidate sales data, enabling analytical reporting and informed decision-making.

---

## License

[MIT License](LICENSE). You are free to use, modify, and share this project.
