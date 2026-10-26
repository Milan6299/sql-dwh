CALL silver.create_silver ();

CALL silver.load_silver ();

SELECT
    Count(*)
FROM
    silver.crm_cust_info;

SELECT
    *
FROM
    silver.crm_cust_info
LIMIT 10;

