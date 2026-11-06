-- generate 'hours_on_leave' column from 'days_taken'

{% macro hours_on_leave(days_taken_column) %} -- can use column name days_taken if it is not gonna be used for column creation.
 ({{days_taken_column}}*8)
{%endmacro%}

--(If you absolutely know you will never reuse this macro for another column, you can hardcode the SQL column name directly inside the macro like this:


--)
