WITH last_trans AS(
    SELECT 
        customer_id,
        product_id,
        product_family,
        product_sub_family,
        payment_month,
        MAX(payment_month) AS lasttrans
    FROM
        {{ref("final_join")}}
    GROUP BY 
        customer_id,
        product_id,
        product_family,
        product_sub_family,
        payment_month
),
lead_gen AS(
    SELECT 
        lasttrans,
        customer_id,
        product_id,
        product_family,
        product_sub_family,
        payment_month,
        lead(payment_month) over(partition by customer_id order by payment_month) as leads from last_trans  )
        
SELECT customer_id,product_id,product_family,payment_month,leads,lasttrans from lead_gen where leads is null order by customer_id 