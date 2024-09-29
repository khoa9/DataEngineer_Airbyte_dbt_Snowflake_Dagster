-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_StateProvince') }}
)

-- Select only required columns
SELECT 
    countryregioncode as country_region_code,
    isonlystateprovinceflag as is_only_state_province_flag,
    name,
    stateprovincecode as state_province_code,
    stateprovinceid as state_province_id,
    territoryid as territory_id,
    rowguid as rowg_uid
FROM source 
