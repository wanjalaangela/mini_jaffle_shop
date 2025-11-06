

{{ config(materialized='view') }}

with source as (
    select * from {{ ref('raw_customers') }}
),

clean as (
    select
        id::int as customer_id,
        trim(first_name)::text as first_name,
        trim(last_name)::text as last_name
    from source
)
select * from clean


