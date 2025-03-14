WITH stg_customer_cast AS (
    SELECT 
        CAST(company AS VARCHAR(255)) AS company, 
        CAST(customer_id AS NUMBER(38,0)) AS customer_id,
        CAST(customername AS VARCHAR(255)) AS customername
    FROM {{ source('raw', 'CUSTOMERS') }}
)

SELECT * FROM stg_customer_cast
