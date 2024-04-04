with union_ as (

{{ dbt_utils.union_relations(
    relations=[ref('model_1'),
               ref('model_2')]
) }}

)

select * from union_