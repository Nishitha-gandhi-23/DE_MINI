WITH transformed_transactions AS (
    SELECT 
        CUSTOMER_ID,
        PRODUCT_ID,
        PAYMENT_MONTH,
        REVENUE_TYPE,
        REVENUE,
        QUANTITY
    FROM  {{ ref('stg_transaction') }}
    WHERE 
        CUSTOMER_ID IS NOT NULL 
        AND PRODUCT_ID IS NOT NULL 
)
SELECT * FROM transformed_transactions