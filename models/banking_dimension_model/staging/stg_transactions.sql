{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_customers.sql
select *
from {{ source('bronze', 'Transactions') }}
WHERE TransactionID not in (select TransactionID from BANKING_DWH.GOLD.FACT_TRANSCATIONS)
