{{ config(alias = 'stg_tutors') }}

with

source as (
    select *
    from {{ source('mt_prod', 'tutors') }}
)

, renamed as (
    select
        -- ids
        id as tutor_id

        -- strings
        , status
        , schoolstatus as b2b_status
        , dbsstatus as dbs_status
        , referencecheckstatus as reference_check_status
        , nationality
        , case
            when tieredpayband_id = 1 then 'Base'
            when tieredpayband_id = 2 then 'Bronze'
            when tieredpayband_id = 3 then 'Silver'
            when tieredpayband_id = 4 then 'Gold'
            when tieredpayband_id = 5 then 'Diamond'
        end as tiered_pay_band

        -- dates
        , date(dateofbirth) as date_of_birth

        -- timestamps
        , convert_timezone('UTC', createdon) as created_at
        , convert_timezone('UTC', modifiedon) as modified_at

    from source
)

select *
from renamed
