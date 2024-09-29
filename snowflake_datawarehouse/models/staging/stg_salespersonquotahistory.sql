-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_SalesPersonQuotaHistory') }}
)

-- Select only required columns
SELECT 
    businessentityid as business_entity_id,
    quotadate as quota_date,
    salesquota as sales_quota,
    rowguid as rowg_uid
FROM source 