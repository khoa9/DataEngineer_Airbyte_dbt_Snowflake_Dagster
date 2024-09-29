-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_ProductSubcategory') }}
)

-- Select only required columns
SELECT 
    productsubcategoryid as product_subcategory_id,
    productcategoryid as product_category_id,
    name,
    rowguid as rowg_uid
FROM source 
