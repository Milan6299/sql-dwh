DROP PROCEDURE IF EXISTS silver.load_silver ();

CREATE OR REPLACE PROCEDURE silver.load_silver ()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time timestamp;
BEGIN
    RAISE NOTICE 'Loading Silver Layer:';
    start_time := clock_timestamp();
    TRUNCATE TABLE silver.crm_cust_info;
    INSERT INTO silver.crm_cust_info
    SELECT
        cst_id,
        cst_key,
        -- removing unwanted spaces
        trim(cst_firstname) AS cst_firstname,
        trim(cst_lastname) AS cst_lastname,
        -- data normalization and standardization + handling nulls
        CASE upper(trim(cst_marital_status))
        WHEN 'M' THEN
            'Married'
        WHEN 'S' THEN
            'Single'
        ELSE
            'n/a'
        END AS cst_marital_status,
        CASE upper(trim(cst_gndr))
        WHEN 'F' THEN
            'Female'
        WHEN 'M' THEN
            'Male'
        ELSE
            'n/a'
        END AS cst_gndr,
        cst_create_date
    FROM (
        -- identify and remove duplicates
        SELECT
            *,
            row_number() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS cnt
        FROM
            bronze.crm_cust_info)
    WHERE
        cnt = 1
        AND cst_id IS NOT NULL;
    COMMIT;
    RAISE NOTICE 'Time taken -> %', age(CURRENT_TIMESTAMP, start_time);
END;
$$;

-- CALL silver.load_silver ();
