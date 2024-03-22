-- stg_mt_prod__subjects

{{ config(alias = 'stg_subjects') }}

with

source as (
    select *
    from {{ source('mt_prod','subjects') }}
)

, renamed as (
    select
        -- ids
        id as subject_id

        -- strings
        , name as subject_name

        -- booleans
        , active as is_active
        , popular as is_popular

        -- timestamps
        , createdon as created_at
        , modifiedon as modified_at

    from source
)

select *
from renamed
