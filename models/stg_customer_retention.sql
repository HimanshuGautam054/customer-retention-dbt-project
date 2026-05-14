{{config(
    materialized = 'view'
    )}}

select 
 custid,
 retained,
 date(created) as created_date,
 date(firstorder) as first_order_date,
 date(lastorder) as last_order_date,
 safe_cast(avgorder as float64) as avg_order_value,
 safe_cast(ordfreq as float64) as order_frequency,
 safe_cast(eopenrate as float64) as email_open_date,
 safe_cast(eclickrate as float64) as email_click_rate,
 paperless,
 refill,
 favday,
 city,
 case
    when favday = 'Monday' then 1
    when favday = 'Tuesday' then 2
    when favday = 'Wednesday' then 3
    when favday = 'Thursday' then 4
    when favday = 'Friday' then 5
    when favday = 'Saturday' then 6
    when favday = 'Sunday' then 7
end as favday_order

from {{ source('customer_retention_data','retention')}}