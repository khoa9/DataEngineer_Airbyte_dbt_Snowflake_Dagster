WITH sales_order_header_cte AS (
    -- Gather sales order header data
    SELECT 
        sales_order_id,        -- Primary key for sales order
        customer_id,           -- FK to DimCustomer
        sales_person_id,       -- FK to DimSalesPerson
        territory_id,          -- FK to DimSalesTerritory
        currency_rate_id,
        TO_DATE(order_date) AS order_date,   -- Convert to date format YYYY-MM-DD
        TO_DATE(ship_date) AS ship_date,     -- Convert to date format YYYY-MM-DD
        TO_DATE(due_date) AS due_date,       -- Convert to date format YYYY-MM-DD
        order_status,          -- Order status
        online_order_flag,     -- Flag indicating if the order was placed online
        freight,               -- Freight cost
        sub_total,             -- Subtotal of the order
        tax_amount,            -- Tax amount at the order level
        total_due              -- Total amount due for the order
    FROM 
        {{ ref('stg_salesorderheader') }}     -- Staging sales order header
)

SELECT
    sales_order_id AS sales_order_key,
    customer_id AS customer_key,              -- FK to DimCustomer
    sales_person_id AS sales_person_key,      -- FK to DimSalesPerson
    territory_id AS territory_key,            -- FK to DimSalesTerritory
    currency_rate_id AS currency_rate_key,    -- FK to DimCurrencyRate
    order_date,
    ship_date,
    due_date,
    order_status,
    online_order_flag,
    freight,
    sub_total,
    tax_amount,  
    total_due         
FROM 
    sales_order_header_cte  -- Removed the semicolon here
