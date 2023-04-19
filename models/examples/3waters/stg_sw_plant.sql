{{
    config(
        materialized='table'
    )
}}
with col_mappings as (
    select
        value as mapping,
        filename,
        json_data.value:columnNames[0]::string as column_name,
        json_data.value:comments[0]::string as comments,
        json_data.value:mappingRule::string as mapping_rule,
        json_data.value:ntuStandardAttributeId::string as standard_attribute_id

    from (  
        select src:files[0]:columns as src,
        src:files[0]:filename as filename 

        from {{ source('recipe', 'raw_recipe') }}
    ) json_table,
    lateral flatten( input => json_table.src, recursive => false ) json_data
)
select column_name, standard_attribute_id

from col_mappings
where column_name is not null 