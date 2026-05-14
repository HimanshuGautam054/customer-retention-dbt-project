{{config(materialized = 'table')}}

select 
 custid,
 round(avg_order_value,2) as avg_order_value,
 round(order_frequency,2) as order_frequency,
 round(
    avg_order_value* order_frequency,2
 ) as estimated_clv

from 
{{ref('stg_customer_retention')}} 