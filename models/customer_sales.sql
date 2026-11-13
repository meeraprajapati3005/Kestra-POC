select
    c.customer_id,
    c.customer_name,
    count(o.order_id) as total_orders,
    sum(o.quantity) as total_quantity
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o
  on c.customer_id = o.customer_id
group by 1,2