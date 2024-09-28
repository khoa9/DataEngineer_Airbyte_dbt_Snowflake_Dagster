SELECT 
    p.product_id as product_key,
    p.name as product_name,
    p.product_number as product_number,
    pm.name as product_model,  
    ps.product_subcategory_id as product_subcategory_key, 
    ps.name as subcategory_name,  
    pc.product_category_id as product_category_key,  
    pc.name as category_name, 
    DATEDIFF(year, p.sell_start_date, CURRENT_DATE) as product_age,  -- Product age in years
    p.list_price as list_price,
    p.standard_cost as standard_cost,
    CASE 
        WHEN p.list_price = 0 THEN NULL
        ELSE ROUND((p.list_price - p.standard_cost),3)
    END AS gross_profit,  -- Gross profit

    CASE 
        WHEN p.list_price = 0 THEN NULL
        ELSE ROUND(((p.list_price - p.standard_cost) / p.list_price),3)
    END AS gross_margin,  -- Gross margin calculation

FROM 
    {{ ref('stg_product') }} as p
LEFT JOIN 
    {{ ref('stg_productmodel') }} as pm
ON 
    p.product_model_id = pm.product_model_id
LEFT JOIN 
    {{ ref('stg_productsubcategory') }} as ps
ON 
    p.product_subcategory_id = ps.product_subcategory_id
LEFT JOIN 
    {{ ref('stg_productcategory') }} as pc
ON 
    ps.product_category_id = pc.product_category_id
