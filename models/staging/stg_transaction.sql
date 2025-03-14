WITH stg_transactions_cast AS (
    SELECT 
        CAST(customer_id AS NUMBER(38,0)) AS customer_id, 
        CAST(product_id AS VARCHAR(255)) AS product_id,
        CAST(payment_month AS DATE) AS payment_month,
        CAST(revenue_type AS NUMBER(38,0)) AS revenue_type,
        CAST(revenue AS FLOAT) AS revenue,
        CAST(quantity AS NUMBER(38,0)) AS quantity,
    FROM {{ source('raw', 'TRANSACTIONS') }}
)

SELECT * FROM stg_transactions_cast
