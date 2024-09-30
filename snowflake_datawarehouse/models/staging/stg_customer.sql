-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_Customer') }}
)

-- Select only required columns
SELECT 
    customerid as customer_id,
    personid as person_id,
    rowguid as rowg_uid,
    accountnumber as account_number,
    storeid as store_id,
    territoryid as territory_id
FROM source 
