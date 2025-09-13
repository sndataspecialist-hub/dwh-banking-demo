{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_customers.sql
select *,row_number() over(order by date) as TransactionID
from {{ source('bronze', 'FinancialData') }}
