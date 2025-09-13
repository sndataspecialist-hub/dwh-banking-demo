{% snapshot dim_customers %}

{{
    config(
      target_schema='GOLD',
      unique_key='CUSTOMERID',
      strategy='timestamp',
      updated_at='CREATE_DATE'
    )
}}

select * from {{ ref('stg_customers') }}

{% endsnapshot %}
