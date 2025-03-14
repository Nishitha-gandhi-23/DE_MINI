WITH transformed_products AS (
    SELECT 
        PRODUCT_ID,
        PRODUCT_FAMILY,
        PRODUCT_SUB_FAMILY
    FROM  {{ ref('stg_products') }}
    WHERE 
        PRODUCT_ID IS NOT NULL 
)
SELECT * FROM transformed_products