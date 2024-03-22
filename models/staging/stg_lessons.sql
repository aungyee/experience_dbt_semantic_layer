{{ config(alias = 'stg_lessons') }}

with

source as (
    select *
    from {{ source('mt_prod','classbookings') }}
)

, renamed as (
    select
        -- ids
        id as uk_b2c_tutorial_id
        , tutor_id
        , student_id
        , subject_id
        , level_id

        -- strings
        , initiatedby as initiated_by
        , status
        , type as lesson_type
        , notes
        , cancelledby as cancelled_by

        -- numerics
        , classcost as class_cost
        , tutorcost as tutor_cost
        , tutordiscount as tutor_discount
        , durationinminutes as duration_in_minutes
        , mentorcost as mentor_cost
        , mentordiscount as mentor_discount
        , mtwdiscount as mtw_discount
        , mtwmargin as mtw_margin
        , vatonmtwmargin as vat_on_mtw_margin

        -- booleans
        , bookedbyparent as was_booked_by_parent
        , cancelled as was_cancelled
        , cancelledbyadmin as was_cancelled_by_admin
        , cancelledbytutor as was_cancelled_by_tutor
        , completed as was_completed
        , confirmedbytutor as was_confirmed_by_tutor
        , expired as was_expired
        , feedbackpromptrespondedbyparent as was_feedback_prompt_responded_by_parent
        , feedbackpromptrespondedbystudent as was_feedback_prompt_responded_by_student
        , notified as was_notified
        , tutordeclined as has_tutor_declined
        , originalconfirmedbytutor as was_original_confirmed_by_tutor
        , paidfor as was_tutorial_paid_for
        , tutorpaidnotificationsent as was_tutor_paid_notification_sent
        , tutorpaid as was_tutor_paid

        -- timestamps
        , createdon as created_at
        , modifiedon as modified_at
        , completedondate as completed_at
        , cancelleddate as cancelled_at
        , confirmedbytutordate as confirmed_by_tutor_at
        , starttime as starts_at
        , endtime as ends_at
        , paidforondate as paid_for_at
        , originalendtime as original_ends_at
        , originalstarttime as original_starts_at
        , tutorpaiddate as tutor_paid_at

    from source
)

select *
from renamed
