
WITH churn_customers AS (
    SELECT
        customer_id,
        LAG(PAYMENT_MONTH) OVER (PARTITION BY CUSTOMER_ID ORDER BY PAYMENT_MONTH) AS previous_month,
        payment_month,
        revenue_type,
        year(payment_month) AS year,
         datediff(month,previous_month,payment_month) AS difference,
        CASE
            WHEN difference>3 THEN 'churned'
            ELSE 'not churned'
        END AS churned_or_not
    FROM
        {{ref('final_join')}}
    WHERE
        revenue_type=1
)
 
SELECT
    year,
    MONTH(payment_month) as month,
    COUNT(customer_id) AS number_of_churned_customers,
FROM  
    churn_customers
WHERE
    churned_or_not='churned'
GROUP BY
    year,month
ORDER BY
    year,month

-- WITH transactions AS (
--     SELECT DISTINCT CUSTOMER_ID, PAYMENT_MONTH
--     FROM {{ ref('transform_transaction') }}
-- ),
-- customer_activity AS (
--     SELECT
--         CUSTOMER_ID,
--         PAYMENT_MONTH,
--         LAG(PAYMENT_MONTH) OVER (PARTITION BY CUSTOMER_ID ORDER BY PAYMENT_MONTH) AS prev_purchase
--     FROM transactions
-- )
-- SELECT
--     CUSTOMER_ID,
--     PAYMENT_MONTH,
--     CASE
--         WHEN prev_purchase IS NULL THEN 'New Customer'
--         WHEN DATEDIFF(month, prev_purchase, PAYMENT_MONTH) > 6 THEN 'Churned Customer'
--         ELSE 'Returning Customer'
--     END AS customer_status
-- FROM customer_activity