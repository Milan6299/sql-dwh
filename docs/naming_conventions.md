# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

## **Table of Contents**

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Rules](#bronze-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
---

## **General Principles**

- **Naming Conventions**: Snake_case, with lowercase letters and underscores (`_`) to separate words.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### **Bronze Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.


## **Column Naming Conventions**

### **Surrogate Keys**  
- All primary keys in dimension tables must use the suffix `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Refers to the name of the table or entity the key belongs to.  
  - `_key`: A suffix indicating that this column is a surrogate key.  
  - Example: `customer_key` → Surrogate key in the `dim_customers` table.  
