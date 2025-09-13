{{ config(
    schema='GOLD',
    materialized='table') }}
   
   
   SELECT DISTINCT
    t.TransactionID,
    t.TxnDate,
    t.Amount,
    t.TxnType,
    a.AccountID,
    a.AccountType,
    c.CustomerID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.City
FROM {{ ref('stg_transactions') }} t
JOIN {{ ref('stg_accounts') }} a 
    ON t.AccountID = a.AccountID
JOIN {{ ref('stg_customers') }} c 
    ON a.CustomerID = c.CustomerID
