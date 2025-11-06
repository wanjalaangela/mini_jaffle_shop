{{ config(
    materialized='table'
) }}

WITH completed_orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
    WHERE status = 'completed'
),

payments_aggregated AS (
    SELECT
        order_id,
        SUM(amount_usd) AS total_amount
    FROM {{ ref('stg_payments') }}
    GROUP BY order_id
)

SELECT
    completed_orders.order_id,
    completed_orders.customer_id,
    completed_orders.order_date,
    COALESCE(payments_aggregated.total_amount, 0) AS total_amount
FROM completed_orders
LEFT JOIN payments_aggregated
    ON completed_orders.order_id = payments_aggregated.order_id