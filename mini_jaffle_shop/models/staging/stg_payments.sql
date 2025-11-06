
{{ config(materialized='view') }}

with source as (
    select * from {{ ref('raw_payments') }}
),
clean as (
    select
        id::int as payment_id,
        order_id::int as order_id,
        trim(payment_method)::text as payment_method,
        round((amount::numeric / 100.0), 2)::numeric(10,2) as amount_usd
    from source
)
select * from clean