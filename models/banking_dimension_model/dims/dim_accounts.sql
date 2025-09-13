{{ config(schema='GOLD', materialized='table') }}
select 
   a.* from {{ ref('stg_accounts') }} a