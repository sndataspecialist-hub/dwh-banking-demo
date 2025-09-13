{{ config(
    schema='GOLD',
    materialized = 'incremental',
    unique_key = 'TransactionID'
) }}

WITH source AS (

    SELECT
        TransactionID,
        Date,
        Country,
        Province,
        Branch,
        TypeCategory,
        AssetType,
        AssetID,
        CAST(AssetValue AS NUMERIC(18,2)) AS AssetValue,
        CAST(NPL_Flag AS NUMERIC(5,2)) AS NPL_Flag,
        CAST(Revenue AS NUMERIC(18,2)) AS Revenue,
        CAST(Expenses AS NUMERIC(18,2)) AS Expenses,
        CAST(Deposits AS NUMERIC(18,2)) AS Deposits,
        CAST(Withdrawals AS NUMERIC(18,2)) AS Withdrawals,
        CAST(InterestExpense AS NUMERIC(18,2)) AS InterestExpense
    FROM {{ ref('stg_financial_data') }} 

    {% if is_incremental() %}
        -- only load new rows on incremental runs
        WHERE TransactionID > (
            SELECT COALESCE(MAX(TransactionID), 0) FROM {{ this }}
        )
    {% endif %}

)

SELECT * FROM source

