{{ config(schema='GOLD', materialized='table') }}
select * from {{ ref('stg_accounts') }}