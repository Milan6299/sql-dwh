#!/usr/bin/env bash

project_path="$HOME/projects/dwh_sql"
# to allow .env variables to be exported and loaded in the env
source "${project_path}/.env"

# if no $DATABASE_URL is found then abort
if [ -z "$DATABASE_URL" ]; then
  echo "Error: DATABASE_URL is not set."
  exit 1
fi

dataset_path="${project_path}/datasets"
# echo "$dataset_path"

# Create fresh bronze tables
psql "$DATABASE_URL" <./ddl.sql

# Use \copy to stream local file data into the docker container using the database connection url
# CRM
psql "$DATABASE_URL" -c "\copy bronze.crm_cust_info FROM '${dataset_path}/source_crm/cust_info.csv' WITH (FORMAT csv, HEADER true);"

psql "$DATABASE_URL" -c "\copy bronze.crm_prd_info FROM '${dataset_path}/source_crm/prd_info.csv' WITH (FORMAT csv, HEADER true);"

psql "$DATABASE_URL" -c "\copy bronze.crm_sales_details FROM '${dataset_path}/source_crm/sales_details.csv' WITH (FORMAT csv, HEADER true);"

# ERP
psql "$DATABASE_URL" -c "\copy bronze.erp_cust_az12 FROM '${dataset_path}/source_erp/CUST_AZ12.csv' WITH (FORMAT csv, HEADER true);"

psql "$DATABASE_URL" -c "\copy bronze.erp_loc_a101 FROM '${dataset_path}/source_erp/LOC_A101.csv' WITH (FORMAT csv, HEADER true);"

psql "$DATABASE_URL" -c "\copy bronze.erp_px_cat_g1v2 FROM '${dataset_path}/source_erp/PX_CAT_G1V2.csv' WITH (FORMAT csv, HEADER true);"
