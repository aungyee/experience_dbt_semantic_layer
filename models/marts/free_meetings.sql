{{ config(alias = 'free_meetings') }}

select * from {{ ref('stg_free_meetings') }}
