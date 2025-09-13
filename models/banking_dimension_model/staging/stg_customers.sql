{{ config(schema='SILVER', materialized='view') }}

-- models/staging/stg_customers.sql
with base_table as (
select {{ dbt_utils.generate_surrogate_key(['CUSTOMERID', 'FIRSTNAME', 'LASTNAME','DOB', 'CITY']) }} as customer_sk
,a.*
from {{ source('bronze', 'Customers') }} a
)



select * from base_table 
