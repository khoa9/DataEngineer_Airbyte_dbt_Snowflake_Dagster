-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_person') }}
)

-- Select only required columns
SELECT 
    businessentityid as business_entity_id,
    additionalcontactinfo as additional_contact_info,
    demographics,
    emailpromotion as email_promotion,
    firstname as first_name,
    lastname as last_name,
    middlename as middle_name,
    namestyle as name_style,
    persontype as person_type,
    suffix,
    title,
    rowguid as rowg_uid
FROM source 
