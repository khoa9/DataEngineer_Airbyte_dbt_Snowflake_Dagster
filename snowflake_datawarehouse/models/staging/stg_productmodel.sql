with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_ProductModel') }}
)

-- Select only required columns
SELECT 
    productmodelid as product_model_id,
    name 
FROM source 