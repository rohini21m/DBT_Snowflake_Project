-- lets create leaves marts,  & make leaves as fact table 
with leave_data as (
    select
        leave_id,
        employee_id,
        leave_date,
        standard_leave_type,
        is_paid,
        days_taken,
        source_updated_at
    from {{ ref('intermediate_leave') }}
)
select 
    leave_id,
    employee_id,
    standard_leave_type,
    is_paid,
    leave_date,
    days_taken,
    {{hours_on_leave('days_taken')}} as hours_on_leave,-- added one more column by using a reusable function in macros folder 
    source_updated_at
    from leave_data
