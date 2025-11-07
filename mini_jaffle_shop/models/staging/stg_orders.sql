{{ config(materialized='view') }}

select
  id::int as order_id,
  user_id::int as customer_id,
  order_date::date as order_date,
  lower(nullif(status, ''))::text as status
from {{ ref('raw_orders') }}
