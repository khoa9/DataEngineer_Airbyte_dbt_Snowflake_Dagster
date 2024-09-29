-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_SalesOrderDetail') }}
)

-- Select only required columns
SELECT 
    salesorderdetailid as sales_order_detail_id,
    salesorderid as sales_order_id,
    specialofferid as special_offer_id,
    unitprice as unit_price,
    unitpricediscount as unit_price_discount,
    carriertrackingnumber as carrier_tracking_number,
    linetotal as line_total,
    orderqty as order_quantity,
    productid as product_id,
    rowguid as rowg_uid
FROM source 
