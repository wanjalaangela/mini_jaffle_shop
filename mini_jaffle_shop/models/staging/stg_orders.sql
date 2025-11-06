
{{ config(materialized='view') }}

with source as (
    select * from {{ ref('raw_orders') }}
),

clean as (
    select
        id::int as order_id,
        user_id::int as customer_id,
        order_date::date as order_date,
        lower(nullif(status, ''))::text as status
    from source
)
select * from clean