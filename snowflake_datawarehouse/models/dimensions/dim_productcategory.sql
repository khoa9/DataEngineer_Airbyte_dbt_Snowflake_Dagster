SELECT 
    pc.product_category_id as product_category_key,
    pc.name as category_name,
    COUNT(p.product_id) AS product_count,  -- Total number of products in the category
    COUNT(CASE 
            WHEN p.discontinued_date IS NULL THEN 1 
            ELSE NULL END) 
            AS active_products  -- Count of active products
FROM 
    {{ ref('stg_productcategory') }} as pc
LEFT JOIN 
    {{ ref('stg_productsubcategory') }} as ps
ON 
    pc.product_category_id = ps.product_category_id
LEFT JOIN 
    {{ ref('stg_product') }} as p
ON 
    ps.product_subcategory_id = p.product_subcategory_id
GROUP BY 
    pc.product_category_id, pc.name
ORDER BY  
    pc.product_category_id
