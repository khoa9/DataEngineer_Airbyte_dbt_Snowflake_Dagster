-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_SalesPerson') }}
)

-- Select only required columns
SELECT 
    businessentityid as business_entity_id,
    bonus,
    commissionpct as commission_pct,
    saleslastyear as sales_last_year,
    salesquota as sales_quota,
    salesytd as sales_ytd,
    territoryid as territory_id,
    rowguid as rowg_uid
FROM source 