select *
--, 'new_column' as new_column

 from {{ ref('model_1') }}