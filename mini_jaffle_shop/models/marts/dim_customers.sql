{{ config(
    materialized='table'
) }}

WITH orders_summary AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date,
        COUNT(*) AS number_of_orders
    FROM {{ ref('stg_orders') }}
    GROUP BY customer_id
)

SELECT
    stg_customers.customer_id,
    stg_customers.first_name,
    stg_customers.last_name,
    orders_summary.first_order_date,
    orders_summary.most_recent_order_date,
    orders_summary.number_of_orders
FROM {{ ref('stg_customers') }}
LEFT JOIN orders_summary
    ON stg_customers.customer_id = orders_summary.customer_id