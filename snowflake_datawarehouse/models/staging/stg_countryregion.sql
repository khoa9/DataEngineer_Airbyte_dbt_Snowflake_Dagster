-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_countryregion') }}
)

-- Select only required columns
SELECT 
    countryregioncode as country_region_code,
    name
FROM source 
