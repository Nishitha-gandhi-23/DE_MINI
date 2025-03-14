SELECT *
FROM
{{ref("customer_churn")}} join {{ref('new_customer')}}