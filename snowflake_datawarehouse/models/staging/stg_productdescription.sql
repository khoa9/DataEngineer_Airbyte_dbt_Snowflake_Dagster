-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_productdescription') }}
)

-- Select only required columns
SELECT 
    productdescriptionid as product_description_id,
    description,
    rowguid as rowg_uid
FROM source 
