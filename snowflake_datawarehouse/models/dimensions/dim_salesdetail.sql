SELECT
    sod.sales_order_detail_id AS sales_detail_key,                -- Sales order detail ID (unique per line item)
    sod.sales_order_id AS sales_order_key,       -- FK to FactSalesOrderHeader
    sod.product_id AS product_key,            -- FK to DimProduct
    sod.order_quantity,                       -- Quantity of the product ordered
    sod.unit_price,                           -- Price per unit of the product
    sod.unit_price_discount,                  -- Discount applied to the unit price
    (sod.order_quantity * sod.unit_price) AS sales_amount,  -- Total sales amount
    (sod.order_quantity * sod.unit_price_discount) AS discount_amount,  -- Total discount amount
    sod.line_total                           -- Line total (existing field)

FROM 
    {{ ref('stg_salesorderdetail') }} AS sod  -- Staging sales order details
