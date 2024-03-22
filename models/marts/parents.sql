{{ config(alias = 'parents') }}

select * from {{ ref('stg_parents') }}
