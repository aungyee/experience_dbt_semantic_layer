{{ config(alias = 'students') }}

select * from {{ ref('stg_students') }}
