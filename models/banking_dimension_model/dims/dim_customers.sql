{{ config(schema='DM', materialized='table') }}
select * from {{ ref('stg_customers') }}