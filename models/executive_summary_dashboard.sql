{{ config(
    materialized = 'table'
) }}

select
    s.custid,
    s.city,
    s.favday,
    s.paperless,
    s.refill,
    s.avg_order_value,
    s.order_frequency,
    s.favday_order as Favourite_day,

    c.total_customers,
    c.retained_customers,
    c.churned_customers,
    c.retention_rate,
    c.churn_rate,
    c.avg_order_value as overall_avg_order_value,
    c.avg_order_frequency as overall_avg_order_frequency

from {{ ref('stg_customer_retention') }} s

cross join {{ ref('customer_retention_summary') }} c