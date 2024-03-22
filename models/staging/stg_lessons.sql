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
        , convert_timezone('UTC', createdon) as created_at
        , convert_timezone('UTC', modifiedon) as modified_at
        , convert_timezone('UTC', completedondate) as completed_at
        , convert_timezone('UTC', cancelleddate) as cancelled_at
        , convert_timezone('UTC', confirmedbytutordate) as confirmed_by_tutor_at
        , convert_timezone('UTC', starttime) as starts_at
        , convert_timezone('UTC', endtime) as ends_at
        , convert_timezone('UTC', paidforondate) as paid_for_at
        , convert_timezone('UTC', originalendtime) as original_ends_at
        , convert_timezone('UTC', originalstarttime) as original_starts_at
        , convert_timezone('UTC', tutorpaiddate) as tutor_paid_at

    from source
)

select *
from renamed
