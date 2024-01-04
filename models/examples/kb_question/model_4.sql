select welcome_column
 , new_column 
 from {{ ref('model_3') }}