{{ config(schema='STAGE', materialized='view') }}

-- models/staging/stg_customers.sql
select *
from {{ source('raw', 'Customers') }}
