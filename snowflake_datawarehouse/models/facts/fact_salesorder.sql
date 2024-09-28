WITH sales_order_header_cte AS (
    -- Gather sales order header data
    SELECT 
        sales_order_id,       -- Primary key for sales order
        customer_id,            -- FK to DimCustomer
        sales_person_id,     -- FK to DimSalesPerson
        territory_id,          -- FK to DimSalesTerritory
        TO_CHAR(order_date, 'YYYY/MM/DD') AS order_date,    -- Order date
        TO_CHAR(ship_date, 'YYYY/MM/DD')AS ship_date,      -- Ship date
        TO_CHAR(due_date, 'YYYY/MM/DD')AS due_date,        -- Due date
        order_status,               -- Order status
        online_order_flag, -- Flag indicating if the order was placed online
        freight,                              -- Freight cost
        sub_total,                -- Subtotal of the order
        tax_amount,          -- Tax amount at the order level
        total_due               -- Total amount due for the order
    FROM 
        {{ ref('stg_salesorderheader') }}     -- Staging sales order header
)

SELECT
    sales_order_id AS sales_order_key,
    customer_id AS customer_key,              -- FK to DimCustomer
    sales_person_id AS sales_person_key,      -- FK to DimSalesPerson
    territory_id AS territory_key,            -- FK to DimSalesTerritory
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
    sales_order_header_cte
