-- Reference to the source created in source.yml file
WITH source AS (
    SELECT * 
    FROM {{ source('snowflake_src', 'src_SalesOrderHeader') }}
)

-- Select only the columns relevant for the FactSalesOrder table, including new columns
SELECT 
    salesorderid AS sales_order_id,    -- Surrogate key for the sales order
    orderdate AS order_date,           -- Date when the order was placed
    duedate AS due_date,               -- Date when the order is due
    shipdate AS ship_date,             -- Date when the order was shipped
    status AS order_status,            -- Status of the order (e.g., shipped, pending, etc.)
    onlineorderflag AS online_order_flag, -- Flag indicating if the order was placed online
    freight AS freight,                -- Freight charge for the order
    subtotal AS sub_total,             -- Subtotal before tax and freight
    taxamt AS tax_amount,              -- Total tax amount for the order
    totaldue AS total_due,             -- Total due amount including tax and freight
    customerid AS customer_id,         -- Foreign key to DimCustomer
    salespersonid AS sales_person_id,  -- Foreign key to DimSalesPerson
    territoryid AS territory_id,       -- Foreign key to DimSalesTerritory (if applicable)
    currencyrateid AS currency_rate_id          -- Foreign key to currency (e.g., USD, EUR)
FROM 
    source