
WITH MonthlyRevenue AS (
   SELECT
      t.payment_month,
      SUM(t.revenue) AS total_revenue
   FROM transform_transaction t
   GROUP BY t.payment_month
),
RevenueChange AS (
   SELECT
      payment_month,
      total_revenue,
      LAG(total_revenue) OVER (ORDER BY payment_month) AS previous_month_revenue,
      {{calculate_revenue_loss('total_revenue','previous_month_revenue')}} AS revenue_lost
   FROM MonthlyRevenue
)
SELECT
   payment_month,
   total_revenue,
   previous_month_revenue,
   revenue_lost
FROM RevenueChange
WHERE revenue_lost > 0
ORDER BY payment_month