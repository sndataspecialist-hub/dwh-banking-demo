{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_accounts.sql
select *
from {{ source('bronze', 'Accounts') }}



