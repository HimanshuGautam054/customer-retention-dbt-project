{{config(materialized='table')}}

select
 format_date('%Y-%m', first_order_date) as cohort_month,
 count(distinct custid) as total_customers,
 sum(retained) as retained_customers,
 round((sum(retained)*100.0)/ count(distinct custid),2) as retained_rate
 from 
  {{ref('stg_customer_retention')}}

group by 1
order by 1  