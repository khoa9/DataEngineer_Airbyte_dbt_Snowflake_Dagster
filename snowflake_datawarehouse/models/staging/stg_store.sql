-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_store') }}
)

-- Select only required columns
SELECT 
    businessentityid as business_entity_id,
    demographics,
    name,
    salespersonid as sales_person_id,
    rowguid as rowg_uid
FROM source 
