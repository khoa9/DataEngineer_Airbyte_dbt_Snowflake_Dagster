SELECT
    c1.currency_rate_id,
    c1.currency_rate_date,
    c1.from_currency_code,
    c1.to_currency_code, 
    c2.name AS from_currency_name,
    c3.name AS to_currency_name,
    c1.average_rate,
    c1.end_of_day_rate
FROM 
    {{ ref('stg_currencyrate') }} AS c1 
LEFT JOIN 
    {{ ref('stg_currency') }} AS c2 
ON 
    c1.from_currency_code = c2.currency_code 
LEFT JOIN 
    {{ ref('stg_currency') }} AS c3 
ON 
    c1.to_currency_code = c3.currency_code