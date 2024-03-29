{{
    config(
        materialized='table'
    )
}}
   
with source as (

    select * 
    {% if target.name == 'ci' %}
    from {{ ref('line_item__mock') }}
    {% else %}
    from {{ source('tpch', 'lineitem') }}
    {% endif %}
    

),

renamed as (

    select
    
        {{ dbt_utils.surrogate_key(
            ['l_orderkey', 
            'l_linenumber']) }}
                as order_item_key,
        l_orderkey as order_key,
        l_partkey as part_key,
        l_suppkey as supplier_key,
        l_linenumber as line_number,
        l_quantity as quantity,
        l_extendedprice as extended_price,
        l_discount as discount_percentage,
        l_tax as tax_rate,
        l_returnflag as return_flag,
        l_linestatus as status_code,
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date,
        l_shipinstruct as ship_instructions,
        l_shipmode as ship_mode,
        l_comment as comment

    from source
)

select * from renamed
order by 1 asc