#!/usr/bin/env bash
# This script is to load data into bronze layer from local csv files.

# Caution: This drops existing and creates new tables + loads data into them. Be careful before running.

# The reason we had to opt for bash scripts is because we are using docker to run a postgres container
# The container is non volatile and will persist data but it cannot read our local filesytem
# It has it's dedicated volume so we send data (i.e to be imported) via database_url connection

# failure at any point will stop the script
set -euo pipefail

project_path="$HOME/projects/dwh_sql"

# Load .env and export its variables to child processes.
set -a
source "${project_path}/.env"
set +a

# if no $DATABASE_URL is found then abort
# make sure .env file contains a $DATABASE_URL field
if [[ -z "${DATABASE_URL:-}" ]]; then
  echo "Error: DATABASE_URL is not set." >&2
  exit 1
fi

dataset_path="${project_path}/datasets"

# Create the bronze tables.
psql "$DATABASE_URL" -f "${project_path}/scripts/bronze/ddl.sql"
code="$?"
if [ $code == 1 ]; then
  echo "Unable to create tables!"
  exit 1
fi
echo "Created tables successfully!"

# A helper function to load csv -> db
load_to_db() {
  local tb_name="$1"
  local file_path="$2"

  if [[ -z "$tb_name" || -z "$file_path" ]]; then
    echo "Error: provide both a table name and a file path." >&2
    return 1
  fi

  psql "$DATABASE_URL" -c "\copy ${tb_name} FROM '${file_path}' WITH (FORMAT csv, HEADER true)"
  echo "Loaded ${tb_name} successfully!"
}

echo "Loading data to db....."

# CRM
echo ""
echo "Loading CRM:"
load_to_db bronze.crm_cust_info "${dataset_path}/source_crm/cust_info.csv"
load_to_db bronze.crm_prd_info "${dataset_path}/source_crm/prd_info.csv"
load_to_db bronze.crm_sales_details "${dataset_path}/source_crm/sales_details.csv"

# ERP
echo ""
echo "Loading ERP:"
load_to_db bronze.erp_cust_az12 "${dataset_path}/source_erp/CUST_AZ12.csv"
load_to_db bronze.erp_loc_a101 "${dataset_path}/source_erp/LOC_A101.csv"
load_to_db bronze.erp_px_cat_g1v2 "${dataset_path}/source_erp/PX_CAT_G1V2.csv"
