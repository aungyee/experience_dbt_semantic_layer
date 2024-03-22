{{ config(alias = 'subjects') }}

select * from {{ ref('stg_subjects') }}
