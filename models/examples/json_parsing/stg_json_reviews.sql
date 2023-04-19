{{
    config(
        materialized='table'
    )
}}


{{ json_to_model_sql( 
    source_or_model_name = 'json_reviews', 
    json_column = 'json', 
    is_source = true, 
    source_name = 'reviews' 
) }}