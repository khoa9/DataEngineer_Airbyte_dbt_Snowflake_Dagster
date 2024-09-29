-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_EmailAddress') }}
)

-- Select only required columns
SELECT 
    emailaddressid as email_address_id,
    businessentityid as business_entity_id,
    rowguid as rowg_uid,
    emailaddress as email_address
FROM source 
