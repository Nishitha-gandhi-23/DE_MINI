SELECT 
    t.customer_id,
    c.customer_name,
    cr.country,
    cr.region,
    t.product_id,
    p.product_family,
    p.product_sub_family,
    t.payment_month,
    t.revenue_type,
    t.revenue,
    t.quantity
FROM {{ ref('transform_transaction') }} t
LEFT JOIN {{ ref('transform_customers') }} c 
    ON t.customer_id = c.customer_id
LEFT JOIN {{ ref('transform_products') }} p 
    ON t.product_id = p.product_id
LEFT JOIN {{ ref('transform_country') }} cr
    ON t.customer_id = cr.customer_id 
WHERE 
    REVENUE_TYPE=1