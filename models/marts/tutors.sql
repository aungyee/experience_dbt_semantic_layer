{{ config(alias = 'tutors') }}

select * from {{ ref('stg_tutors') }}
