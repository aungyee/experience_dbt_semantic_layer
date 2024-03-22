-- stg_mt_prod__tutoring_level_types

{{ config(schema = 'staging', materialized = 'view', alias = 'stg_levels') }}

with

source as (
    select *
    from {{ source('mt_prod', 'tutoringleveltypes') }}
)

, renamed as (
    select
        -- ids
        id as level_id

        -- strings
        , name as level_name

        -- numerics
        , keystage as key_stage

        -- boolean
        , active as is_active

        -- timestamps
        , convert_timezone('UTC', createdon) as created_at
        , convert_timezone('UTC', modifiedon) as modified_at

    from source
)

select *
from renamed
