{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_customers.sql
select *
from {{ source('bronze', 'FinancialData') }}
WHERE TransactionID not in (select TransactionID from BANKING_DWH.GOLD.FACT_BANK_ASSET_DETAILS)
