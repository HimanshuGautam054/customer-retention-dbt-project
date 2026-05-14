{{config(materialized = 'table')}}

select 
 count(distinct custid) as total_customers,
 count(distinct case 
          when order_frequency > 0 then custid
          end ) as  repeat_customers,
 round(( count(
    distinct case 
    when order_frequency > 0 then custid 
    end) *100.0 ) / count(distinct custid),2) as   repeate_customer_percentage,
 round(
    avg(case when order_frequency > 0 then order_frequency end),2
 ) as avg_repeat_customer_frequency

from 
{{ref('stg_customer_retention')}}
