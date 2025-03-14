WITH Customer_revenue AS (
    SELECT 
        CUSTOMER_ID,
        CUSTOMER_NAME,
        SUM(REVENUE) AS total_revenue
    FROM {{ref('final_join')}} 
    WHERE REVENUE_TYPE=1
    GROUP BY CUSTOMER_ID,CUSTOMER_NAME

)
SELECT 
    CUSTOMER_ID,
    CUSTOMER_NAME,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM Customer_revenue 