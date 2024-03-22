{{ config(alias = 'levels') }}

select * from {{ ref('stg_levels') }}
