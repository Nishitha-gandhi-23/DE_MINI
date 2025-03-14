SELECT
  COUNT(DISTINCT(customer_id)) AS new_customers,
FROM
    {{ref('final_join')}}
ORDER BY
    payment_month