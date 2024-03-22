{{ config(alias = 'lessons') }}

with

lessons as (
    select
        stg_lessons.*
        , stg_students.parent_id
    from {{ ref('stg_lessons') }}
    left join {{ ref('stg_students') }}
        on stg_lessons.student_id = stg_students.student_id
)

select *
from lessons
