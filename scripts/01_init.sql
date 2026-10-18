-- Create schemas
-- Create all the require schemas for the Medallion Warehouse Model
BEGIN;

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE SCHEMA IF NOT EXISTS silver;

CREATE SCHEMA IF NOT EXISTS gold;

COMMIT;

