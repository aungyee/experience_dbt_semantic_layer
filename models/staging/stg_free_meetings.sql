{{ config(alias = 'stg_free_meetings') }}

with

source as (
    select *
    from {{ source('mt_prod','meet_tutor_sessions') }}
)

, renamed as (
    select
        --ids
        id as free_meeting_id
        , tutor_id
        , parent_id
        , student_id
        , level_id
        , subject_id

        -- strings
        , status
        , initiatedby as initiated_by

        -- numerics
        , durationinminutes as duration_in_minutes

        -- booleans
        , bookedbyparent as is_booked_by_parent
        , cancelled as is_cancelled
        , confirmedbytutor as is_confirmed_by_tutor
        , expired as is_expired
        , notified as is_notified
        , respondedbytutor as has_tutor_response

        -- timestamps
        , convert_timezone('UTC', starttime) as starts_at
        , convert_timezone('UTC', endtime) as ends_at
        , convert_timezone('UTC', createdon) as created_at
        , convert_timezone('UTC', modifiedon) as modified_at
        , convert_timezone('UTC', respondedbytutordate) as tutor_response_sent_at
        , convert_timezone('UTC', smsapologysenttoparentdate) as sms_apology_sent_at
        , convert_timezone('UTC', smsnotificationsenttoparentdate) as sms_notification_sent_at
        , convert_timezone('UTC', techsetupsmssenttoparentdate) as tech_setup_sms_sent_at

    from source
)

select *
from renamed
