{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_accounts.sql
with base_table as (
select {{ dbt_utils.generate_surrogate_key(['ACCOUNTID', 'CUSTOMERID', 'ACCOUNTTYPE','BALANCE']) }} as account_sk
,a.*
from {{ source('bronze', 'Accounts') }} a

)
select * from base_table 
