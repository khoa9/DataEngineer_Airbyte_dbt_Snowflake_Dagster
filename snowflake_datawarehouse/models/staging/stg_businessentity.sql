-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_BusinessEntity') }}
)

-- Select only required columns
SELECT 
    DISTINCT businessentityid as business_entity_id
FROM source 
