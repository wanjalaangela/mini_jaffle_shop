{{ config(materialized='view') }}

select
  id::int as customer_id,
  trim(first_name)::text as first_name,
  trim(last_name)::text as last_name
from {{ ref('raw_customers') }}
