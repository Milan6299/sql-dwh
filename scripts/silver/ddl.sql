DROP PROCEDURE IF EXISTS silver.create_silver ();

CREATE OR REPLACE PROCEDURE silver.create_silver ()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Creating Silver Layer:';
    DROP TABLE IF EXISTS silver.crm_cust_info;
    CREATE TABLE silver.crm_cust_info (
        cst_id integer,
        cst_key varchar(20),
        cst_firstname varchar(50),
        cst_lastname varchar(50),
        cst_marital_status varchar(10),
        cst_gndr varchar(10),
        cst_create_date date,
        dwh_create_date timestamp DEFAULT CURRENT_TIMESTAMP
    );
            DROP TABLE IF EXISTS silver.crm_prd_info;
            CREATE TABLE silver.crm_prd_info (
                prd_id integer,
                prd_key varchar(50),
                prd_nm varchar(50),
                prd_cost numeric,
                prd_line varchar(10),
                prd_start_dt date,
                prd_end_dt date,
                dwh_create_date timestamp DEFAULT CURRENT_TIMESTAMP
            );
            DROP TABLE IF EXISTS silver.crm_sales_details;
            CREATE TABLE silver.crm_sales_details (
                sls_ord_num varchar(50),
                sls_prd_key varchar(50),
                sls_cust_id int,
                sls_order_dt int,
                sls_ship_dt int,
                sls_due_dt int,
                sls_sales int,
                sls_quantity int,
                sls_price int,
                dwh_create_date timestamp DEFAULT CURRENT_TIMESTAMP
            );
            DROP TABLE IF EXISTS silver.erp_cust_az12;
            CREATE TABLE silver.erp_cust_az12 (
                CID varchar(50),
                BDATE date,
                GEN varchar(10),
                dwh_create_date timestamp DEFAULT CURRENT_TIMESTAMP
            );
            DROP TABLE IF EXISTS silver.erp_loc_a101;
            CREATE TABLE silver.erp_loc_a101 (
                CID varchar(50),
                CNTRY varchar(100),
                dwh_create_date timestamp DEFAULT CURRENT_TIMESTAMP
            );
            DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
            CREATE TABLE silver.erp_px_cat_g1v2 (
                ID varchar(50),
                CAT varchar(50),
                SUBCAT varchar(50),
                MAINTENANCE varchar(10),
                dwh_create_date timestamp DEFAULT CURRENT_TIMESTAMP
            );
END;
$$;
