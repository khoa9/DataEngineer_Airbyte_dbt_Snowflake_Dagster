SELECT 
    ps.product_subcategory_id as product_subcategory_key,
    ps.name as subcategory_name,
    ps.product_category_id as product_category_key,
    COUNT(p.product_id) AS subcategory_product_count,  -- Total number of products in the subcategory
    pc.name AS product_category_name 
FROM 
    {{ ref('stg_productsubcategory') }} as ps
LEFT JOIN 
    {{ ref('stg_productcategory') }} as pc
ON 
    ps.product_category_id = pc.product_category_id
LEFT JOIN 
    {{ ref('stg_product') }} as p
ON 
    ps.product_subcategory_id = p.product_subcategory_id
GROUP BY 
    ps.product_subcategory_id, ps.name, ps.product_category_id, pc.name
ORDER BY 
    ps.product_subcategory_id
