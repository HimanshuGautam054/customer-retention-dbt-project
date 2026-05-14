{{config(materialized ='table')}}

select 
 count(distinct custid) as total_customers,
 sum(retained) as retained_customers,
 count(distinct custid) - sum(retained) as churned_customers,
 round((sum(retained)*100.0) / count(distinct custid),2 ) as retention_rate,
 round(((count(distinct custid) - sum(retained)) * 100.0) / count(distinct custid),2) 
 as churn_rate,
 round(avg(avg_order_value), 2) as avg_order_value,
 round(avg(order_frequency), 2) as avg_order_frequency

from {{ ref('stg_customer_retention') }}