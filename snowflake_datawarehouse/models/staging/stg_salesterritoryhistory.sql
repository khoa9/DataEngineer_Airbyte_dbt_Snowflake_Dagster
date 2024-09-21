-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_salesterritoryhistory') }}
)

-- Select only required columns
SELECT 
    territoryid as territory_id,
    businessentityid as business_entity_id,
    enddate as end_date,
    startdate as start_date,
    rowguid as rowg_uid
FROM source 