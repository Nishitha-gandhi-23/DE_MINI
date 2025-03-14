WITH transformed_country AS (
    SELECT
        CUSTOMER_ID,
        TRIM(COUNTRY) AS COUNTRY,
        TRIM(REGION) AS REGION
    FROM {{ ref('stg_country') }}
    WHERE CUSTOMER_ID IS NOT NULL
)
SELECT * FROM transformed_country