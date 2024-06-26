{{ config(alias = 'stg_students') }}

with

source as (
    select *
    from {{ source('mt_prod','students') }}
)

, renamed as (
    select
        -- ids
        id as student_id
        , parent_id

        -- strings
        , signuproute as sign_up_route
        , status

        -- booleans
        , activated as is_activated

        -- timestamps
        , date(dateofbirth) as date_of_birth
        , convert_timezone('UTC', createdon) as created_at
        , convert_timezone('UTC', modifiedon) as modified_at

    from source
)

select *
from renamed
