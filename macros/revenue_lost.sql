{% macro calculate_revenue_loss(current_revenue, previous_revenue) %}
    ({{ previous_revenue }} - {{ current_revenue }})
{% endmacro %}