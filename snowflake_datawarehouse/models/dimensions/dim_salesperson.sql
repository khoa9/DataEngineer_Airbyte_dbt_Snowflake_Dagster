WITH latest_sales_quota AS (
    SELECT
        business_entity_id,
        MAX(quota_date) as latest_quota_date,
        MAX(sales_quota) as latest_sales_quota
    FROM {{ ref ('stg_salespersonquotahistory') }}
    GROUP BY 
        business_entity_id
)

SELECT
    s.business_entity_id as salesperson_key,
    e.birth_date,
    e.gender,
    e.hire_date,
    e.job_title,
    e.marital_status,
    e.organization_level,
    e.sick_leave_hours,
    e.vacation_hours,
    s.territory_id,
    s.sales_ytd,
    s.sales_last_year,
    COALESCE(s.sales_quota,0) as current_sales_quota, -- HANLDE NULL VALUE
    latest_quota_date,
    latest_sales_quota
FROM 
    {{ ref ('stg_salesperson')}} as s 
LEFT JOIN 
    {{ ref ('stg_employee')}} as e 
ON 
    s.business_entity_id = e.business_entity_id
LEFT JOIN 
    latest_sales_quota as lsq
ON 
    s.business_entity_id = lsq.business_entity_id
ORDER BY 
    e.birth_date