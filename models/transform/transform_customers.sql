WITH transformed_customers AS (
    SELECT
        CUSTOMER_ID,
        REGEXP_REPLACE(CUSTOMERNAME, '[,/0-9]', '') AS CUSTOMER_NAME
    FROM {{ ref('stg_customers') }}
    WHERE CUSTOMER_ID IS NOT NULL
        AND CUSTOMERNAME IS NOT NULL
)
SELECT * FROM transformed_customers