{{ config(alias = 'stg_parents') }}

with

source as (
    select *
    from {{ source('mt_prod','parents') }}
)

, renamed as (
    select
        -- ids
        id as parent_id

        -- strings
        , firstname as first_name
        , lastname as last_name
        , gender
        , activationcode as activation_code
        , heardaboutwebsite as heard_about_the_website_from
        , homeaddresscountry as home_address_country
        , homeaddresscounty as home_address_county
        , homeaddresspostcode as home_adress_post_code
        , homeaddresstown as home_adress_town
        , phonenumber as phone_number
        , signuproute as sign_up_route
        , status
        , timezone
        , email

        -- numerics
        , loginattemptscount as count_login_attempts
        , referralcreditamountunexpired as unexpired_referral_credit_amount
        , version

        -- booleans
        , agreedtoterms as has_agreed_to_terms
        , continuouspaymentenabled as has_continuous_payment_enabled
        , deletedfromintercom as is_deleted_from_intercom
        , didntknowitwasonline as is_didnt_know_it_was_online
        , dotmailerinactive as is_inactive_on_dotmail
        , hasdismissedautopaymentnotification as has_dismissed_atuo_payment_notifications
        , hasdismissedsharingnotification as has_dismissed_sharing_notifications
        , inactivityfeedbackrequestsent as has_inactivity_feedback_request_sent
        , intercomonboarding as has_intercom_onboarding
        , manualwelcomecontacted as is_manual_welcome_contacted
        , maturestudent as is_mature_student
        , receivetextnotifications as is_receive_text_notifications_on
        , shownemailverificationmodal as is_shown_email_verification
        , subscribedtomailinglist as is_subscribed_to_mailing_list
        , tutorialautomaticpaymentenabled as has_tutorial_automatic_payment_enabled
        , viewedtutorlistings as has_viewed_tutor_listings

        -- timestamps
        , lastmessagesentdate as last_message_sent_at
        , lastsyncedtointercom as last_synced_to_intercom_at
        , referralexpiresafter as referral_expires_at
        , sentwelcomeemailon as sent_welcome_email_at
        , welcomemessageread as welcome_message_read_at
        , modifiedon as modified_at

        -- metadata
        , activated::boolean as is_activated
        , convert_timezone('Europe/London', createdon) as created_at
        , convert_timezone('Europe/London', lastlogintime) as last_logged_in_at

    from source
)

select *
from renamed
