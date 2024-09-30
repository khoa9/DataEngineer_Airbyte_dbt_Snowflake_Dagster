-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_Product') }}
)

-- Select only required columns
SELECT 
    productid as product_id,
    class,
    color,
    daystomanufacture as days_to_manufacture,
    discontinueddate as discontinued_date,
    finishedgoodsflag as finished_goods_flag,
    listprice as list_price,
    makeflag as make_flag,
    name,
    productline as product_line,
    productmodelid as product_model_id,
    productnumber as product_number,
    productsubcategoryid as product_subcategory_id,
    reorderpoint as reorder_point,
    rowguid as rowg_uid,
    safetystocklevel as safety_stock_level,
    sellenddate as sell_end_date,
    sellstartdate as sell_start_date,
    size,
    sizeunitmeasurecode as size_unit_measure_code,
    standardcost as standard_cost,
    style,
    weight,
    weightunitmeasurecode as weight_unit_measure_code
FROM source 
