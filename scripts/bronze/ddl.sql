BEGIN;

DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id integer,
    cst_key varchar(20),
    cst_firstname varchar(50),
    cst_lastname varchar(50),
    cst_marital_status varchar(10),
    cst_gndr varchar(10),
    cst_create_date date
);

DROP TABLE IF EXISTS bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id integer,
    prd_key varchar(50),
    prd_nm varchar(50),
    prd_cost numeric,
    prd_line varchar(10),
    prd_start_dt date,
    prd_end_dt date
);

DROP TABLE IF EXISTS bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num varchar(50),
    sls_prd_key varchar(50),
    sls_cust_id int,
    sls_order_dt int,
    sls_ship_dt int,
    sls_due_dt int,
    sls_sales int,
    sls_quantity int,
    sls_price int
);

DROP TABLE IF EXISTS bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    CID varchar(50),
    BDATE date,
    GEN varchar(10)
);

DROP TABLE IF EXISTS bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    CID varchar(50),
    CNTRY varchar(100)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID varchar(50),
    CAT varchar(50),
    SUBCAT varchar(50),
    MAINTENANCE varchar(10)
);

COMMIT;
