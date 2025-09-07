{{ config(schema='STAGE', materialized='view') }}

-- models/staging/stg_accounts.sql
select *
from {{ source('raw', 'Accounts') }}



