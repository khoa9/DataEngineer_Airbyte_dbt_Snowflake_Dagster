-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_salesorderheader') }}
)

-- Select only required columns
SELECT 
    salesorderid as sales_order_id,
    orderdate as order_date,
    duedate as due_date,
    shipdate as ship_date,
    status as order_status,
    customerid as customer_id,
    salespersonid as sales_person_id,
    billtoaddressid as bill_to_address_id,
    shiptoaddressid as ship_to_address_id
FROM source
