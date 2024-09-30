-- Reference to the source created in source.yml file
with source as (
    SELECT * FROM {{ source('snowflake_src', 'src_Employee') }}
)

-- Select only required columns
SELECT 
    businessentityid as business_entity_id,
    birthdate as birth_date,
    currentflag as current_flag,
    gender,
    hiredate as hire_date,
    jobtitle as job_title,
    loginid as login_id,
    maritalstatus as marital_status,
    nationalidnumber as national_id_number,
    organizationlevel as organization_level,
    organizationnode as organization_node,
    salariedflag as salaried_flag,
    sickleavehours as sick_leave_hours,
    vacationhours as vacation_hours,
    rowguid as rowg_uid
FROM source 
