-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_currencyrate') }}
)

-- Select only required columns
SELECT 
    currencyrateid as currency_rate_id,
    currencyratedate as currency_rate_date,
    fromcurrencycode as from_currency_code,
    tocurrencycode as to_currency_code,
    averagerate as average_rate,
    endofdayrate as end_of_day_rate,
    modifieddate as modified_date
FROM source