-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_Currency') }}
)

-- Select only required columns
SELECT 
    currencycode as currency_code,
    name
FROM source 
