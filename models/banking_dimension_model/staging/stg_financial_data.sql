{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_customers.sql
select *
from {{ source('bronze', 'FinancialData') }}
