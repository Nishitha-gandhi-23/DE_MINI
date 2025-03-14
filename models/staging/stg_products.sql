WITH stg_products_cast AS (
    SELECT 
        CAST(product_id AS VARCHAR(255)) AS product_id, 
        CAST(product_family AS VARCHAR(255)) AS product_family,
        CAST(product_sub_family AS VARCHAR(255)) AS product_sub_family
    FROM {{ source('raw', 'PRODUCTS') }}
)

SELECT * FROM stg_products_cast
