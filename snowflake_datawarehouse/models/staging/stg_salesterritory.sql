-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_SalesTerritory') }}
)

-- Select only required columns
SELECT 
    territoryid as territory_id,
    costlastyear as cost_last_year,
    costytd as cost_ytd,
    countryregioncode as country_region_code,
    "GROUP" as group_name,
    name,
    saleslastyear as sales_last_year,
    salesytd as sales_ytd,
    rowguid as rowg_uid
FROM source 