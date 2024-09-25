WITH state_count AS (
    SELECT
        territory_id,
        COUNT(state_province_id) as state_count
    FROM 
        {{ ref ('stg_stateprovince') }}
    GROUP BY
        territory_id 
)

SELECT 
    s1.territory_id as territory_key,
    s1.country_region_code,
    s1.group_name,
    s1.name,
    s1.sales_last_year,
    s1.sales_ytd,
    s2.state_count,
    RANK() OVER (PARTITION BY s1.group_name ORDER BY s1.sales_last_year) as sales_ranking_last_year,
    RANK() OVER (PARTITION BY s1.group_name ORDER BY s1.sales_ytd) as sales_ranking_ytd
FROM 
    {{ ref ('stg_salesterritory') }} as s1
LEFT JOIN
    state_count as s2
ON 
    s1.territory_id = s2.territory_id
