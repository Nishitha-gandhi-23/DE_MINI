WITH stg_country_cast AS (
    SELECT 
        CAST(customer_id AS NUMBER(38,0)) AS customer_id, 
        CAST(country AS VARCHAR(255)) AS country,
        CAST(region AS VARCHAR(255)) AS region
    FROM {{ source('raw', 'COUNTRY') }}
)

SELECT * FROM stg_country_cast
