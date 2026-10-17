-- Testing Connection

-- To check if the initialization of db succeeded

SELECT
    current_database() AS database,
    CURRENT_USER AS username,
    version() AS postgres_version;
