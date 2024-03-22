{{ config(alias = 'stg_parents') }}

with

source as (
    select *
    from {{ source('mt_prod','parents') }}
)

, renamed as (
    select
        -- ids
        id as parent_id

        -- strings
        , gender
        , homeaddresscountry as home_address_country
        , homeaddresscounty as home_address_county
        , homeaddresspostcode as home_adress_post_code
        , homeaddresstown as home_adress_town
        , signuproute as sign_up_route
        , status

        -- booleans
        , maturestudent as is_mature_student
        , activated::boolean as is_activated

        -- timestamps
        , convert_timezone('UTC', createdon) as created_at
        , convert_timezone('UTC', modifiedon) as modified_at
        , convert_timezone('UTC', lastlogintime) as last_logged_in_at

    from source
)

select *
from renamed
