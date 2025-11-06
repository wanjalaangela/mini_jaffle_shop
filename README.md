# mini_jaffle_shop
A dbt project that transforms raw customer, order and payments data from the jaffle shop into clean analysis-ready models. It includes staging, marts, tests, and documentation.

## : Models Overview
### : **Staging Models**
These models clean and standardize raw source data:
- **`stg_customers.sql`** – selects and renames customer fields. 
- **`stg_orders.sql`** – standardizes order data and status. 
- **`stg_payments.sql`** – converts payment amounts into USD.
### : **Marts Models**
These models combine staging data into analytical views:
- **`dim_customers.sql`** – builds a customer dimension table with order history.
- **`fct_orders.sql`** – creates a fact table with total payments per completed order.
---
## : Tests & Documentation
Each model is documented and tested using `.yml` files:
- **Tests:** ensure data consistency and validity (e.g. unique keys, non-null checks).
- **Documentation:** describes model purpose and key fields.
