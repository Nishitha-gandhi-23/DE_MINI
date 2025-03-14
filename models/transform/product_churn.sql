WITH churn_customers AS (
    SELECT
        customer_id,
        previous_month,
        payment_month,
        revenue_type,
        year(payment_month) AS year,
        {{ datediff('previous_month','payment_month') }} AS difference,
        CASE
            WHEN difference>31 THEN 'churned'
            ELSE 'not churned'
        END AS churned_or_not
    FROM
        {{ ref('int_prod_trans') }}
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
 