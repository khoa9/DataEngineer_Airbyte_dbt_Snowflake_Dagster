SELECT 
    c.customer_id as customer_key,
    c.account_number,
    p.first_name,
    p.last_name,
    p.middle_name,
    p.person_type,
    p.email_promotion,
    CASE
        WHEN p.email_promotion > 0 THEN 'Engaged'
        ELSE 'Non-Engaged' END AS email_promotion_segment,
    e.email_address,
    s.name as sales_location,
    CASE
        WHEN s.country_region_code ='US' then 'US'
        ELSe 'Non-US' END AS us_customer
FROM 
    {{ ref('stg_customer') }} as c 
LEFT JOIN 
    {{ ref('stg_person') }} as p 
ON 
    c.person_id = p.business_entity_id
LEFT JOIN 
    {{ ref('stg_emailaddress') }} as e 
ON 
    p.business_entity_id = e.business_entity_id
LEFT JOIN 
    {{ ref('stg_salesterritory') }} as s 
ON 
    c.territory_id = s.territory_id 
WHERE 
    c.person_id is not null 
